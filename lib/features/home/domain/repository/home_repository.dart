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
    final useLocal = params.isOffline ||
        _localDataSource.hasCountriesCache(params);

    final result = useLocal
        ? await _localDataSource.getCountries(params)
        : await _remoteDataSource.getCountries(params);

    if (!useLocal && result.isRight()) {
      final countries = result.getOrElse(
        () => CountryListModel(countries: const []),
      );
      await _localDataSource.saveCountries(
        lang: params.lang,
        countries: countries,
      );
    }

    return execute<CountryListModel, CountryListEntity>(remoteResult: result);
  }

  @override
  Future<Result<AppErrors, AdminDivisionListEntity>> getAdminDivisionsByCountry(
    GetAdminDivisionsByCountryParams params,
  ) async {
    final useLocal = params.isOffline ||
        _localDataSource.hasAdminDivisionsCache(params);

    final result = useLocal
        ? await _localDataSource.getAdminDivisionsByCountry(params)
        : await _remoteDataSource.getAdminDivisionsByCountry(params);

    if (!useLocal && result.isRight()) {
      final adminDivisions = result.getOrElse(
        () => AdminDivisionListModel(adminDivisions: const []),
      );
      await _localDataSource.saveAdminDivisionsByCountry(
        params: params,
        adminDivisions: adminDivisions,
      );
    }

    return execute<AdminDivisionListModel, AdminDivisionListEntity>(
      remoteResult: result,
    );
  }

  @override
  Future<Result<AppErrors, CityListEntity>> getCitiesByCountry(
    GetCitiesByCountryParams params,
  ) async {
    final useLocal = params.isOffline ||
        _localDataSource.hasCitiesCache(params);

    final result = useLocal
        ? await _localDataSource.getCitiesByCountry(params)
        : await _remoteDataSource.getCitiesByCountry(params);

    if (!useLocal && result.isRight()) {
      final cities = result.getOrElse(() => CityListModel(cities: const []));
      await _localDataSource.saveCitiesByCountry(
        params: params,
        cities: cities,
      );
    }

    return execute<CityListModel, CityListEntity>(remoteResult: result);
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
