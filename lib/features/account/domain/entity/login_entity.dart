import '../../../../core/entities/base_entity.dart';

class LoginEntity extends BaseEntity {
  final String? token;
  final bool isUserExist;

  LoginEntity({required this.isUserExist, required this.token});

  @override
  List<Object?> get props => [this.isUserExist, this.token];
}
