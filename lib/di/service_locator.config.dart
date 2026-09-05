// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:Sakeenah/core/navigation/navigation_service.dart' as _i166;
import 'package:Sakeenah/core/navigation/route_generator.dart' as _i1067;
import 'package:Sakeenah/core/net/http_client.dart' as _i46;
import 'package:Sakeenah/di/modules/logger_module.dart' as _i319;
import 'package:Sakeenah/di/modules/shared_preferences_module.dart' as _i349;
import 'package:Sakeenah/features/home/data/datasource/ihome_remote.dart'
    as _i835;
import 'package:Sakeenah/features/home/data/datasource/iprayer_times_local.dart'
    as _i661;
import 'package:Sakeenah/features/home/data/datasource/iprayer_times_remote.dart'
    as _i42;
import 'package:Sakeenah/features/home/domain/repository/ihome_repository.dart'
    as _i329;
import 'package:Sakeenah/features/home/domain/repository/iprayer_times_repository.dart'
    as _i969;
import 'package:Sakeenah/features/home/domain/usecase/get_location_preference_usecase.dart'
    as _i472;
import 'package:Sakeenah/features/home/domain/usecase/get_today_prayer_times_usecase.dart'
    as _i26;
import 'package:Sakeenah/features/home/domain/usecase/save_location_preference_usecase.dart'
    as _i733;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final loggerModule = _$LoggerModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i166.NavigationService>(() => _i166.NavigationService());
    gh.lazySingleton<_i1067.NavigationRoute>(() => _i1067.NavigationRoute());
    gh.lazySingleton<_i46.HttpClient>(() => _i46.HttpClient());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    gh.factory<_i42.IPrayerTimesRemoteSource>(
      () => _i42.PrayerTimesRemoteSource(),
    );
    gh.factory<_i835.IHomeRemoteSource>(() => _i835.HomeRemoteSource());
    gh.factory<_i661.IPrayerTimesLocalSource>(
      () => _i661.PrayerTimesLocalSource(),
    );
    gh.factory<_i969.IPrayerTimesRepository>(
      () => _i969.PrayerTimesRepository(
        gh<_i42.IPrayerTimesRemoteSource>(),
        gh<_i661.IPrayerTimesLocalSource>(),
      ),
    );
    gh.factory<_i329.IHomeRepository>(
      () => _i329.HomeRepository(gh<_i835.IHomeRemoteSource>()),
    );
    gh.factory<_i472.GetLocationPreferenceUseCase>(
      () => _i472.GetLocationPreferenceUseCase(
        gh<_i969.IPrayerTimesRepository>(),
      ),
    );
    gh.factory<_i26.GetTodayPrayerTimesUseCase>(
      () => _i26.GetTodayPrayerTimesUseCase(gh<_i969.IPrayerTimesRepository>()),
    );
    gh.factory<_i733.SaveLocationPreferenceUseCase>(
      () => _i733.SaveLocationPreferenceUseCase(
        gh<_i969.IPrayerTimesRepository>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i349.SharedPreferencesModule {}

class _$LoggerModule extends _i319.LoggerModule {}
