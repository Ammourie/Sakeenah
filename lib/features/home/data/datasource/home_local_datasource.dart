part of 'ihome_remote_datasource.dart';

@Injectable(as: IHomeLocalSource)
class HomeLocalSource implements IHomeLocalSource {
  @override
  Future<Either<AppErrors, DailyPrayerScheduleModel>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  ) async {
    try {
      final storedSchedule = HiveHelper.getPrayerSchedule();
      if (storedSchedule == null) {
        return const Left(
          AppErrors.customError(message: 'No cached prayer times'),
        );
      }

      final schedule = DailyPrayerScheduleModel.fromMap(storedSchedule);

      final cachedLocation = _restoreCachedLocation();
      final locationMatches = Utils.matchesCachedPrayerLocation(
        requested: params.location,
        cachedScheduleLocationKey: schedule.locationKey,
        cachedLocation: cachedLocation,
      );

      if (!locationMatches) {
        return const Left(
          AppErrors.customError(message: 'No cached prayer times'),
        );
      }

      return Right(_projectScheduleTimesToToday(schedule));
    } catch (e) {
      return Left(AppErrors.customError(message: e.toString()));
    }
  }

  /// Maps cached HH:mm values onto today's calendar date for display/countdown.
  DailyPrayerScheduleModel _projectScheduleTimesToToday(
    DailyPrayerScheduleModel schedule,
  ) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final prayers = schedule.prayers.map((prayer) {
      final original = DateTime.tryParse(prayer.timeIso);
      if (original == null) return prayer;

      return PrayerTimeModel(
        name: prayer.name,
        timeIso: DateTime(
          today.year,
          today.month,
          today.day,
          original.hour,
          original.minute,
        ).toIso8601String(),
      );
    }).toList();

    return DailyPrayerScheduleModel(
      dateIso: today.toIso8601String(),
      locationKey: schedule.locationKey,
      prayers: prayers,
      fetchedAtIso: schedule.fetchedAtIso,
      isFromCache: true,
    );
  }

  LocationPreferenceEntity? _restoreCachedLocation() {
    final raw = HiveHelper.getPrayerLocation();
    if (raw == null) return null;

    try {
      return LocationPreferenceModel.fromMap(raw).toEntity();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Either<AppErrors, CountryListModel>> getCountries(
    GetCountriesParams params,
  ) async {
    try {
      final cached = HiveHelper.getCountriesList(params.lang);
      if (cached == null || cached.isEmpty) {
        return const Left(
          AppErrors.customError(message: 'No cached countries'),
        );
      }

      return Right(CountryListModel.fromCachedList(cached));
    } catch (e) {
      return Left(AppErrors.customError(message: e.toString()));
    }
  }

  @override
  bool hasCountriesCache(GetCountriesParams params) =>
      HiveHelper.hasCountriesList(params.lang);

  @override
  Future<void> saveCountries({
    required String lang,
    required CountryListModel countries,
  }) async {
    await HiveHelper.putCountriesList(lang, countries.toCachedList());
  }

  @override
  Future<Either<AppErrors, AdminDivisionListModel>> getAdminDivisionsByCountry(
    GetAdminDivisionsByCountryParams params,
  ) async {
    try {
      final cached = HiveHelper.getAdminDivisionsForCountry(
        params.lang,
        params.countryCode,
      );
      if (cached == null || cached.isEmpty) {
        return const Left(
          AppErrors.customError(message: 'No cached admin divisions'),
        );
      }

      return Right(AdminDivisionListModel.fromCachedList(cached));
    } catch (e) {
      return Left(AppErrors.customError(message: e.toString()));
    }
  }

  @override
  bool hasAdminDivisionsCache(GetAdminDivisionsByCountryParams params) =>
      HiveHelper.hasAdminDivisionsForCountry(params.lang, params.countryCode);

  @override
  Future<void> saveAdminDivisionsByCountry({
    required GetAdminDivisionsByCountryParams params,
    required AdminDivisionListModel adminDivisions,
  }) async {
    await HiveHelper.putAdminDivisionsForCountry(
      lang: params.lang,
      countryCode: params.countryCode,
      adminDivisions: adminDivisions.toCachedList(),
    );
  }

  @override
  Future<Either<AppErrors, CityListModel>> getCitiesByCountry(
    GetCitiesByCountryParams params,
  ) async {
    try {
      final cached = HiveHelper.getCitiesForAdminDivision(
        params.lang,
        params.countryCode,
        params.adminCode1,
      );
      if (cached == null || cached.isEmpty) {
        return const Left(
          AppErrors.customError(message: 'No cached cities'),
        );
      }

      return Right(CityListModel.fromCachedList(cached));
    } catch (e) {
      return Left(AppErrors.customError(message: e.toString()));
    }
  }

  @override
  bool hasCitiesCache(GetCitiesByCountryParams params) =>
      HiveHelper.hasCitiesForAdminDivision(
        params.lang,
        params.countryCode,
        params.adminCode1,
      );

  @override
  Future<void> saveCitiesByCountry({
    required GetCitiesByCountryParams params,
    required CityListModel cities,
  }) async {
    await HiveHelper.putCitiesForCountry(
      lang: params.lang,
      countryCode: params.countryCode,
      adminCode1: params.adminCode1,
      cities: cities.toCachedList(),
    );
  }
}
