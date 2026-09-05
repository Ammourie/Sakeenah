import 'package:dio/dio.dart';
import '../../../../../core/params/base_params.dart';

class RegisterRequest extends BaseParams {
  RegisterRequest({
    required this.name,
    required this.surname,
    required this.phoneNumber,
    this.gender,
    this.emailAddress,
    this.dateOfBirth,
    CancelToken? cancelToken,
  }) : super(cancelToken: cancelToken!);

  final String name;
  final String surname;
  final String phoneNumber;
  final int? gender;
  final String? emailAddress;
  final DateTime? dateOfBirth;

  Map<String, dynamic> toMap() => {
    "name": name,
    "surname": surname,
    "phoneNumber": phoneNumber,
    if (gender != null) "gender": gender,
    if (emailAddress != null) "emailAddress": emailAddress,
    if (dateOfBirth != null) "dateOfBirth": dateOfBirth!.toIso8601String(),
  };
}
