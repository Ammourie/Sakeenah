import '../../../../../core/params/base_params.dart';

class EmptyQuranRadioParams extends BaseParams {
  EmptyQuranRadioParams({super.cancelToken});

  @override
  Map<String, dynamic> toMap() => {};
}

class SetQuranRadioVolumeParams extends BaseParams {
  SetQuranRadioVolumeParams({
    required this.volume,
    super.cancelToken,
  });

  final double volume;

  @override
  Map<String, dynamic> toMap() => {'volume': volume};
}

class SeekQuranRadioParams extends BaseParams {
  SeekQuranRadioParams({
    required this.offset,
    super.cancelToken,
  });

  final Duration offset;

  @override
  Map<String, dynamic> toMap() => {'offsetSeconds': offset.inSeconds};
}

class SeekQuranRadioToParams extends BaseParams {
  SeekQuranRadioToParams({
    required this.positionSeconds,
    super.cancelToken,
  });

  final int positionSeconds;

  @override
  Map<String, dynamic> toMap() => {'positionSeconds': positionSeconds};
}
