import '../../../../../core/entities/base_entity.dart';
import '../../../../core/common/app_config.dart';

class VersionEntity extends BaseEntity {
  final String appLink;
  final int lastSupportedVersion;
  final int lastVersion;
  final _currentBuild = int.tryParse(AppConfig().buildNumber) ?? 1;

  VersionEntity({
    required this.appLink,
    required this.lastSupportedVersion,
    required this.lastVersion,
  });

  bool get needUpdate => lastVersion > _currentBuild;
  bool get forceUpdate => lastSupportedVersion > _currentBuild;


  @override
  List<Object?> get props => [
        appLink,
        lastSupportedVersion,
        lastVersion,
      ];
}
