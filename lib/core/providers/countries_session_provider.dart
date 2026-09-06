import 'package:flutter/foundation.dart';

import '../../di/service_locator.dart';
import '../../features/home/data/request/param/get_countries_params.dart';
import '../../features/home/domain/entity/country_entity.dart';
import '../../features/home/domain/usecase/get_manual_location_usecases.dart';

/// In-memory session cache for manual location picker data.
class CountriesSessionProvider extends ChangeNotifier {
  static final CountriesSessionProvider _instance =
      CountriesSessionProvider._internal();

  factory CountriesSessionProvider() => _instance;

  CountriesSessionProvider._internal();

  List<CountryEntity> _countries = [];
  final Map<String, List<String>> _citiesByCountry = {};
  bool _isLoadingCountries = false;

  bool get hasCountries => _countries.isNotEmpty;
  bool get isLoadingCountries => _isLoadingCountries;
  List<CountryEntity> get countries => List.unmodifiable(_countries);

  List<String>? citiesFor(String country) {
    final cities = _citiesByCountry[country];
    if (cities == null || cities.isEmpty) return null;
    return List.unmodifiable(cities);
  }

  Future<void> prefetchCountries() async {
    if (_countries.isNotEmpty || _isLoadingCountries) return;

    _isLoadingCountries = true;
    notifyListeners();

    final result = await getIt<GetCountriesUseCase>()(GetCountriesParams());
    result.pick(
      onData: (data) => setCountries(data.countries),
      onError: (_) {},
    );

    _isLoadingCountries = false;
    notifyListeners();
  }

  void setCountries(List<CountryEntity> countries) {
    if (countries.isEmpty) return;
    _countries = List<CountryEntity>.from(countries);
    notifyListeners();
  }

  void setCitiesForCountry(String country, List<String> cities) {
    if (country.isEmpty || cities.isEmpty) return;
    _citiesByCountry[country] = List<String>.from(cities);
    notifyListeners();
  }
}
