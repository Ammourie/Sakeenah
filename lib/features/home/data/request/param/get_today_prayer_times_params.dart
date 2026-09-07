import '../../../../../core/params/base_params.dart';
import '../../../domain/entity/location_preference_entity.dart';

class GetTodayPrayerTimesParams extends BaseParams {
  static const aladhanTimingsPath = 'timings';
  static const aladhanTimingsByCityPath = 'timingsByCity';
  static const aladhanTimingsByAddressPath = 'timingsByAddress';

  /// AlAdhan calculation method — 2 = ISNA. See prayer-times docs.
  static const aladhanCalculationMethod = 2;

  final LocationPreferenceEntity location;
  final bool isOffline;

  GetTodayPrayerTimesParams({
    required this.location,
    required this.isOffline,
    super.cancelToken,
  });

  /// AlAdhan path date segment: **DD-MM-YYYY** (e.g. `08-09-2025`).
  static String formatAladhanDate(DateTime date) {
    final local = DateTime(date.year, date.month, date.day);
    return '${local.day.toString().padLeft(2, '0')}-'
        '${local.month.toString().padLeft(2, '0')}-'
        '${local.year}';
  }

  /// Today's date in AlAdhan path format.
  static String todayAladhanDatePath() => formatAladhanDate(DateTime.now());

  static String aladhanTimingsPathFor(DateTime date) =>
      '$aladhanTimingsPath/${formatAladhanDate(date)}';

  static String aladhanTimingsByCityPathFor(DateTime date) =>
      '$aladhanTimingsByCityPath/${formatAladhanDate(date)}';

  static String aladhanTimingsByAddressPathFor(DateTime date) =>
      '$aladhanTimingsByAddressPath/${formatAladhanDate(date)}';

  /// Shared query parameters for all AlAdhan timing endpoints.
  static Map<String, dynamic> aladhanQueryParameters() => {
        'method': aladhanCalculationMethod,
      };

  @override
  Map<String, dynamic> toMap() => {
        'locationKey': location.locationKey,
        'source': location.source.name,
        if (location.latitude != null) 'latitude': location.latitude,
        if (location.longitude != null) 'longitude': location.longitude,
        if (location.city != null) 'city': location.city,
        if (location.country != null) 'country': location.country,
        if (location.address != null) 'address': location.address,
      };
}
