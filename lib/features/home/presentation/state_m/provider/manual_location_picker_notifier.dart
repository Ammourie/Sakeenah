import 'package:flutter/material.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/localization/localization_provider.dart';
import '../../../../../core/navigation/nav.dart';
import '../../../../../core/results/result.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/request/param/get_admin_divisions_by_country_params.dart';
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
  AdminDivisionEntity? _selectedAdminDivision;
  CityEntity? _selectedCity;
  ManualLocationInputMode _inputMode = ManualLocationInputMode.countryCity;
  final TextEditingController manualAddressController = TextEditingController();

  CountryEntity? get selectedCountry => _selectedCountry;
  AdminDivisionEntity? get selectedAdminDivision => _selectedAdminDivision;
  CityEntity? get selectedCity => _selectedCity;
  ManualLocationInputMode get inputMode => _inputMode;

  String get _lang => LocalizationProvider().currentLanguage;

  bool get canConfirm {
    if (_inputMode == ManualLocationInputMode.address) {
      return manualAddressController.text.trim().isNotEmpty;
    }
    return _selectedCountry != null &&
        _selectedAdminDivision != null &&
        (_selectedCity?.name.trim().isNotEmpty ?? false);
  }

  void setInputMode(ManualLocationInputMode mode) {
    if (_inputMode == mode) return;
    _inputMode = mode;
    _selectedCountry = null;
    _selectedAdminDivision = null;
    _selectedCity = null;
    manualAddressController.clear();
    notifyListeners();
  }

  void selectCountry(CountryEntity? country) {
    _selectedCountry = country;
    _selectedAdminDivision = null;
    _selectedCity = null;
    manualAddressController.clear();
    notifyListeners();
  }

  void selectAdminDivision(AdminDivisionEntity? adminDivision) {
    _selectedAdminDivision = adminDivision;
    _selectedCity = null;
    notifyListeners();
  }

  void selectCity(CityEntity? city) {
    _selectedCity = city;
    notifyListeners();
  }

  void onManualAddressChanged() {
    notifyListeners();
  }

  Future<Result<AppErrors, List<CountryEntity>>> fetchCountries({
    required bool isOffline,
  }) async {
    final result = await getIt<GetCountriesUseCase>()(
      GetCountriesParams.fromAppLocale(lang: _lang, isOffline: isOffline),
    );
    if (result.hasDataOnly) {
      return Result.data(result.data!.countries);
    }
    return Result.error(result.error!);
  }

  Future<Result<AppErrors, List<AdminDivisionEntity>>> fetchAdminDivisions({
    required bool isOffline,
  }) async {
    final country = _selectedCountry;
    if (country == null || country.countryCode.isEmpty) {
      return Result.data(const []);
    }

    final result = await getIt<GetAdminDivisionsByCountryUseCase>()(
      GetAdminDivisionsByCountryParams.fromAppLocale(
        countryCode: country.countryCode,
        lang: _lang,
        isOffline: isOffline,
      ),
    );
    if (result.hasDataOnly) {
      return Result.data(result.data!.adminDivisions);
    }
    return Result.error(result.error!);
  }

  Future<Result<AppErrors, List<CityEntity>>> fetchCities({
    required bool isOffline,
  }) async {
    final country = _selectedCountry;
    final adminDivision = _selectedAdminDivision;
    if (country == null ||
        country.countryCode.isEmpty ||
        adminDivision == null ||
        adminDivision.adminCode1.isEmpty) {
      return Result.data(const []);
    }

    final result = await getIt<GetCitiesByCountryUseCase>()(
      GetCitiesByCountryParams.fromAppLocale(
        countryCode: country.countryCode,
        adminCode1: adminDivision.adminCode1,
        lang: _lang,
        isOffline: isOffline,
      ),
    );
    if (result.hasDataOnly) {
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
    final city = _selectedCity;
    if (country == null || city == null || city.name.trim().isEmpty) return;

    final location = LocationPreferenceEntity(
      source: LocationSource.manual,
      city: city.name,
      country: country.name,
      displayLabel: '${city.name}, ${country.name}',
      labelLanguageCode: _lang,
    );

    Nav.pop(context, location);
  }

  @override
  void closeNotifier() {
    manualAddressController.dispose();
    dispose();
  }
}
