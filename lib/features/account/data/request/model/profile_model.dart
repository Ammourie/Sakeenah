import 'dart:convert';

import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/profile_entity.dart';

class ProfileModel extends BaseModel<ProfileEntity> {
  ProfileModel({
    required this.name,
    required this.surname,
    required this.phoneNumber,
  });

  final String name;
  final String surname;
  final String phoneNumber;

  factory ProfileModel.fromJson(String str) =>
      ProfileModel.fromMap(json.decode(str));

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
    name: stringV(json["name"]),
    surname: stringV(json["surname"]),
    phoneNumber: stringV(json["phoneNumber"]),
  );

  @override
  ProfileEntity toEntity() {
    return ProfileEntity(
      name: name,
      surname: surname,
      phoneNumber: phoneNumber,
    );
  }
}
