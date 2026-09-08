import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/hive_helper.dart';
import '../../../../core/common/utils/utils.dart';
import '../../../../core/constants/app/app_settings.dart';
import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/create_model_interceptor/aladhan_create_model_interceptor.dart';
import '../../../../core/net/create_model_interceptor/geonames_create_model_interceptor.dart';
import '../../../../core/net/response_validators/aladhan_response_validator.dart';
import '../../../../core/net/response_validators/geonames_response_validator.dart';
import '../../domain/entity/location_preference_entity.dart';
import '../../domain/entity/radio_player_entity.dart';
import '../request/model/country_model.dart';
import '../request/model/daily_prayer_schedule_model.dart';
import '../request/model/location_preference_model.dart';
import '../request/model/prayer_time_model.dart';
import '../request/param/get_admin_divisions_by_country_params.dart';
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

  Future<Either<AppErrors, CountryListModel>> getCountries(
    GetCountriesParams params,
  );

  bool hasCountriesCache(GetCountriesParams params);

  Future<void> saveCountries({
    required String lang,
    required CountryListModel countries,
  });

  Future<Either<AppErrors, AdminDivisionListModel>> getAdminDivisionsByCountry(
    GetAdminDivisionsByCountryParams params,
  );

  bool hasAdminDivisionsCache(GetAdminDivisionsByCountryParams params);

  Future<void> saveAdminDivisionsByCountry({
    required GetAdminDivisionsByCountryParams params,
    required AdminDivisionListModel adminDivisions,
  });

  Future<Either<AppErrors, CityListModel>> getCitiesByCountry(
    GetCitiesByCountryParams params,
  );

  bool hasCitiesCache(GetCitiesByCountryParams params);

  Future<void> saveCitiesByCountry({
    required GetCitiesByCountryParams params,
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

  Future<Either<AppErrors, AdminDivisionListModel>> getAdminDivisionsByCountry(
    GetAdminDivisionsByCountryParams params,
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
