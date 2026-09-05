import '../../../../core/entities/base_entity.dart';
import '../../../account/domain/entity/profile_entity.dart';

class SplashEntity extends BaseEntity {
  SplashEntity({
    required this.profile,
  });

  final ProfileEntity? profile;

  @override
  List<Object?> get props => [];
}
