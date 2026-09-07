import 'dart:async';
import 'dart:developer';

import 'package:Sakeenah/features/home/domain/entity/radio_player_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/results/result.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/request/param/quran_radio_params.dart';
import '../../../domain/usecase/pause_quran_radio_usecase.dart';
import '../../../domain/usecase/play_quran_radio_usecase.dart';
import '../../../domain/usecase/retry_quran_radio_usecase.dart';
import '../../../domain/usecase/seek_quran_radio_to_usecase.dart';
import '../../../domain/usecase/seek_quran_radio_usecase.dart';
import '../../../domain/usecase/set_quran_radio_volume_usecase.dart';
import '../../../domain/usecase/stop_quran_radio_usecase.dart';
import '../../../domain/usecase/watch_quran_radio_usecase.dart';

part 'quran_radio_cubit.freezed.dart';
part 'quran_radio_state.dart';

class QuranRadioCubit extends Cubit<QuranRadioState> {
  QuranRadioCubit() : super(const QuranRadioState.initial()) {
    unawaited(_bootstrapRadio());
  }

  StreamSubscription<RadioPlayerEntity>? _radioSubscription;
  int _radioSession = 0;
  bool _autoRestartOnReconnect = false;
  RadioPlayerStatus? _previousPlayerStatus;

  RadioPlayerEntity get _currentPlayer => state.maybeWhen(
        loaded: (player) => player,
        orElse: () => RadioPlayerEntity.initial,
      );

  /// Stops any prior playback and subscribes to player updates.
  Future<void> _bootstrapRadio() async {
    final session = ++_radioSession;

    final res = await getIt<StopQuranRadioUseCase>()(EmptyQuranRadioParams());
    if (session != _radioSession || isClosed) return;

    res.pick(
      onData: (data) => safeEmit(QuranRadioState.loaded(player: data)),
      onError: (error) => safeEmit(
        QuranRadioState.error(
          error: error,
          callback: () => unawaited(_bootstrapRadio()),
        ),
      ),
    );

    if (session != _radioSession || isClosed) return;

    _radioSubscription = getIt<WatchQuranRadioUseCase>()().listen((player) {
      if (_previousPlayerStatus == RadioPlayerStatus.playing &&
          player.status == RadioPlayerStatus.error) {
        _autoRestartOnReconnect = true;
      }
      _previousPlayerStatus = player.status;
      safeEmit(QuranRadioState.loaded(player: player));
    });
  }

  /// Marks active playback for auto-retry when connectivity returns.
  void onInternetConnectivityChanged({required bool hasInternet}) {
    if (!hasInternet) {
      _markAutoRestartIfPlaying();
      return;
    }
    _tryAutoRestart();
  }

  void _markAutoRestartIfPlaying() {
    final player = _currentPlayer;
    if (player.status == RadioPlayerStatus.playing ||
        player.status == RadioPlayerStatus.loading) {
      _autoRestartOnReconnect = true;
    }
  }

  void _tryAutoRestart() {
    if (!_autoRestartOnReconnect || isClosed) return;
    _autoRestartOnReconnect = false;
    retryRadio();
  }

  void _clearAutoRestart() {
    _autoRestartOnReconnect = false;
  }

  void safeEmit(QuranRadioState state) {
    try {
      emit(state);
    } catch (e) {
      log(e.toString());
    }
  }

  void playRadio() async {
    final res = await getIt<PlayQuranRadioUseCase>()(EmptyQuranRadioParams());
    _handleActionResult(res, onRetry: playRadio);
  }

  void pauseRadio() async {
    _clearAutoRestart();
    final res = await getIt<PauseQuranRadioUseCase>()(EmptyQuranRadioParams());
    _handleActionResult(res, onRetry: pauseRadio);
  }

  void setRadioVolume(double volume) async {
    final res = await getIt<SetQuranRadioVolumeUseCase>()(
      SetQuranRadioVolumeParams(volume: volume),
    );
    _handleActionResult(res, onRetry: () => setRadioVolume(volume));
  }

  void retryRadio() async {
    final res = await getIt<RetryQuranRadioUseCase>()(EmptyQuranRadioParams());
    _handleActionResult(res, onRetry: retryRadio);
  }

  void stopRadio() async {
    _clearAutoRestart();
    final res = await getIt<StopQuranRadioUseCase>()(EmptyQuranRadioParams());
    _handleActionResult(res, onRetry: stopRadio);
  }

  void seekRadioBackward() async {
    final res = await getIt<SeekQuranRadioUseCase>()(
      SeekQuranRadioParams(
        offset: const Duration(
          seconds: -AppConstants.QURAN_RADIO_SEEK_STEP_SECONDS,
        ),
      ),
    );
    _handleActionResult(res, onRetry: seekRadioBackward);
  }

  void seekRadioForward() async {
    final res = await getIt<SeekQuranRadioUseCase>()(
      SeekQuranRadioParams(
        offset: const Duration(
          seconds: AppConstants.QURAN_RADIO_SEEK_STEP_SECONDS,
        ),
      ),
    );
    _handleActionResult(res, onRetry: seekRadioForward);
  }

  void seekRadioToProgress(double progress) async {
    final buffered = _currentPlayer.bufferedSeconds;
    if (buffered <= 0) return;

    final targetSeconds = (progress.clamp(0.0, 1.0) * buffered).round();
    final res = await getIt<SeekQuranRadioToUseCase>()(
      SeekQuranRadioToParams(positionSeconds: targetSeconds),
    );
    _handleActionResult(
      res,
      onRetry: () => seekRadioToProgress(progress),
    );
  }

  void _handleActionResult(
    Result<AppErrors, RadioPlayerEntity> res, {
    required VoidCallback onRetry,
  }) {
    res.pick(
      onData: (RadioPlayerEntity data) =>
          safeEmit(QuranRadioState.loaded(player: data)),
      onError: (AppErrors error) {
        final player = _currentPlayer;
        if (player.status == RadioPlayerStatus.error) {
          safeEmit(QuranRadioState.loaded(player: player));
          return;
        }
        safeEmit(QuranRadioState.error(error: error, callback: onRetry));
      },
    );
  }

  @override
  Future<void> close() async {
    _radioSession++;
    await _radioSubscription?.cancel();
    _radioSubscription = null;
    return super.close();
  }
}
