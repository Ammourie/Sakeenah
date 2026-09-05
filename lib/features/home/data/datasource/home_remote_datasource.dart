part of 'ihome_remote_datasource.dart';

@Injectable(as: IHomeRemoteSource)
class HomeRemoteSource extends IHomeRemoteSource {
  HomeRemoteSource(this._localDataSource);

  final IHomeLocalSource _localDataSource;

  @override
  Future<Either<AppErrors, DailyPrayerScheduleModel>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  ) async {
    final location = params.location;
    final queryParameters = <String, dynamic>{
      'method': GetTodayPrayerTimesParams.aladhanCalculationMethod,
    };

    String url;
    if (location.source == LocationSource.gps &&
        location.latitude != null &&
        location.longitude != null) {
      url = GetTodayPrayerTimesParams.aladhanTimingsPath;
      queryParameters['latitude'] = location.latitude;
      queryParameters['longitude'] = location.longitude;
    } else {
      url = GetTodayPrayerTimesParams.aladhanTimingsByCityPath;
      queryParameters['city'] = location.city;
      queryParameters['country'] = location.country;
    }

    final remote = await request<DailyPrayerScheduleModel>(
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

    if (remote.isRight()) {
      return remote;
    }

    final cached = await _localDataSource.getTodayPrayerTimes(params);
    return cached.fold(
      (_) => remote,
      Right.new,
    );
  }
}
