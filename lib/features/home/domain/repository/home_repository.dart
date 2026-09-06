part of 'ihome_repository.dart';

@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  HomeRepository(this._remoteDataSource, this._localDataSource);

  final IHomeRemoteSource _remoteDataSource;
  final IHomeLocalSource _localDataSource;

  @override
  Future<Result<AppErrors, DailyPrayerScheduleEntity>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  ) async {
    final result = params.isOffline
        ? await _localDataSource.getTodayPrayerTimes(params)
        : await _remoteDataSource.getTodayPrayerTimes(params);

    return execute<DailyPrayerScheduleModel, DailyPrayerScheduleEntity>(
      remoteResult: result,
    );
  }

  @override
  Future<Result<AppErrors, CountryListEntity>> getCountries(
    GetCountriesParams params,
  ) async {
    return execute<CountryListModel, CountryListEntity>(
      remoteResult: await _remoteDataSource.getCountries(params),
    );
  }

  @override
  Future<Result<AppErrors, CityListEntity>> getCitiesByCountry(
    GetCitiesByCountryParams params,
  ) async {
    return execute<CityListModel, CityListEntity>(
      remoteResult: await _remoteDataSource.getCitiesByCountry(params),
    );
  }

  @override
  Stream<RadioPlayerEntity> watchQuranRadio() =>
      _remoteDataSource.watchQuranRadio();

  @override
  Future<Result<AppErrors, RadioPlayerEntity>> playQuranRadio() async {
    return executeForNoEntity(
      remoteResult: await _remoteDataSource.playQuranRadio(),
    );
  }

  @override
  Future<Result<AppErrors, RadioPlayerEntity>> pauseQuranRadio() async {
    return executeForNoEntity(
      remoteResult: await _remoteDataSource.pauseQuranRadio(),
    );
  }

  @override
  Future<Result<AppErrors, RadioPlayerEntity>> setQuranRadioVolume(
    double volume,
  ) async {
    return executeForNoEntity(
      remoteResult: await _remoteDataSource.setQuranRadioVolume(volume),
    );
  }

  @override
  Future<Result<AppErrors, RadioPlayerEntity>> seekQuranRadio(
    Duration offset,
  ) async {
    return executeForNoEntity(
      remoteResult: await _remoteDataSource.seekQuranRadio(offset),
    );
  }

  @override
  Future<Result<AppErrors, RadioPlayerEntity>> seekQuranRadioTo(
    int positionSeconds,
  ) async {
    return executeForNoEntity(
      remoteResult: await _remoteDataSource.seekQuranRadioTo(positionSeconds),
    );
  }

  @override
  Future<Result<AppErrors, RadioPlayerEntity>> retryQuranRadio() async {
    return executeForNoEntity(
      remoteResult: await _remoteDataSource.retryQuranRadio(),
    );
  }

  @override
  Future<Result<AppErrors, RadioPlayerEntity>> stopQuranRadio() async {
    return executeForNoEntity(
      remoteResult: await _remoteDataSource.stopQuranRadio(),
    );
  }

  @override
  Future<void> disposeQuranRadio() => _remoteDataSource.disposeQuranRadio();
}
