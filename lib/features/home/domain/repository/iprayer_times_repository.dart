import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/iprayer_times_local.dart';
import '../../data/datasource/iprayer_times_remote.dart';
import '../../data/request/model/daily_prayer_schedule_model.dart';
import '../../data/request/param/get_today_prayer_times_params.dart';
import '../../data/request/param/save_location_preference_params.dart';
import '../entity/daily_prayer_schedule_entity.dart';
import '../entity/location_preference_entity.dart';

part 'prayer_times_repository.dart';

abstract class IPrayerTimesRepository extends Repository {
  Future<Result<AppErrors, LocationPreferenceEntity>> getLocationPreference(
    NoParams params,
  );

  Future<Result<AppErrors, void>> saveLocationPreference(
    SaveLocationPreferenceParams params,
  );

  Future<Result<AppErrors, DailyPrayerScheduleEntity>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  );
}
