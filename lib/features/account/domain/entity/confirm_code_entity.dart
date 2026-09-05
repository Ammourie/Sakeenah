import '../../../../core/entities/base_entity.dart';

class ConfirmCodeEntity extends BaseEntity {
  final String accessToken;
  final String refreshToken;

  ConfirmCodeEntity({required this.accessToken, required this.refreshToken});

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
