import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/ihome_local_datasource.dart';
import '../../data/datasource/ihome_remote_datasource.dart';
import '../../data/request/model/daily_prayer_schedule_model.dart';
import '../../data/request/param/get_today_prayer_times_params.dart';
import '../entity/daily_prayer_schedule_entity.dart';

part 'home_repository.dart';

abstract class IHomeRepository extends Repository {
  Future<Result<AppErrors, DailyPrayerScheduleEntity>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  );
}
