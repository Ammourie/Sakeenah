import 'dart:convert';

import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/login_entity.dart';

class LoginModel extends BaseModel<LoginEntity> {
  final String? token;
  final bool isUserExist;

  LoginModel({required this.isUserExist, required this.token});

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
    isUserExist: boolV(json["isUserExist"]),
    token: stringV(json["token"]),
  );

  @override
  LoginEntity toEntity() {
    return LoginEntity(isUserExist: isUserExist, token: token);
  }
}
