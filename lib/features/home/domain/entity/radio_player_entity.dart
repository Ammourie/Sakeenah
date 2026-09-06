import '../../../../core/entities/base_entity.dart';

enum RadioPlayerStatus {
  idle,
  loading,
  playing,
  paused,
  error,
}

class RadioPlayerEntity extends BaseEntity {
  const RadioPlayerEntity({
    this.status = RadioPlayerStatus.idle,
    this.volume = 1.0,
    this.canSeekBackward = false,
    this.canSeekForward = false,
    this.positionSeconds = 0,
    this.bufferedSeconds = 0,
    this.errorMessage,
  });

  static const initial = RadioPlayerEntity();

  final RadioPlayerStatus status;
  final double volume;
  final bool canSeekBackward;
  final bool canSeekForward;
  final int positionSeconds;
  final int bufferedSeconds;
  final String? errorMessage;

  double get playbackProgress {
    if (bufferedSeconds <= 0) return 0;
    return (positionSeconds / bufferedSeconds).clamp(0.0, 1.0);
  }

  RadioPlayerEntity copyWith({
    RadioPlayerStatus? status,
    double? volume,
    bool? canSeekBackward,
    bool? canSeekForward,
    int? positionSeconds,
    int? bufferedSeconds,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return RadioPlayerEntity(
      status: status ?? this.status,
      volume: volume ?? this.volume,
      canSeekBackward: canSeekBackward ?? this.canSeekBackward,
      canSeekForward: canSeekForward ?? this.canSeekForward,
      positionSeconds: positionSeconds ?? this.positionSeconds,
      bufferedSeconds: bufferedSeconds ?? this.bufferedSeconds,
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        status,
        volume,
        canSeekBackward,
        canSeekForward,
        positionSeconds,
        bufferedSeconds,
        errorMessage,
      ];
}
