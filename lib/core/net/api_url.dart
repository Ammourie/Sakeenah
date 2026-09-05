import '../constants/app/app_settings.dart';

/// API
class APIUrls {
  /// Domain url
  static const BASE_URL = AppSettings.BASE_URL;

  /// AlAdhan Prayer Times API paths — base URL in [AppSettings.ALADHAN_BASE_URL]
  static const ALADHAN_TIMINGS = 'timings';
  static const ALADHAN_TIMINGS_BY_CITY = 'timingsByCity';
  static const ALADHAN_CALCULATION_METHOD = 2; // ISNA
}
