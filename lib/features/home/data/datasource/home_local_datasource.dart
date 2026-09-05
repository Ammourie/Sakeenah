part of 'ihome_local_datasource.dart';

@Injectable(as: IHomeLocalSource)
class HomeLocalSource implements IHomeLocalSource {
  String _dateKey(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';

  @override
  Future<Either<AppErrors, DailyPrayerScheduleModel>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  ) async {
    try {
      final storedSchedule = HiveHelper.getPrayerSchedule();
      final storedDate = HiveHelper.getPrayerScheduleDate();
      if (storedSchedule == null || storedDate == null) {
        return const Left(
          AppErrors.customError(message: 'No cached prayer times'),
        );
      }

      final schedule = DailyPrayerScheduleModel.fromMap(storedSchedule);
      final locationKey = params.location.locationKey;
      final today = DateTime.now();

      if (schedule.locationKey != locationKey) {
        return const Left(
          AppErrors.customError(message: 'No cached prayer times'),
        );
      }
      if (storedDate != _dateKey(today)) {
        return const Left(
          AppErrors.customError(message: 'No cached prayer times'),
        );
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
}
