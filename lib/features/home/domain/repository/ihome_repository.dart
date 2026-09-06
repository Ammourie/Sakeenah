import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/ihome_remote_datasource.dart';
import '../../data/request/model/country_model.dart';
import '../../data/request/model/daily_prayer_schedule_model.dart';
import '../../data/request/param/get_cities_by_country_params.dart';
import '../../data/request/param/get_countries_params.dart';
import '../../data/request/param/get_today_prayer_times_params.dart';
import '../entity/country_entity.dart';
import '../entity/daily_prayer_schedule_entity.dart';
import '../entity/radio_player_entity.dart';

part 'home_repository.dart';

abstract class IHomeRepository extends Repository {
  Future<Result<AppErrors, DailyPrayerScheduleEntity>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  );

  Future<Result<AppErrors, CountryListEntity>> getCountries(
    GetCountriesParams params,
  );

  Future<Result<AppErrors, CityListEntity>> getCitiesByCountry(
    GetCitiesByCountryParams params,
  );

  Stream<RadioPlayerEntity> watchQuranRadio();

  Future<Result<AppErrors, RadioPlayerEntity>> playQuranRadio();

  Future<Result<AppErrors, RadioPlayerEntity>> pauseQuranRadio();

  Future<Result<AppErrors, RadioPlayerEntity>> setQuranRadioVolume(
    double volume,
  );

  Future<Result<AppErrors, RadioPlayerEntity>> seekQuranRadio(
    Duration offset,
  );

  Future<Result<AppErrors, RadioPlayerEntity>> seekQuranRadioTo(
    int positionSeconds,
  );

  Future<Result<AppErrors, RadioPlayerEntity>> retryQuranRadio();

  Future<Result<AppErrors, RadioPlayerEntity>> stopQuranRadio();

  Future<void> disposeQuranRadio();
}
