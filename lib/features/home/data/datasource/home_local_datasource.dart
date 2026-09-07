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
  Future<Either<AppErrors, CountryListModel>> getCountries() async {
    try {
      final cached = HiveHelper.getCountriesList();
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
  Future<void> saveCountries(CountryListModel countries) async {
    await HiveHelper.putCountriesList(countries.toCachedList());
  }

  @override
  Future<Either<AppErrors, CityListModel>> getCitiesByCountry(
    String country,
  ) async {
    try {
      final cached = HiveHelper.getCitiesForCountry(country);
      if (cached == null || cached.isEmpty) {
        return const Left(
          AppErrors.customError(message: 'No cached cities'),
        );
      }

      return Right(CityListModel(cities: cached));
    } catch (e) {
      return Left(AppErrors.customError(message: e.toString()));
    }
  }

  @override
  Future<void> saveCitiesByCountry({
    required String country,
    required CityListModel cities,
  }) async {
    await HiveHelper.putCitiesForCountry(country, cities.cities);
  }
}
