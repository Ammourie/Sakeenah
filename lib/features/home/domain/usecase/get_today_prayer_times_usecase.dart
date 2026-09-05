import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/get_today_prayer_times_params.dart';
import '../entity/daily_prayer_schedule_entity.dart';
import '../repository/ihome_repository.dart';

@injectable
class GetTodayPrayerTimesUseCase
    extends UseCase<DailyPrayerScheduleEntity, GetTodayPrayerTimesParams> {
  GetTodayPrayerTimesUseCase(this._repository);

  final IHomeRepository _repository;

  @override
  Future<Result<AppErrors, DailyPrayerScheduleEntity>> call(
    GetTodayPrayerTimesParams params,
  ) => _repository.getTodayPrayerTimes(params);
}
