import '../../../../../../core/common/type_validators.dart';
import '../../../../../../core/models/base_model.dart';
import '../../../domain/entity/refresh_token_entity.dart';

class RefreshTokenModel extends BaseModel<RefreshTokenEntity> {
  final String accessToken;
  final String refreshToken;
  RefreshTokenModel({required this.accessToken, required this.refreshToken});
  static RefreshTokenModel fromMap(Map<String, dynamic> map) =>
      RefreshTokenModel(
        accessToken: stringV(map['accessToken']),
        refreshToken: stringV(map['refreshToken']),
      );
  @override
  RefreshTokenEntity toEntity() {
    return RefreshTokenEntity(accessToken: accessToken, refreshToken: refreshToken);
  }
}
