import '../../../../core/entities/base_entity.dart';

class ProfileEntity extends BaseEntity {
  ProfileEntity({
    required this.name,
    required this.surname,
    required this.phoneNumber,
  });

  final String name;
  final String surname;
  final String phoneNumber;

  @override
  List<Object?> get props => [this.name, this.surname, this.phoneNumber];
}
