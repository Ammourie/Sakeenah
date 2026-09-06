import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/country_entity.dart';

class CountryModel extends BaseModel<CountryEntity> {
  final String name;
  final String iso2;

  CountryModel({
    required this.name,
    required this.iso2,
  });

  factory CountryModel.fromMap(Map<String, dynamic> json) {
    return CountryModel(
      name: stringV(json['country']),
      iso2: stringV(json['iso2']),
    );
  }

  factory CountryModel.fromCachedMap(Map<String, dynamic> json) {
    return CountryModel(
      name: stringV(json['name']),
      iso2: stringV(json['iso2']),
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'iso2': iso2,
      };

  @override
  CountryEntity toEntity() => CountryEntity(name: name, iso2: iso2);
}

class CountryListModel extends BaseModel<CountryListEntity> {
  final List<CountryModel> countries;

  CountryListModel({required this.countries});

  factory CountryListModel.fromMap(dynamic json) {
    if (json is! List) {
      return CountryListModel(countries: const []);
    }

    return CountryListModel(
      countries: json
          .whereType<Map>()
          .map((entry) => CountryModel.fromMap(Map<String, dynamic>.from(entry)))
          .where((country) => country.name.isNotEmpty)
          .toList(),
    );
  }

  factory CountryListModel.fromCachedList(List<Map<String, dynamic>> cached) {
    return CountryListModel(
      countries: cached.map(CountryModel.fromCachedMap).toList(),
    );
  }

  List<Map<String, dynamic>> toCachedList() =>
      countries.map((country) => country.toMap()).toList();

  @override
  CountryListEntity toEntity() => CountryListEntity(
        countries: countries.map((country) => country.toEntity()).toList(),
      );
}

class CityListModel extends BaseModel<CityListEntity> {
  final List<String> cities;

  CityListModel({required this.cities});

  factory CityListModel.fromMap(dynamic json) {
    if (json is! List) {
      return CityListModel(cities: const []);
    }

    return CityListModel(
      cities: json.map((entry) => stringV(entry)).where((city) => city.isNotEmpty).toList(),
    );
  }

  @override
  CityListEntity toEntity() => CityListEntity(cities: cities);
}
