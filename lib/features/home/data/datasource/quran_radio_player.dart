import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../domain/entity/radio_player_entity.dart';

/// Live Quran radio engine for the home feature.
///
/// Streams [AppConstants.QURAN_RADIO_STREAM_URL] through Dio and feeds PCM/MP3
/// chunks into [SoLoud] via [SoLoud.setBufferStream] with
/// [BufferingType.preserved] (client-side RAM buffer, capped by
/// [AppConstants.QURAN_RADIO_MAX_BUFFER_DURATION_SECONDS]).
///
/// **Architecture:** `@lazySingleton` consumed only through [HomeRemoteSource] /
/// [IHomeRepository] — not from UI or cubits directly.
///
/// **State:** Emits [RadioPlayerEntity] on [stream] after each change. UI layers
/// map this to [QuranRadioState] via use cases and [QuranRadioCubit].
///
/// **Seeking:** [seekBy] / [seekTo] operate within the preserved buffer only —
/// not a full broadcast timeline rewind.
///
/// **Lifecycle:** Call [stop] to cancel HTTP and reset to idle while keeping the
/// SoLoud engine. Call [dispose] once when tearing down the app/DI scope.
@lazySingleton
class QuranRadioPlayer {
  QuranRadioPlayer();

  /// HTTP client for the Icecast stream (`Icy-MetaData: 1` for MP3 metadata).
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: Duration.zero,
      headers: const {'Icy-MetaData': '1'},
    ),
  );

  final StreamController<RadioPlayerEntity> _stateController =
      StreamController<RadioPlayerEntity>.broadcast();

  RadioPlayerEntity _state = RadioPlayerEntity.initial;
  bool _initialized = false;
  bool _disposed = false;
  bool _sourcePrepared = false;
  bool _isBuffering = false;

  AudioSource? _source;
  SoundHandle? _handle;
  StreamSubscription<List<int>>? _httpSubscription;
  CancelToken? _cancelToken;
  Timer? _positionTimer;
  bool _icyMetaIntSent = false;
  bool _httpDisconnected = false;
  Future<void>? _teardownInProgress;

  /// Broadcast of the latest [RadioPlayerEntity] (position, buffer, status, volume).
  Stream<RadioPlayerEntity> get stream => _stateController.stream;

  /// Last emitted state; safe to read synchronously from repository/use cases.
  RadioPlayerEntity get currentState => _state;

  /// Prepares SoLoud + buffer stream + HTTP ingest without starting playback.
  ///
  /// Idempotent while [_sourcePrepared] is true. Emits [RadioPlayerStatus.loading]
  /// then [RadioPlayerStatus.paused] on success, or [RadioPlayerStatus.error].
  Future<void> init() async {
    if (_disposed || _sourcePrepared) return;

    _emit(
      _state.copyWith(
        status: RadioPlayerStatus.loading,
        clearErrorMessage: true,
      ),
    );

    try {
      await _ensureInitialized();
      await _prepareStream();
      if (_disposed || _source == null || _handle == null) return;
      _sourcePrepared = true;
      _emit(
        _state.copyWith(
          status: RadioPlayerStatus.paused,
          clearErrorMessage: true,
        ),
      );
    } catch (error) {
      _emit(
        _state.copyWith(
          status: RadioPlayerStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  /// Resumes playback after [init]. No-op when in [RadioPlayerStatus.error].
  Future<RadioPlayerEntity> play() async {
    if (_disposed) return _state;

    await init();

    if (_state.status == RadioPlayerStatus.error || _handle == null) {
      return _state;
    }

    try {
      SoLoud.instance.setPause(_handle!, false);
      _refreshStatus();
    } catch (error) {
      _emit(
        _state.copyWith(
          status: RadioPlayerStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }

    return _state;
  }

  /// Pauses the active voice without tearing down the buffer or HTTP stream.
  Future<RadioPlayerEntity> pause() async {
    if (_disposed || _handle == null) return _state;

    try {
      SoLoud.instance.setPause(_handle!, true);
      _refreshStatus();
    } catch (error) {
      _emit(
        _state.copyWith(
          status: RadioPlayerStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }

    return _state;
  }

  /// Seeks relative to the current position (e.g. ±10s skip buttons).
  ///
  /// Clamped to `[Duration.zero, bufferedLength - slack]` inside [_seekToDuration].
  Future<RadioPlayerEntity> seekBy(Duration offset) async {
    if (_disposed || !_sourcePrepared || _handle == null || _source == null) {
      return _state;
    }

    try {
      final position = SoLoud.instance.getPosition(_handle!);
      await _seekToDuration(position + offset);
    } catch (_) {}

    return _state;
  }

  /// Seeks to an absolute position in seconds within the preserved buffer.
  Future<RadioPlayerEntity> seekTo(int positionSeconds) async {
    if (_disposed || !_sourcePrepared || _handle == null || _source == null) {
      return _state;
    }

    try {
      await _seekToDuration(Duration(seconds: positionSeconds));
    } catch (_) {}

    return _state;
  }

  /// Applies [target] to SoLoud, clamped against buffered [length] minus [slack].
  Future<void> _seekToDuration(Duration target) async {
    if (_handle == null || _source == null) return;

    final length = SoLoud.instance.getLength(_source!);
    const slack = Duration(milliseconds: 500);

    var clamped = target;
    if (clamped.isNegative) {
      clamped = Duration.zero;
    } else if (clamped > length - slack) {
      clamped = length - slack;
    }

    SoLoud.instance.seek(_handle!, clamped);
    _refreshStatus();
  }

  /// Clamps [volume] to `0..1` and applies it to the SoLoud voice when active.
  Future<RadioPlayerEntity> setVolume(double volume) async {
    if (_disposed) return _state;

    final clamped = volume.clamp(0.0, 1.0);
    _emit(_state.copyWith(volume: clamped));

    if (_handle == null) return _state;

    try {
      SoLoud.instance.setVolume(_handle!, clamped);
    } catch (error) {
      _emit(
        _state.copyWith(
          status: RadioPlayerStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }

    return _state;
  }

  /// Tears down the current stream and runs [init] + [play] again.
  ///
  /// Preserves the last [RadioPlayerEntity.volume].
  Future<RadioPlayerEntity> retry() async {
    if (_disposed) return _state;

    _sourcePrepared = false;
    await _teardownStream();

    _emit(RadioPlayerEntity.initial.copyWith(volume: _state.volume));
    await init();
    return play();
  }

  /// Stops playback, cancels HTTP, clears the buffer, and returns to idle.
  ///
  /// Preserves [RadioPlayerEntity.volume]. The next [play] runs [init] again.
  /// Used by [StopQuranRadioUseCase] and the app restart hook before hot reset.
  Future<RadioPlayerEntity> stop() async {
    if (_disposed) return _state;

    _sourcePrepared = false;
    await _teardownStream();

    _emit(RadioPlayerEntity.initial.copyWith(volume: _state.volume));
    return _state;
  }

  /// Permanently shuts down the player, stream controller, and SoLoud engine.
  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;

    await _teardownStream();
    await _stateController.close();

    if (_initialized) {
      try {
        if (SoLoud.instance.isInitialized) {
          await SoLoud.instance.deinitAsync();
        }
      } catch (_) {}
      _initialized = false;
    }
  }

  /// One-time [SoLoud.instance.init]; skipped after first call or [dispose].
  Future<void> _ensureInitialized() async {
    if (_disposed) return;
    if (_initialized && SoLoud.instance.isInitialized) return;

    await SoLoud.instance.init();
    _initialized = true;
  }

  /// Creates a preserved buffer source, starts a paused voice, and opens HTTP.
  Future<void> _prepareStream() async {
    await _teardownStream(keepEngine: true);

    _source = SoLoud.instance.setBufferStream(
      maxBufferSizeDuration: const Duration(
        seconds: AppConstants.QURAN_RADIO_MAX_BUFFER_DURATION_SECONDS,
      ),
      bufferingType: BufferingType.preserved,
      bufferingTimeNeeds: 2,
      format: BufferType.auto,
      onBuffering: (isBuffering, handle, time) {
        _isBuffering = isBuffering;
        _refreshStatus();
      },
    );

    _handle = SoLoud.instance.play(
      _source!,
      volume: _state.volume,
      paused: true,
    );

    await _connectHttp();
    _startPositionTimer();
  }

  /// Opens a Dio streaming GET and pipes bytes into [SoLoud.addAudioDataStream].
  ///
  /// Reads `icy-metaint` from response headers once and forwards it to SoLoud.
  Future<void> _connectHttp() async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();
    _icyMetaIntSent = false;
    _httpDisconnected = false;

    final response = await _dio.get<ResponseBody>(
      AppConstants.QURAN_RADIO_STREAM_URL,
      options: Options(
        responseType: ResponseType.stream,
        followRedirects: true,
        validateStatus: (status) => status != null && status < 400,
      ),
      cancelToken: _cancelToken,
    );

    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode}');
    }

    final icyMetaIntHeader = response.headers.value('icy-metaint');

    _httpSubscription = response.data!.stream.listen(
      (data) {
        if (_disposed || _source == null) return;

        if (!_icyMetaIntSent) {
          _icyMetaIntSent = true;
          final metaInt = int.tryParse(icyMetaIntHeader ?? '0') ?? 0;
          if (metaInt > 0) {
            SoLoud.instance.setBufferIcyMetaInt(_source!, metaInt);
          }
        }

        try {
          SoLoud.instance.addAudioDataStream(
            _source!,
            Uint8List.fromList(data),
          );
        } on SoLoudStreamEndedAlreadyCppException {
          // Live stream hit max buffer — keep playing what we have.
        } catch (error) {
          if (!_disposed) {
            _emit(
              _state.copyWith(
                status: RadioPlayerStatus.error,
                errorMessage: error.toString(),
              ),
            );
          }
        }
      },
      onError: (Object error) {
        if (_disposed) return;
        _httpDisconnected = true;
        _emit(
          _state.copyWith(
            status: RadioPlayerStatus.error,
            errorMessage: error.toString(),
          ),
        );
      },
      onDone: () {
        if (_disposed) return;
        _httpDisconnected = true;
        _refreshStatus();
      },
    );
  }

  /// Polls position/buffer every 500ms while a stream is prepared.
  void _startPositionTimer() {
    _positionTimer?.cancel();
    _positionTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (_disposed || !_sourcePrepared) return;
      _refreshStatus();
    });
  }

  /// Recomputes status + seek metrics and emits when something changed.
  void _refreshStatus() {
    if (_disposed || _state.status == RadioPlayerStatus.error) return;

    final metrics = _readPlaybackMetrics();
    var status = _resolveStatus();

    if (_httpDisconnected &&
        metrics.$4 > 0 &&
        metrics.$3 >= metrics.$4 - 1 &&
        (status == RadioPlayerStatus.playing ||
            status == RadioPlayerStatus.paused)) {
      _emit(
        _state.copyWith(
          status: RadioPlayerStatus.error,
          clearErrorMessage: true,
        ),
      );
      return;
    }

    if (status == _state.status &&
        metrics.$1 == _state.canSeekBackward &&
        metrics.$2 == _state.canSeekForward &&
        metrics.$3 == _state.positionSeconds &&
        metrics.$4 == _state.bufferedSeconds) {
      return;
    }

    _emit(
      _state.copyWith(
        status: status,
        canSeekBackward: metrics.$1,
        canSeekForward: metrics.$2,
        positionSeconds: metrics.$3,
        bufferedSeconds: metrics.$4,
      ),
    );
  }

  /// Maps SoLoud pause/buffer flags to [RadioPlayerStatus].
  RadioPlayerStatus _resolveStatus() {
    if (_isBuffering) {
      return RadioPlayerStatus.loading;
    }

    if (_handle != null) {
      try {
        if (!SoLoud.instance.getPause(_handle!)) {
          return RadioPlayerStatus.playing;
        }
      } catch (_) {}
    }

    if (_sourcePrepared) {
      return RadioPlayerStatus.paused;
    }

    return RadioPlayerStatus.idle;
  }

  /// Returns `(canSeekBack, canSeekForward, positionSec, bufferedSec)`.
  (bool, bool, int, int) _readPlaybackMetrics() {
    if (_handle == null || _source == null || !_sourcePrepared) {
      return (false, false, 0, 0);
    }

    try {
      final position = SoLoud.instance.getPosition(_handle!);
      final length = SoLoud.instance.getLength(_source!);
      const step = Duration(
        seconds: AppConstants.QURAN_RADIO_SEEK_STEP_SECONDS,
      );
      const slack = Duration(milliseconds: 500);

      final canSeekBackward = position > Duration.zero;
      final canSeekForward = position + step < length - slack;

      return (
        canSeekBackward,
        canSeekForward,
        position.inSeconds,
        length.inSeconds,
      );
    } catch (_) {
      return (false, false, 0, 0);
    }
  }

  /// Cancels HTTP/timer, disposes SoLoud sources; optionally keeps the engine.
  Future<void> _teardownStream({bool keepEngine = false}) async {
    while (_teardownInProgress != null) {
      try {
        await _teardownInProgress;
      } catch (_) {}
    }

    final operation = _teardownStreamImpl(keepEngine: keepEngine);
    _teardownInProgress = operation;
    try {
      await operation;
    } finally {
      if (_teardownInProgress == operation) {
        _teardownInProgress = null;
      }
    }
  }

  Future<void> _teardownStreamImpl({bool keepEngine = false}) async {
    _positionTimer?.cancel();
    _positionTimer = null;

    await _httpSubscription?.cancel();
    _httpSubscription = null;

    _cancelToken?.cancel('teardown');
    _cancelToken = null;

    final sourceToDispose = _source;
    _source = null;
    _handle = null;
    _icyMetaIntSent = false;
    _isBuffering = false;
    _httpDisconnected = false;

    if (!_initialized || _disposed || !SoLoud.instance.isInitialized) {
      if (!SoLoud.instance.isInitialized) {
        _initialized = false;
      }
      return;
    }

    try {
      if (sourceToDispose != null &&
          SoLoud.instance.isValidAudioSource(sourceToDispose)) {
        await SoLoud.instance.disposeSource(sourceToDispose);
      }
    } catch (_) {}
  }

  void _emit(RadioPlayerEntity next) {
    _state = next;
    if (!_stateController.isClosed) {
      _stateController.add(next);
    }
  }
}
