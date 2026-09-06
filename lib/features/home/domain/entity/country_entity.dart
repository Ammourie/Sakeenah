import '../../../../core/entities/base_entity.dart';

class CountryEntity extends BaseEntity {
  final String name;
  final String iso2;

  CountryEntity({
    required this.name,
    required this.iso2,
  });

  @override
  List<Object?> get props => [name, iso2];
}

class CountryListEntity extends BaseEntity {
  final List<CountryEntity> countries;

  CountryListEntity({required this.countries});

  @override
  List<Object?> get props => [countries];
}

class CityListEntity extends BaseEntity {
  final List<String> cities;

  CityListEntity({required this.cities});

  @override
  List<Object?> get props => [cities];
}
