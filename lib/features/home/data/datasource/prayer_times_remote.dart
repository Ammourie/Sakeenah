part of 'iprayer_times_remote.dart';

@Injectable(as: IPrayerTimesRemoteSource)
class PrayerTimesRemoteSource extends IPrayerTimesRemoteSource {
  @override
  Future<Either<AppErrors, DailyPrayerScheduleModel>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  ) async {
    final location = params.location;
    final queryParameters = <String, dynamic>{
      'method': APIUrls.ALADHAN_CALCULATION_METHOD,
    };

    String url;
    if (location.source == LocationSource.gps &&
        location.latitude != null &&
        location.longitude != null) {
      url = APIUrls.ALADHAN_TIMINGS;
      queryParameters['latitude'] = location.latitude;
      queryParameters['longitude'] = location.longitude;
    } else {
      url = APIUrls.ALADHAN_TIMINGS_BY_CITY;
      queryParameters['city'] = location.city;
      queryParameters['country'] = location.country;
    }

    return request<DailyPrayerScheduleModel>(
      method: HttpMethod.GET,
      url: url,
      baseUrl: AppSettings.ALADHAN_BASE_URL,
      queryParameters: queryParameters,
      responseValidator: AlAdhanResponseValidator(),
      createModelInterceptor: const AlAdhanCreateModelInterceptor(),
      converter: (json) => DailyPrayerScheduleModel.fromAlAdhanData(
        Map<String, dynamic>.from(json as Map),
        locationKey: location.locationKey,
      ),
    );
  }
}
