import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/hive_helper.dart';
import '../../../../core/errors/app_errors.dart';
import '../request/model/daily_prayer_schedule_model.dart';
import '../request/param/get_today_prayer_times_params.dart';

part 'home_local_datasource.dart';

abstract class IHomeLocalSource {
  Future<Either<AppErrors, DailyPrayerScheduleModel>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  );
}
