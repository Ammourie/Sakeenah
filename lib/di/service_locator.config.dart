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
import 'package:Sakeenah/features/home/data/datasource/ihome_remote_datasource.dart'
    as _i627;
import 'package:Sakeenah/features/home/data/datasource/quran_radio_player.dart'
    as _i750;
import 'package:Sakeenah/features/home/domain/repository/ihome_repository.dart'
    as _i329;
import 'package:Sakeenah/features/home/domain/usecase/get_manual_location_usecases.dart'
    as _i1034;
import 'package:Sakeenah/features/home/domain/usecase/get_today_prayer_times_usecase.dart'
    as _i26;
import 'package:Sakeenah/features/home/domain/usecase/pause_quran_radio_usecase.dart'
    as _i833;
import 'package:Sakeenah/features/home/domain/usecase/play_quran_radio_usecase.dart'
    as _i470;
import 'package:Sakeenah/features/home/domain/usecase/retry_quran_radio_usecase.dart'
    as _i659;
import 'package:Sakeenah/features/home/domain/usecase/seek_quran_radio_to_usecase.dart'
    as _i349;
import 'package:Sakeenah/features/home/domain/usecase/seek_quran_radio_usecase.dart'
    as _i977;
import 'package:Sakeenah/features/home/domain/usecase/set_quran_radio_volume_usecase.dart'
    as _i130;
import 'package:Sakeenah/features/home/domain/usecase/stop_quran_radio_usecase.dart'
    as _i966;
import 'package:Sakeenah/features/home/domain/usecase/watch_quran_radio_usecase.dart'
    as _i233;
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
    gh.lazySingleton<_i750.QuranRadioPlayer>(() => _i750.QuranRadioPlayer());
    gh.factory<_i627.IHomeLocalSource>(() => _i627.HomeLocalSource());
    gh.factory<_i627.IHomeRemoteSource>(
      () => _i627.HomeRemoteSource(
        gh<_i627.IHomeLocalSource>(),
        gh<_i750.QuranRadioPlayer>(),
      ),
    );
    gh.factory<_i329.IHomeRepository>(
      () => _i329.HomeRepository(
        gh<_i627.IHomeRemoteSource>(),
        gh<_i627.IHomeLocalSource>(),
      ),
    );
    gh.singleton<_i1034.GetCountriesUseCase>(
      () => _i1034.GetCountriesUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.singleton<_i1034.GetCitiesByCountryUseCase>(
      () => _i1034.GetCitiesByCountryUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i26.GetTodayPrayerTimesUseCase>(
      () => _i26.GetTodayPrayerTimesUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i833.PauseQuranRadioUseCase>(
      () => _i833.PauseQuranRadioUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i470.PlayQuranRadioUseCase>(
      () => _i470.PlayQuranRadioUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i659.RetryQuranRadioUseCase>(
      () => _i659.RetryQuranRadioUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i349.SeekQuranRadioToUseCase>(
      () => _i349.SeekQuranRadioToUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i977.SeekQuranRadioUseCase>(
      () => _i977.SeekQuranRadioUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i130.SetQuranRadioVolumeUseCase>(
      () => _i130.SetQuranRadioVolumeUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i966.StopQuranRadioUseCase>(
      () => _i966.StopQuranRadioUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i233.WatchQuranRadioUseCase>(
      () => _i233.WatchQuranRadioUseCase(gh<_i329.IHomeRepository>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i349.SharedPreferencesModule {}

class _$LoggerModule extends _i319.LoggerModule {}
