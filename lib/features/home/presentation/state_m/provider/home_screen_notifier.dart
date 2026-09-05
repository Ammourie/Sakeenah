import 'package:Sakeenah/features/home/presentation/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../../prayer_times/domain/entity/location_preference_entity.dart';
import '../../../../prayer_times/presentation/screen/map_location_picker_screen.dart';
import '../../../../prayer_times/presentation/state_m/cubit/prayer_times_cubit.dart';
import '../../../../prayer_times/presentation/utils/gps_location_fetcher.dart';
import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/models/empty_response.dart';
import '../../../../../core/navigation/nav.dart';
import '../../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../../core/ui/error_ui/error_viewer/snack_bar/errv_snack_bar_options.dart';
import '../../../../../core/ui/show_toast.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/ui/screens/language_screen.dart';
import '../../../../../core/ui/screens/theme_screen.dart';
import '../cubit/home_cubit.dart';

class HomeScreenNotifier extends ScreenNotifier<HomeScreenParam> {
  HomeScreenNotifier(super.param);

  /// Fields

  final HomeCubit homeCubit = HomeCubit();
  final PrayerTimesCubit prayerTimesCubit = PrayerTimesCubit();

  bool _isLoading = false;
  bool _isLoadingGps = false;
  bool _prayerInitialized = false;
  LocationPreferenceEntity? _gpsLocation;
  bool _gpsFetchStarted = false;

  LocationPreferenceEntity? get gpsLocation => _gpsLocation;
  bool get isLoadingGps => _isLoadingGps;

  /// Methods

  Future<void> initializePrayerTimes({required bool hasInternet}) async {
    if (_prayerInitialized) return;
    _prayerInitialized = true;

    await fetchGpsLocationOnce();

    await prayerTimesCubit.initialize(
      hasInternet: hasInternet,
      prefetchedGps: _gpsLocation,
    );
  }

  Future<void> fetchGpsLocationOnce() async {
    if (_gpsFetchStarted) return;
    _gpsFetchStarted = true;
    _isLoadingGps = true;
    notifyListeners();
    try {
      _gpsLocation = await GpsLocationFetcher.fetch();
    } finally {
      _isLoadingGps = false;
      notifyListeners();
    }
  }

  Future<void> pickMapLocation(
    BuildContext context, {
    required bool hasInternet,
  }) async {
    final result = await Nav.to<MapPickResult>(
      MapLocationPickerScreen.routeName,
      arguments: const MapLocationPickerScreenParam(),
      context: context,
    );

    if (result == null) return;

    await prayerTimesCubit.saveMapLocation(
      latitude: result.latitude,
      longitude: result.longitude,
      hasInternet: hasInternet,
    );
  }

  Future<void> retryPrayerGps({required bool hasInternet}) async {
    await prayerTimesCubit.retryGps(
      hasInternet: hasInternet,
      prefetchedGps: _gpsLocation,
    );
  }

  Future<void> refreshPlaceLabelForCurrentLocale() async {
    await prayerTimesCubit.refreshPlaceLabelForCurrentLocale();
  }

  void homeLoadingStateListener() {
    _isLoading = true;
    notifyListeners();
  }

  void homeLoadedStateListener(EmptyResponse s) {
    "Response Succeeded".logI;
    _isLoading = false;
    CustomToast.show(s.message);
    notifyListeners();
  }

  void homeErrorStateListener(
    BuildContext context,
    AppErrors error,
    VoidCallback callback,
  ) {
    "Response Failed".logI;
    _isLoading = false;

    ErrorViewer.showError(
      context: context,
      error: error,
      callback: callback,
      errorViewerOptions: const ErrVSnackBarOptions(),
    );

    notifyListeners();
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
    prayerTimesCubit.close();
    homeCubit.close();
    dispose();
  }

  bool get isLoading => _isLoading;
}
