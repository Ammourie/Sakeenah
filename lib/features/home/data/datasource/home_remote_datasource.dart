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
    } else if (location.usesAddressLookup) {
      url = GetTodayPrayerTimesParams.aladhanTimingsByAddressPath;
      queryParameters['address'] = location.address!.trim();
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

  @override
  Future<Either<AppErrors, CountryListModel>> getCountries(
    GetCountriesParams params,
  ) async {
    final cached = await _localDataSource.getCountries();
    if (cached.isRight()) {
      return cached;
    }

    final remote = await request<CountryListModel>(
      method: HttpMethod.GET,
      url: GetCountriesParams.countriesNowCountriesPath,
      baseUrl: AppSettings.COUNTRIES_NOW_BASE_URL,
      cancelToken: params.cancelToken,
      responseValidator: CountriesNowResponseValidator(),
      createModelInterceptor: const CountriesNowCreateModelInterceptor(),
      converter: CountryListModel.fromMap,
    );

    if (remote.isRight()) {
      final countries =
          remote.getOrElse(() => CountryListModel(countries: const []));
      await _localDataSource.saveCountries(countries);
      return Right(countries);
    }

    return cached;
  }

  @override
  Future<Either<AppErrors, CityListModel>> getCitiesByCountry(
    GetCitiesByCountryParams params,
  ) async {
    final cached = await _localDataSource.getCitiesByCountry(params.country);
    if (cached.isRight()) {
      return cached;
    }

    final remote = await request<CityListModel>(
      method: HttpMethod.GET,
      url: GetCitiesByCountryParams.countriesNowCitiesPath,
      baseUrl: AppSettings.COUNTRIES_NOW_BASE_URL,
      queryParameters: params.toQueryParameters(),
      cancelToken: params.cancelToken,
      responseValidator: CountriesNowResponseValidator(),
      createModelInterceptor: const CountriesNowCreateModelInterceptor(),
      converter: CityListModel.fromMap,
    );

    if (remote.isRight()) {
      final cities = remote.getOrElse(() => CityListModel(cities: const []));
      await _localDataSource.saveCitiesByCountry(
        country: params.country,
        cities: cities,
      );
      return Right(cities);
    }

    return cached;
  }
}
