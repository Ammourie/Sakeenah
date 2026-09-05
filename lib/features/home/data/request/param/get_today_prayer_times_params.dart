import '../../../../../core/params/base_params.dart';
import '../../../domain/entity/location_preference_entity.dart';

class GetTodayPrayerTimesParams extends BaseParams {
  static const aladhanTimingsPath = 'timings';
  static const aladhanTimingsByCityPath = 'timingsByCity';
  static const aladhanCalculationMethod = 2;

  final LocationPreferenceEntity location;
  final bool isOffline;

  GetTodayPrayerTimesParams({
    required this.location,
    required this.isOffline,
    super.cancelToken,
  });

  @override
  Map<String, dynamic> toMap() => {
        'locationKey': location.locationKey,
        'source': location.source.name,
        if (location.latitude != null) 'latitude': location.latitude,
        if (location.longitude != null) 'longitude': location.longitude,
        if (location.city != null) 'city': location.city,
        if (location.country != null) 'country': location.country,
      };
}
