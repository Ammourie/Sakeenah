import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/hive_helper.dart';
import '../../../../core/errors/app_errors.dart';
import '../../domain/entity/location_preference_entity.dart';
import '../request/model/daily_prayer_schedule_model.dart';
import '../request/model/location_preference_model.dart';

part 'prayer_times_local.dart';

abstract class IPrayerTimesLocalSource {
  Future<Either<AppErrors, LocationPreferenceEntity?>> getLocation();

  Future<Either<AppErrors, void>> saveLocation(LocationPreferenceEntity location);

  Future<Either<AppErrors, DailyPrayerScheduleModel?>> getSchedule({
    required String locationKey,
    required DateTime date,
  });

  Future<Either<AppErrors, void>> saveSchedule(DailyPrayerScheduleModel schedule);
}
