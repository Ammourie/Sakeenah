import '../../../../core/entities/base_entity.dart';
class RefreshTokenEntity extends BaseEntity {
  final String accessToken;
  final String refreshToken;
  RefreshTokenEntity({required this.accessToken, required this.refreshToken});
  @override
  List<Object?> get props => [accessToken, refreshToken];
}

