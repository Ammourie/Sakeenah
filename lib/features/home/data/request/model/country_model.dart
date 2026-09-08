import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/country_entity.dart';

class CountryModel extends BaseModel<CountryEntity> {
  final String name;
  final String countryCode;
  final int? geonameId;

  CountryModel({
    required this.name,
    required this.countryCode,
    this.geonameId,
  });

  factory CountryModel.fromMap(Map<String, dynamic> json) {
    return CountryModel(
      name: stringV(json['countryName']),
      countryCode: stringV(json['countryCode']),
      geonameId: numV<int>(json['geonameId']),
    );
  }

  factory CountryModel.fromCachedMap(Map<String, dynamic> json) {
    return CountryModel(
      name: stringV(json['name']),
      countryCode: stringV(json['countryCode']),
      geonameId: numV<int>(json['geonameId']),
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'countryCode': countryCode,
        if (geonameId != null) 'geonameId': geonameId,
      };

  @override
  CountryEntity toEntity() => CountryEntity(
        name: name,
        countryCode: countryCode,
        geonameId: geonameId,
      );
}

class CountryListModel extends BaseModel<CountryListEntity> {
  final List<CountryModel> countries;

  CountryListModel({required this.countries});

  factory CountryListModel.fromMap(dynamic json) {
    if (json is! List) {
      return CountryListModel(countries: const []);
    }

    final countries = json
        .whereType<Map>()
        .map((entry) => CountryModel.fromMap(Map<String, dynamic>.from(entry)))
        .where((country) => country.name.isNotEmpty && country.countryCode.isNotEmpty)
        .toList()
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return CountryListModel(countries: countries);
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

class AdminDivisionModel extends BaseModel<AdminDivisionEntity> {
  final String name;
  final String countryCode;
  final String adminCode1;
  final int? geonameId;

  AdminDivisionModel({
    required this.name,
    required this.countryCode,
    required this.adminCode1,
    this.geonameId,
  });

  factory AdminDivisionModel.fromMap(Map<String, dynamic> json) {
    return AdminDivisionModel(
      name: stringV(json['name']),
      countryCode: stringV(json['countryCode']),
      adminCode1: stringV(json['adminCode1']),
      geonameId: numV<int>(json['geonameId']),
    );
  }

  factory AdminDivisionModel.fromCachedMap(Map<String, dynamic> json) {
    return AdminDivisionModel(
      name: stringV(json['name']),
      countryCode: stringV(json['countryCode']),
      adminCode1: stringV(json['adminCode1']),
      geonameId: numV<int>(json['geonameId']),
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'countryCode': countryCode,
        'adminCode1': adminCode1,
        if (geonameId != null) 'geonameId': geonameId,
      };

  @override
  AdminDivisionEntity toEntity() => AdminDivisionEntity(
        name: name,
        countryCode: countryCode,
        adminCode1: adminCode1,
        geonameId: geonameId,
      );
}

class AdminDivisionListModel extends BaseModel<AdminDivisionListEntity> {
  final List<AdminDivisionModel> adminDivisions;

  AdminDivisionListModel({required this.adminDivisions});

  factory AdminDivisionListModel.fromMap(dynamic json) {
    if (json is! List) {
      return AdminDivisionListModel(adminDivisions: const []);
    }

    final adminDivisions = json
        .whereType<Map>()
        .map(
          (entry) => AdminDivisionModel.fromMap(Map<String, dynamic>.from(entry)),
        )
        .where(
          (division) =>
              division.name.isNotEmpty &&
              division.countryCode.isNotEmpty &&
              division.adminCode1.isNotEmpty,
        )
        .toList()
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return AdminDivisionListModel(adminDivisions: adminDivisions);
  }

  factory AdminDivisionListModel.fromCachedList(
    List<Map<String, dynamic>> cached,
  ) {
    return AdminDivisionListModel(
      adminDivisions: cached.map(AdminDivisionModel.fromCachedMap).toList(),
    );
  }

  List<Map<String, dynamic>> toCachedList() =>
      adminDivisions.map((division) => division.toMap()).toList();

  @override
  AdminDivisionListEntity toEntity() => AdminDivisionListEntity(
        adminDivisions:
            adminDivisions.map((division) => division.toEntity()).toList(),
      );
}

class CityModel extends BaseModel<CityEntity> {
  final String name;
  final String countryCode;
  final String adminCode1;
  final int? geonameId;

  CityModel({
    required this.name,
    required this.countryCode,
    required this.adminCode1,
    this.geonameId,
  });

  factory CityModel.fromMap(Map<String, dynamic> json) {
    return CityModel(
      name: stringV(json['name']),
      countryCode: stringV(json['countryCode']),
      adminCode1: stringV(json['adminCode1']),
      geonameId: numV<int>(json['geonameId']),
    );
  }

  factory CityModel.fromCachedMap(Map<String, dynamic> json) {
    return CityModel(
      name: stringV(json['name']),
      countryCode: stringV(json['countryCode']),
      adminCode1: stringV(json['adminCode1']),
      geonameId: numV<int>(json['geonameId']),
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'countryCode': countryCode,
        'adminCode1': adminCode1,
        if (geonameId != null) 'geonameId': geonameId,
      };

  @override
  CityEntity toEntity() => CityEntity(
        name: name,
        countryCode: countryCode,
        adminCode1: adminCode1,
        geonameId: geonameId,
      );
}

class CityListModel extends BaseModel<CityListEntity> {
  final List<CityModel> cities;

  CityListModel({required this.cities});

  factory CityListModel.fromMap(dynamic json) {
    if (json is! List) {
      return CityListModel(cities: const []);
    }

    final cities = json
        .whereType<Map>()
        .map((entry) => CityModel.fromMap(Map<String, dynamic>.from(entry)))
        .where((city) => city.name.isNotEmpty)
        .toList()
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return CityListModel(cities: cities);
  }

  factory CityListModel.fromCachedList(List<Map<String, dynamic>> cached) {
    return CityListModel(
      cities: cached.map(CityModel.fromCachedMap).toList(),
    );
  }

  List<Map<String, dynamic>> toCachedList() =>
      cities.map((city) => city.toMap()).toList();

  @override
  CityListEntity toEntity() => CityListEntity(
        cities: cities.map((city) => city.toEntity()).toList(),
      );
}
