import '../../../../core/entities/base_entity.dart';

class CountryEntity extends BaseEntity {
  final String name;
  final String countryCode;
  final int? geonameId;

  CountryEntity({
    required this.name,
    required this.countryCode,
    this.geonameId,
  });

  @override
  List<Object?> get props => [name, countryCode, geonameId];
}

class CountryListEntity extends BaseEntity {
  final List<CountryEntity> countries;

  CountryListEntity({required this.countries});

  @override
  List<Object?> get props => [countries];
}

class AdminDivisionEntity extends BaseEntity {
  final String name;
  final String countryCode;
  final String adminCode1;
  final int? geonameId;

  AdminDivisionEntity({
    required this.name,
    required this.countryCode,
    required this.adminCode1,
    this.geonameId,
  });

  @override
  List<Object?> get props => [name, countryCode, adminCode1, geonameId];
}

class AdminDivisionListEntity extends BaseEntity {
  final List<AdminDivisionEntity> adminDivisions;

  AdminDivisionListEntity({required this.adminDivisions});

  @override
  List<Object?> get props => [adminDivisions];
}

class CityEntity extends BaseEntity {
  final String name;
  final String countryCode;
  final String adminCode1;
  final int? geonameId;

  CityEntity({
    required this.name,
    required this.countryCode,
    required this.adminCode1,
    this.geonameId,
  });

  @override
  List<Object?> get props => [name, countryCode, adminCode1, geonameId];
}

class CityListEntity extends BaseEntity {
  final List<CityEntity> cities;

  CityListEntity({required this.cities});

  @override
  List<Object?> get props => [cities];
}
