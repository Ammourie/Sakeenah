import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app/app_settings.dart';
import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/net/create_model_interceptor/aladhan_create_model_interceptor.dart';
import '../../../../core/net/response_validators/aladhan_response_validator.dart';
import '../../domain/entity/location_preference_entity.dart';
import '../request/model/daily_prayer_schedule_model.dart';
import '../request/param/get_today_prayer_times_params.dart';

part 'prayer_times_remote.dart';

abstract class IPrayerTimesRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, DailyPrayerScheduleModel>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  );
}
