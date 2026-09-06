import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/hive_helper.dart';
import '../../../../core/constants/app/app_settings.dart';
import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/create_model_interceptor/aladhan_create_model_interceptor.dart';
import '../../../../core/net/create_model_interceptor/countries_now_create_model_interceptor.dart';
import '../../../../core/net/response_validators/aladhan_response_validator.dart';
import '../../../../core/net/response_validators/countries_now_response_validator.dart';
import '../../domain/entity/location_preference_entity.dart';
import '../../domain/entity/radio_player_entity.dart';
import '../request/model/country_model.dart';
import '../request/model/daily_prayer_schedule_model.dart';
import '../request/param/get_cities_by_country_params.dart';
import '../request/param/get_countries_params.dart';
import '../request/param/get_today_prayer_times_params.dart';
import 'quran_radio_player.dart';

part 'home_local_datasource.dart';
part 'home_remote_datasource.dart';

abstract class IHomeLocalSource {
  Future<Either<AppErrors, DailyPrayerScheduleModel>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  );

  Future<Either<AppErrors, CountryListModel>> getCountries();

  Future<void> saveCountries(CountryListModel countries);

  Future<Either<AppErrors, CityListModel>> getCitiesByCountry(String country);

  Future<void> saveCitiesByCountry({
    required String country,
    required CityListModel cities,
  });
}

abstract class IHomeRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, DailyPrayerScheduleModel>> getTodayPrayerTimes(
    GetTodayPrayerTimesParams params,
  );

  Future<Either<AppErrors, CountryListModel>> getCountries(
    GetCountriesParams params,
  );

  Future<Either<AppErrors, CityListModel>> getCitiesByCountry(
    GetCitiesByCountryParams params,
  );

  Stream<RadioPlayerEntity> watchQuranRadio();

  Future<Either<AppErrors, RadioPlayerEntity>> playQuranRadio();

  Future<Either<AppErrors, RadioPlayerEntity>> pauseQuranRadio();

  Future<Either<AppErrors, RadioPlayerEntity>> setQuranRadioVolume(
    double volume,
  );

  Future<Either<AppErrors, RadioPlayerEntity>> seekQuranRadio(
    Duration offset,
  );

  Future<Either<AppErrors, RadioPlayerEntity>> seekQuranRadioTo(
    int positionSeconds,
  );

  Future<Either<AppErrors, RadioPlayerEntity>> retryQuranRadio();

  Future<Either<AppErrors, RadioPlayerEntity>> stopQuranRadio();

  Future<void> disposeQuranRadio();
}
