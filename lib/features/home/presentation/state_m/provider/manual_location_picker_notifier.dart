import 'package:flutter/material.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/navigation/nav.dart';
import '../../../../../core/providers/countries_session_provider.dart';
import '../../../../../core/results/result.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/request/param/get_cities_by_country_params.dart';
import '../../../data/request/param/get_countries_params.dart';
import '../../../domain/entity/country_entity.dart';
import '../../../domain/entity/location_preference_entity.dart';
import '../../../domain/usecase/get_manual_location_usecases.dart';
import '../../screen/manual_location_picker_screen.dart';

enum ManualLocationInputMode { countryCity, address }

class ManualLocationPickerNotifier
    extends ScreenNotifier<ManualLocationPickerScreenParam> {
  ManualLocationPickerNotifier(super.param);

  CountryEntity? _selectedCountry;
  String? _selectedCity;
  ManualLocationInputMode _inputMode = ManualLocationInputMode.countryCity;
  final TextEditingController manualAddressController = TextEditingController();

  CountryEntity? get selectedCountry => _selectedCountry;
  String? get selectedCity => _selectedCity;
  ManualLocationInputMode get inputMode => _inputMode;

  bool get canConfirm {
    if (_inputMode == ManualLocationInputMode.address) {
      return manualAddressController.text.trim().isNotEmpty;
    }
    return _selectedCountry != null &&
        (_selectedCity?.trim().isNotEmpty ?? false);
  }

  void setInputMode(ManualLocationInputMode mode) {
    if (_inputMode == mode) return;
    _inputMode = mode;
    _selectedCountry = null;
    _selectedCity = null;
    manualAddressController.clear();
    notifyListeners();
  }

  void selectCountry(CountryEntity? country) {
    _selectedCountry = country;
    _selectedCity = null;
    manualAddressController.clear();
    notifyListeners();
  }

  void selectCity(String? city) {
    _selectedCity = city;
    notifyListeners();
  }

  void onManualAddressChanged() {
    notifyListeners();
  }

  Future<Result<AppErrors, List<CountryEntity>>> fetchCountries() async {
    final session = CountriesSessionProvider();
    if (session.hasCountries) {
      return Result.data(session.countries);
    }

    final result = await getIt<GetCountriesUseCase>()(GetCountriesParams());
    if (result.hasDataOnly) {
      session.setCountries(result.data!.countries);
      return Result.data(result.data!.countries);
    }
    return Result.error(result.error!);
  }

  Future<Result<AppErrors, List<String>>> fetchCities() async {
    final country = _selectedCountry?.name;
    if (country == null || country.isEmpty) {
      return Result.data(const []);
    }

    final session = CountriesSessionProvider();
    final sessionCities = session.citiesFor(country);
    if (sessionCities != null) {
      return Result.data(sessionCities);
    }

    final result = await getIt<GetCitiesByCountryUseCase>()(
      GetCitiesByCountryParams(country: country),
    );
    if (result.hasDataOnly) {
      session.setCitiesForCountry(country, result.data!.cities);
      return Result.data(result.data!.cities);
    }
    return Result.error(result.error!);
  }

  void confirmSelection(BuildContext context) {
    if (_inputMode == ManualLocationInputMode.address) {
      final typedAddress = manualAddressController.text.trim();
      if (typedAddress.isEmpty) return;

      final location = LocationPreferenceEntity(
        source: LocationSource.manual,
        address: typedAddress,
        displayLabel: typedAddress,
      );
      Nav.pop(context, location);
      return;
    }

    final country = _selectedCountry;
    final city = _selectedCity?.trim();
    if (country == null || city == null || city.isEmpty) return;

    final location = LocationPreferenceEntity(
      source: LocationSource.manual,
      city: city,
      country: country.name,
      displayLabel: '$city, ${country.name}',
    );

    Nav.pop(context, location);
  }

  @override
  void closeNotifier() {
    manualAddressController.dispose();
    dispose();
  }
}
