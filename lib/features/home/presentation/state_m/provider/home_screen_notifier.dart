import 'package:Sakeenah/core/ui/snackbars/show_snackbar.dart';
import 'package:Sakeenah/features/home/presentation/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/navigation/nav.dart';
import '../../../../../core/ui/screens/language_screen.dart';
import '../../../../../core/ui/screens/theme_screen.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/request/param/get_today_prayer_times_params.dart';
import '../../../domain/entity/location_preference_entity.dart';
import '../../screen/map_location_picker_screen.dart';
import '../../utils/gps_location_fetcher.dart';
import '../cubit/home_cubit.dart';

class HomeScreenNotifier extends ScreenNotifier<HomeScreenParam> {
  HomeScreenNotifier(super.param);

  final HomeCubit homeCubit = HomeCubit();

  bool _isLoading = false;

  bool _isLoadingGps = false;

  LocationPreferenceEntity? _gpsLocation;

  LocationPreferenceEntity? get gpsLocation => _gpsLocation;

  bool get isLoadingGps => _isLoadingGps;
  set isLoadingGps(bool value) {
    _isLoadingGps = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  Future<void> getPrayerTimes({required bool hasInternet}) async {
    isLoadingGps = true;
    final location = await GpsLocationFetcher.fetch();
    isLoadingGps = false;
    if (location == null) {
      showSnackbar(S.current.errorGettingLocation);
      return;
    }
    _gpsLocation = location;
    homeCubit.getPrayerTimes(
      GetTodayPrayerTimesParams(location: location, isOffline: !hasInternet),
    );
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
    _gpsLocation = location;
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

  @override
  void closeNotifier() {
    homeCubit.close();

    dispose();
  }
}
