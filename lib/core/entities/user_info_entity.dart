import '../constants/enums/user_type_enum.dart';
import 'base_entity.dart';

class UserInfoEntity extends BaseEntity {
  final int? id;
  final String fullName;
  final String phoneNumber;
  final UserType userType;

  UserInfoEntity({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.userType,
  });

  @override
  List<Object?> get props => [
    this.id,
    this.fullName,
    this.phoneNumber,
    this.userType,
  ];
}
