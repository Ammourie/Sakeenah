import '../common/type_validators.dart';
import '../constants/enums/user_type_enum.dart';
import '../entities/user_info_entity.dart';
import 'base_model.dart';

class UserInfoModel extends BaseModel<UserInfoEntity> {
  final int? id;
  final String fullName;
  final String phoneNumber;
  final int? userType;

  UserInfoModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.userType,
  });

  factory UserInfoModel.fromMap(Map<String, dynamic> json) => UserInfoModel(
    id: numV(json["id"]),
    fullName: stringV(json["fullName"]),
    phoneNumber: stringV(json["phoneNumber"]),
    userType: numV(json["userType"]),
  );

  @override
  UserInfoEntity toEntity() {
    return UserInfoEntity(
      id: id,
      fullName: fullName,
      phoneNumber: phoneNumber,
      userType: UserType.mapToType(userType),
    );
  }
}
