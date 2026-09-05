import 'dart:convert';

import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/confirm_code_entity.dart';

class ConfirmCodeModel extends BaseModel<ConfirmCodeEntity> {
  final String accessToken;
  final String refreshToken;

  ConfirmCodeModel({required this.accessToken, required this.refreshToken});

  factory ConfirmCodeModel.fromJson(String str) =>
      ConfirmCodeModel.fromMap(json.decode(str));

  factory ConfirmCodeModel.fromMap(Map<String, dynamic> json) =>
      ConfirmCodeModel(
        accessToken: stringV(json["accessToken"]),
        refreshToken: stringV(json["refreshToken"]),
      );

  @override
  ConfirmCodeEntity toEntity() {
    return ConfirmCodeEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
