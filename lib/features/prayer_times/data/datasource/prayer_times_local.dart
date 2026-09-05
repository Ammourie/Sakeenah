part of 'iprayer_times_local.dart';

@Injectable(as: IPrayerTimesLocalSource)
class PrayerTimesLocalSource implements IPrayerTimesLocalSource {
  String _dateKey(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';

  @override
  Future<Either<AppErrors, LocationPreferenceEntity?>> getLocation() async {
    try {
      final map = HiveHelper.getPrayerLocation();
      if (map == null) {
        return const Right(null);
      }
      return Right(LocationPreferenceModel.fromMap(map).toEntity());
    } catch (e) {
      return Left(AppErrors.customError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrors, void>> saveLocation(
    LocationPreferenceEntity location,
  ) async {
    try {
      final model = LocationPreferenceModel.fromEntity(location);
      await HiveHelper.putPrayerLocation(model.toMap());
      return const Right(null);
    } catch (e) {
      return Left(AppErrors.customError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrors, DailyPrayerScheduleModel?>> getSchedule({
    required String locationKey,
    required DateTime date,
  }) async {
    try {
      final storedSchedule = HiveHelper.getPrayerSchedule();
      final storedDate = HiveHelper.getPrayerScheduleDate();
      if (storedSchedule == null || storedDate == null) {
        return const Right(null);
      }

      final schedule = DailyPrayerScheduleModel.fromMap(storedSchedule);
      if (schedule.locationKey != locationKey) {
        return const Right(null);
      }
      if (storedDate != _dateKey(date)) {
        return const Right(null);
      }

      return Right(
        DailyPrayerScheduleModel(
          dateIso: schedule.dateIso,
          locationKey: schedule.locationKey,
          prayers: schedule.prayers,
          fetchedAtIso: schedule.fetchedAtIso,
          isFromCache: true,
        ),
      );
    } catch (e) {
      return Left(AppErrors.customError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrors, void>> saveSchedule(
    DailyPrayerScheduleModel schedule,
  ) async {
    try {
      await HiveHelper.putPrayerSchedule(
        schedule: schedule.toMap(),
        scheduleDate: _dateKey(DateTime.parse(schedule.dateIso)),
      );
      return const Right(null);
    } catch (e) {
      return Left(AppErrors.customError(message: e.toString()));
    }
  }
}
