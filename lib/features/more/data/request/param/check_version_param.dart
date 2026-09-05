import '../../../../../core/constants/enums/system_type.dart';
import '../../../../../core/params/base_params.dart';

class CheckVersionParam extends BaseParams {
  final SystemType? deviceType;

  CheckVersionParam({
    required this.deviceType,
  });

  @override
  Map<String, dynamic> toMap() => {
        if (deviceType != null) "deviceType": deviceType!.mapToInt,
      };
}
