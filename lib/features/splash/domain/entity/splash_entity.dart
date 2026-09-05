import '../../../../core/entities/base_entity.dart';
import '../../../account/domain/entity/profile_entity.dart';
import '../../../more/domain/entity/version_entity.dart';

class SplashEntity extends BaseEntity {
  SplashEntity({
    required this.version,
    required this.profile,
  });

  final VersionEntity version;
  final ProfileEntity? profile;

  @override
  List<Object?> get props => [];
}
