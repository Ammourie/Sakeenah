import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../features/home/domain/entity/location_preference_entity.dart';
import '../../constants/app/app_constants.dart';
import '../../providers/theme_mode_provider.dart';
import '../app_config.dart';

class Utils {
  Utils._();

  /// Whether [requested] location can reuse a cached prayer schedule for
  /// [cachedScheduleLocationKey] (exact key or GPS within cache radius).
  static bool matchesCachedPrayerLocation({
    required LocationPreferenceEntity requested,
    required String cachedScheduleLocationKey,
    LocationPreferenceEntity? cachedLocation,
  }) {
    if (requested.locationKey == cachedScheduleLocationKey) {
      return true;
    }

    return _isGpsWithinPrayerCacheRadius(
      requested: requested,
      cached: cachedLocation,
      cachedScheduleLocationKey: cachedScheduleLocationKey,
    );
  }

  static bool _isGpsWithinPrayerCacheRadius({
    required LocationPreferenceEntity requested,
    LocationPreferenceEntity? cached,
    required String cachedScheduleLocationKey,
  }) {
    if (requested.source != LocationSource.gps) {
      return false;
    }

    final requestedCoords = _gpsCoords(requested);
    if (requestedCoords == null) return false;

    final cachedCoords = cached != null
        ? _gpsCoords(cached)
        : _parseGpsLocationKey(cachedScheduleLocationKey);
    if (cachedCoords == null) return false;

    final distanceMeters = Geolocator.distanceBetween(
      cachedCoords.$1,
      cachedCoords.$2,
      requestedCoords.$1,
      requestedCoords.$2,
    );

    return distanceMeters <=
        AppConstants.PRAYER_TIMES_LOCATION_CACHE_RADIUS_METERS;
  }

  static (double, double)? _gpsCoords(LocationPreferenceEntity location) {
    final lat = location.latitude;
    final lon = location.longitude;
    if (lat == null || lon == null) return null;
    return (lat, lon);
  }

  static (double, double)? _parseGpsLocationKey(String key) {
    final parts = key.split('|');
    if (parts.length != 2) return null;

    final lat = double.tryParse(parts[0]);
    final lon = double.tryParse(parts[1]);
    if (lat == null || lon == null) return null;

    return (lat, lon);
  }

  /// Find if any widget has focus in the given [context] and unfocus it
  static void unFocus(BuildContext context) {
    if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
  }

  static Brightness effectiveBrightness(BuildContext context) {    switch (AppConfig().themeMode) {
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.system:
        return MediaQuery.platformBrightnessOf(context);
    }
  }

  static void changeTheme(BuildContext context) async {
    final isDark = effectiveBrightness(context) == Brightness.dark;
    final nextMode = isDark ? ThemeMode.light : ThemeMode.dark;

    await context.read<ThemeModeProvider>().setThemeMode(
      nextMode,
      context: context,
    );
  }

}
