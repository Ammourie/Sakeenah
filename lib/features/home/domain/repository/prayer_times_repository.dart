part of 'iprayer_times_repository.dart';

@Injectable(as: IPrayerTimesRepository)
class PrayerTimesRepository extends IPrayerTimesRepository {
  PrayerTimesRepository(this._remoteDataSource, this._localDataSource);

  final IPrayerTimesRemoteSource _remoteDataSource;
  final IPrayerTimesLocalSource _localDataSource;

  @override
  Future<Result<AppErrors, LocationPreferenceEntity>> getLocationPreference(
    NoParams params,
  ) async {
    final local = await _localDataSource.getLocation();
    if (local.isLeft()) {
      return Result.error((local as Left).value);
    }
    return Result.data((local as Right).value);
  }

  @override
  Future<Result<AppErrors, void>> saveLocationPreference(
    SaveLocationPreferenceParams params,
  ) async {
    final saved = await _localDataSource.saveLocation(params.location);
    if (saved.isLeft()) {
      return Result.error((saved as Left).value);
    }
    return Result.data(null);
  }

  @override
  Future<Result<AppErrors, DailyPrayerScheduleEntity>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  ) async {
    final today = DateTime.now();
    final locationKey = params.location.locationKey;

    if (params.isOffline) {
      return _loadFromCacheOrError(locationKey: locationKey, date: today);
    }

    final remote = await _remoteDataSource.getTodayPrayerTimes(params);

    if (remote.isRight()) {
      final model =
          (remote as Right<AppErrors, DailyPrayerScheduleModel>).value;
      await _localDataSource.saveSchedule(model);
      return execute<DailyPrayerScheduleModel, DailyPrayerScheduleEntity>(
        remoteResult: remote,
      );
    }

    final cached = await _localDataSource.getSchedule(
      locationKey: locationKey,
      date: today,
    );

    if (cached.isRight()) {
      final schedule = (cached as Right).value as DailyPrayerScheduleModel?;
      if (schedule != null) {
        return Result.dataWithError(
          schedule.toEntity(),
          (remote as Left<AppErrors, DailyPrayerScheduleModel>).value,
        );
      }
    }

    return execute<DailyPrayerScheduleModel, DailyPrayerScheduleEntity>(
      remoteResult: remote,
    );
  }

  Future<Result<AppErrors, DailyPrayerScheduleEntity>> _loadFromCacheOrError({
    required String locationKey,
    required DateTime date,
  }) async {
    final cached = await _localDataSource.getSchedule(
      locationKey: locationKey,
      date: date,
    );

    if (cached.isLeft()) {
      return Result.error((cached as Left).value);
    }

    final schedule = (cached as Right).value as DailyPrayerScheduleModel?;
    if (schedule == null) {
      return Result.error(
        const AppErrors.customError(message: 'No cached prayer times'),
      );
    }

    return Result.data(schedule.toEntity());
  }
}
