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
}
