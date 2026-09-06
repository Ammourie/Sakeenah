import 'package:Sakeenah/core/ui/snackbars/show_snackbar.dart';

import 'package:Sakeenah/features/home/presentation/screen/home_screen/home_screen.dart';

import 'package:flutter/material.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';

import '../../../../../core/errors/app_errors.dart';

import '../../../../../core/navigation/nav.dart';

import '../../../../../core/ui/screens/language_screen.dart';

import '../../../../../core/ui/screens/theme_screen.dart';

import '../../../../../generated/l10n.dart';

import '../../../data/request/param/get_today_prayer_times_params.dart';

import '../../../domain/entity/location_preference_entity.dart';

import '../../screen/manual_location_picker_screen.dart';

import '../../screen/map_location_picker_screen.dart';

import '../../utils/gps_location_fetcher.dart';

import '../../widgets/location_source_chooser_sheet.dart';

import '../cubit/home_cubit.dart';
import '../cubit/quran_radio_cubit.dart';

class HomeScreenNotifier extends ScreenNotifier<HomeScreenParam> {
  HomeScreenNotifier(super.param);

  final HomeCubit homeCubit = HomeCubit();
  final QuranRadioCubit quranRadioCubit = QuranRadioCubit();

  bool _isLoading = false;

  bool _isLoadingGps = false;

  LocationPreferenceEntity? _selectedLocation;

  double _savedRadioVolume = 1.0;

  LocationPreferenceEntity? get selectedLocation => _selectedLocation;

  /// Backward-compatible alias while UI migrates to [selectedLocation].

  LocationPreferenceEntity? get gpsLocation => _selectedLocation;

  bool get isLoadingGps => _isLoadingGps;

  set isLoadingGps(bool value) {
    _isLoadingGps = value;

    notifyListeners();
  }

  bool get isLoading => _isLoading;

  Future<void> getPrayerTimes({required bool hasInternet}) async {
    final cachedLocation = _selectedLocation;

    if (cachedLocation != null) {
      homeCubit.getPrayerTimes(
        GetTodayPrayerTimesParams(
          location: cachedLocation,

          isOffline: !hasInternet,
        ),
      );

      return;
    }

    isLoadingGps = true;

    final location = await GpsLocationFetcher.fetch();

    isLoadingGps = false;

    if (location == null) {
      showSnackbar(S.current.errorGettingLocation);

      homeCubit.safeEmit(
        HomeState.prayerTimesError(
          error: const AppErrors.customError(message: 'Location unavailable'),
          callback: () => getPrayerTimes(hasInternet: hasInternet),
        ),
      );

      return;
    }

    _selectedLocation = location;

    homeCubit.getPrayerTimes(
      GetTodayPrayerTimesParams(location: location, isOffline: !hasInternet),
    );
  }

  Future<void> changeLocation({
    required BuildContext context,

    required bool hasInternet,
  }) async {
    final option = await showLocationSourceChooser(context);

    if (option == null) return;

    switch (option) {
      case LocationPickerOption.map:
        await pickMapLocation(hasInternet: hasInternet);

      case LocationPickerOption.manual:
        await pickManualLocation(hasInternet: hasInternet);
    }
  }

  Future<void> pickMapLocation({required bool hasInternet}) async {
    final result = await Nav.to<MapPickResult>(
      MapLocationPickerScreen.routeName,

      arguments: const MapLocationPickerScreenParam(),
    );

    if (result == null) return;

    isLoadingGps = true;

    final location = await GpsLocationFetcher.fetchFromLatLng(
      latitude: result.latitude,

      longitude: result.longitude,
    );

    isLoadingGps = false;

    if (location == null) {
      showSnackbar(S.current.errorGettingLocation);

      return;
    }

    _applySelectedLocation(location, hasInternet: hasInternet);
  }

  Future<void> pickManualLocation({required bool hasInternet}) async {
    final location = await Nav.to<LocationPreferenceEntity>(
      ManualLocationPickerScreen.routeName,

      arguments: const ManualLocationPickerScreenParam(),
    );

    if (location == null) return;

    _applySelectedLocation(location, hasInternet: hasInternet);
  }

  void _applySelectedLocation(
    LocationPreferenceEntity location, {

    required bool hasInternet,
  }) {
    _selectedLocation = location;

    homeCubit.getPrayerTimes(
      GetTodayPrayerTimesParams(location: location, isOffline: !hasInternet),
    );
  }

  void onChangeLanguageTap(BuildContext context) {
    Nav.to(LanguageScreen.routeName, arguments: const LanguageScreenParam());
  }

  void onThemeSwitcherTap(BuildContext context) {
    Nav.to(ThemeScreen.routeName, arguments: const ThemeScreenParam());
  }

  String getHomeScreenTitle(BuildContext context) {
    return S.current.homePage;
  }

  void onPlayRadio() => quranRadioCubit.playRadio();

  void onPauseRadio() => quranRadioCubit.pauseRadio();

  void onRadioVolumeChanged(double volume) {
    if (volume > 0) {
      _savedRadioVolume = volume;
    }
    quranRadioCubit.setRadioVolume(volume);
  }

  void onToggleRadioMute() {
    final currentVolume = quranRadioCubit.state.maybeWhen(
      loaded: (player) => player.volume,
      orElse: () => 0.0,
    );
    if (currentVolume > 0) {
      _savedRadioVolume = currentVolume;
      quranRadioCubit.setRadioVolume(0);
      return;
    }

    quranRadioCubit.setRadioVolume(
      _savedRadioVolume > 0 ? _savedRadioVolume : 1.0,
    );
  }

  void onRetryRadio() => quranRadioCubit.retryRadio();

  void onStopRadio() => quranRadioCubit.stopRadio();

  void onSeekRadioBackward() => quranRadioCubit.seekRadioBackward();

  void onSeekRadioForward() => quranRadioCubit.seekRadioForward();

  void onSeekRadioToProgress(double progress) =>
      quranRadioCubit.seekRadioToProgress(progress);

  void onInternetConnectivityChanged({required bool hasInternet}) {
    quranRadioCubit.onInternetConnectivityChanged(hasInternet: hasInternet);
  }

  @override
  void closeNotifier() {
    homeCubit.close();
    quranRadioCubit.close();

    dispose();
  }
}
