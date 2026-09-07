import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../../core/audio/quran_radio_notification_art.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entity/radio_player_entity.dart';
import 'quran_radio_player.dart';

/// Background audio handler for Quran Radio — wraps [QuranRadioPlayer] for
/// notification, lock-screen, and headset controls via `audio_service`.
class QuranRadioAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler {
  QuranRadioAudioHandler(this._player) {
    unawaited(_init());
  }

  final QuranRadioPlayer _player;

  StreamSubscription<RadioPlayerEntity>? _playerSubscription;
  StreamSubscription<InternetStatus>? _connectivitySubscription;
  StreamSubscription<AudioInterruptionEvent>? _interruptionSubscription;

  AudioSession? _audioSession;
  RadioPlayerStatus? _previousPlayerStatus;
  bool _autoRestartOnReconnect = false;
  bool _pauseDueToInterruption = false;
  int _retryAttempts = 0;
  bool _retryScheduled = false;

  static const _maxRetryAttempts = 3;
  static const _retryDelay = Duration(seconds: 2);

  String? _lastProgressLabel;
  int? _lastBufferedSeconds;

  Future<void> _init() async {
    await _publishMediaItem();
    _syncPlaybackState(_player.currentState);

    _playerSubscription = _player.stream.listen(_onPlayerState);
    await _initAudioSession();
    _initConnectivity();
  }

  Future<void> _publishMediaItem() async {
    final artUri = await QuranRadioNotificationArt.resolveArtUri();
    final player = _player.currentState;

    mediaItem.add(
      MediaItem(
        id: AppConstants.QURAN_RADIO_MEDIA_ID,
        title: S.current.quranRadioTitle,
        artist: S.current.quranRadioLive,
        album: S.current.quranRadioTitle,
        displayTitle: S.current.quranRadioTitle,
        displaySubtitle: _progressLabelFor(player),
        displayDescription: S.current.quranRadioIdleHint,
        duration: _durationFor(player),
        artUri: artUri,
        genre: 'Religious',
        playable: true,
      ),
    );
    _lastProgressLabel = _progressLabelFor(player);
    _lastBufferedSeconds = player.bufferedSeconds;
  }

  Duration? _durationFor(RadioPlayerEntity player) {
    if (player.bufferedSeconds <= 0) return null;
    return Duration(seconds: player.bufferedSeconds);
  }

  String _progressLabelFor(RadioPlayerEntity player) {
    if (player.bufferedSeconds <= 0) {
      return switch (player.status) {
        RadioPlayerStatus.loading => S.current.quranRadioConnecting,
        RadioPlayerStatus.idle => S.current.quranRadioIdleHint,
        RadioPlayerStatus.paused => S.current.quranRadioPause,
        RadioPlayerStatus.error => S.current.quranRadioError,
        RadioPlayerStatus.playing => S.current.quranRadioLive,
      };
    }

    return S.current.quranRadioBufferProgress(
      _formatRadioSeconds(player.positionSeconds),
      _formatRadioSeconds(player.bufferedSeconds),
    );
  }

  String _formatRadioSeconds(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '${hours}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes}:${seconds.toString().padLeft(2, '0')}';
  }

  void _syncMediaProgress(RadioPlayerEntity player) {
    final label = _progressLabelFor(player);
    final buffered = player.bufferedSeconds;
    if (label == _lastProgressLabel && buffered == _lastBufferedSeconds) {
      return;
    }

    final current = mediaItem.value;
    if (current == null) return;

    _lastProgressLabel = label;
    _lastBufferedSeconds = buffered;

    mediaItem.add(
      current.copyWith(
        displaySubtitle: label,
        duration: _durationFor(player),
      ),
    );
  }

  Future<void> _initAudioSession() async {
    _audioSession = await AudioSession.instance;
    await _audioSession!.configure(const AudioSessionConfiguration.music());

    _interruptionSubscription =
        _audioSession!.interruptionEventStream.listen((event) {
      if (event.begin) {
        _onInterruptionBegin(event);
      } else {
        _onInterruptionEnd(event);
      }
    });
  }

  void _onInterruptionBegin(AudioInterruptionEvent event) {
    switch (event.type) {
      case AudioInterruptionType.duck:
        return;
      case AudioInterruptionType.pause:
      case AudioInterruptionType.unknown:
        final status = _player.currentState.status;
        if (status == RadioPlayerStatus.playing ||
            status == RadioPlayerStatus.loading) {
          _pauseDueToInterruption = true;
          unawaited(_player.pause());
        }
    }
  }

  void _onInterruptionEnd(AudioInterruptionEvent event) {
    switch (event.type) {
      case AudioInterruptionType.duck:
        return;
      case AudioInterruptionType.pause:
      case AudioInterruptionType.unknown:
        if (!_pauseDueToInterruption) return;
        _pauseDueToInterruption = false;
        unawaited(_resumeAfterInterruption());
    }
  }

  Future<void> _resumeAfterInterruption() async {
    await _audioSession?.setActive(true);
    await _player.play();
  }

  void _initConnectivity() {
    _connectivitySubscription =
        InternetConnection().onStatusChange.listen((status) {
      if (status == InternetStatus.connected) {
        unawaited(_tryAutoRestart());
        return;
      }
      _markAutoRestartIfPlaying();
    });
  }

  void _onPlayerState(RadioPlayerEntity player) {
    if (_previousPlayerStatus == RadioPlayerStatus.playing &&
        player.status == RadioPlayerStatus.error) {
      _autoRestartOnReconnect = true;
      _retryAttempts = 0;
    }
    _previousPlayerStatus = player.status;
    _syncPlaybackState(player);

    if (player.status == RadioPlayerStatus.playing) {
      _autoRestartOnReconnect = false;
      _retryAttempts = 0;
      _retryScheduled = false;
    }
  }

  void _markAutoRestartIfPlaying() {
    final status = _player.currentState.status;
    if (status == RadioPlayerStatus.playing ||
        status == RadioPlayerStatus.loading) {
      _autoRestartOnReconnect = true;
      _retryAttempts = 0;
    }
  }

  Future<void> _tryAutoRestart() async {
    if (!_autoRestartOnReconnect || _retryScheduled) return;

    if (_retryAttempts >= _maxRetryAttempts) {
      _autoRestartOnReconnect = false;
      _retryAttempts = 0;
      return;
    }

    _retryScheduled = true;
    _retryAttempts++;

    await Future<void>.delayed(_retryDelay);
    _retryScheduled = false;

    if (!_autoRestartOnReconnect) return;

    await _audioSession?.setActive(true);
    final result = await _player.retry();

    if (result.status == RadioPlayerStatus.error) {
      if (_retryAttempts < _maxRetryAttempts) {
        unawaited(_tryAutoRestart());
      } else {
        _autoRestartOnReconnect = false;
        _retryAttempts = 0;
      }
      return;
    }

    _autoRestartOnReconnect = false;
    _retryAttempts = 0;
  }

  void _syncPlaybackState(RadioPlayerEntity player) {
    _syncMediaProgress(player);

    final isPlaying = player.status == RadioPlayerStatus.playing;
    final processingState = _mapProcessingState(player.status);
    final controls = _buildControls(player, isPlaying);
    final canSeek = player.bufferedSeconds > 0 && !_isTerminalStatus(player.status);

    playbackState.add(
      playbackState.value.copyWith(
        controls: controls,
        systemActions: canSeek
            ? const {
                MediaAction.seek,
                MediaAction.seekForward,
                MediaAction.seekBackward,
              }
            : const {
                MediaAction.seekForward,
                MediaAction.seekBackward,
              },
        androidCompactActionIndices: _compactActionIndices(controls),
        processingState: processingState,
        playing: isPlaying,
        updatePosition: Duration(seconds: player.positionSeconds),
        bufferedPosition: Duration(seconds: player.bufferedSeconds),
        speed: 1.0,
        queueIndex: 0,
      ),
    );
  }

  bool _isTerminalStatus(RadioPlayerStatus status) {
    return status == RadioPlayerStatus.idle || status == RadioPlayerStatus.error;
  }

  List<int> _compactActionIndices(List<MediaControl> controls) {
    if (controls.isEmpty) return const [];

    // Collapsed notification: back, play/pause, forward — stop stays expanded-only.
    final indices = <int>[];
    for (var i = 0; i < controls.length; i++) {
      final action = controls[i].action;
      if (action == MediaAction.stop) continue;
      if (action == MediaAction.rewind ||
          action == MediaAction.fastForward ||
          action == MediaAction.pause ||
          action == MediaAction.play) {
        indices.add(i);
      }
      if (indices.length == 3) break;
    }

    if (indices.isNotEmpty) return indices;
    if (controls.length == 1) return const [0];
    return [0, controls.length - 1];
  }

  AudioProcessingState _mapProcessingState(RadioPlayerStatus status) {
    switch (status) {
      case RadioPlayerStatus.idle:
        return AudioProcessingState.idle;
      case RadioPlayerStatus.loading:
        return AudioProcessingState.loading;
      case RadioPlayerStatus.playing:
      case RadioPlayerStatus.paused:
        return AudioProcessingState.ready;
      case RadioPlayerStatus.error:
        return AudioProcessingState.error;
    }
  }

  List<MediaControl> _buildControls(RadioPlayerEntity player, bool isPlaying) {
    final controls = <MediaControl>[
      MediaControl(
        androidIcon: AppConstants.QURAN_RADIO_NOTIF_ICON_SKIP_BACK,
        label: S.current.quranRadioSkipBackward,
        action: MediaAction.rewind,
      ),
    ];

    if (isPlaying) {
      controls.add(
        MediaControl(
          androidIcon: AppConstants.QURAN_RADIO_NOTIF_ICON_PAUSE,
          label: S.current.quranRadioPause,
          action: MediaAction.pause,
        ),
      );
    } else {
      controls.add(
        MediaControl(
          androidIcon: AppConstants.QURAN_RADIO_NOTIF_ICON_PLAY,
          label: S.current.quranRadioPlay,
          action: MediaAction.play,
        ),
      );
    }

    controls.add(
      MediaControl(
        androidIcon: AppConstants.QURAN_RADIO_NOTIF_ICON_SKIP_FORWARD,
        label: S.current.quranRadioSkipForward,
        action: MediaAction.fastForward,
      ),
    );

    if (player.status != RadioPlayerStatus.idle) {
      controls.add(
        MediaControl(
          androidIcon: AppConstants.QURAN_RADIO_NOTIF_ICON_STOP,
          label: S.current.quranRadioStop,
          action: MediaAction.stop,
        ),
      );
    }

    return controls;
  }

  @override
  Future<void> play() async {
    _clearAutoRestart();
    await _audioSession?.setActive(true);
    await _player.play();
  }

  @override
  Future<void> pause() async {
    _clearAutoRestart();
    await _player.pause();
  }

  @override
  Future<void> stop() async {
    _clearAutoRestart();
    await _player.stop();
    await super.stop();
  }

  @override
  Future<void> seek(Duration position) async {
    await _player.seekTo(position.inSeconds);
  }

  @override
  Future<void> rewind() async {
    await _player.seekBy(
      const Duration(seconds: -AppConstants.QURAN_RADIO_SEEK_STEP_SECONDS),
    );
  }

  @override
  Future<void> fastForward() async {
    await _player.seekBy(
      const Duration(seconds: AppConstants.QURAN_RADIO_SEEK_STEP_SECONDS),
    );
  }

  void _clearAutoRestart() {
    _autoRestartOnReconnect = false;
    _retryAttempts = 0;
    _retryScheduled = false;
  }

  @override
  Future<void> onTaskRemoved() async {
    await stop();
    await super.onTaskRemoved();
  }

  Future<void> disposeHandler() async {
    _clearAutoRestart();
    await _playerSubscription?.cancel();
    await _connectivitySubscription?.cancel();
    await _interruptionSubscription?.cancel();
    _playerSubscription = null;
    _connectivitySubscription = null;
    _interruptionSubscription = null;
  }
}
