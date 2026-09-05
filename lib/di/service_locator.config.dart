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
import 'package:Sakeenah/features/account/data/datasource/iaccount_remote.dart'
    as _i1064;
import 'package:Sakeenah/features/account/domain/repository/iaccount_repository.dart'
    as _i713;
import 'package:Sakeenah/features/account/domain/usecase/confirm_code_usecase.dart'
    as _i1015;
import 'package:Sakeenah/features/account/domain/usecase/confirm_delete_my_account_usecase.dart'
    as _i179;
import 'package:Sakeenah/features/account/domain/usecase/confirm_new_phone_number_usecase.dart'
    as _i972;
import 'package:Sakeenah/features/account/domain/usecase/get_profile_usecase.dart'
    as _i670;
import 'package:Sakeenah/features/account/domain/usecase/login_usecase.dart'
    as _i245;
import 'package:Sakeenah/features/account/domain/usecase/refresh_token_usecase.dart'
    as _i995;
import 'package:Sakeenah/features/account/domain/usecase/register_usecase.dart'
    as _i472;
import 'package:Sakeenah/features/account/domain/usecase/resend_code_usecase.dart'
    as _i576;
import 'package:Sakeenah/features/account/domain/usecase/resend_delete_my_account_code_usecase.dart'
    as _i824;
import 'package:Sakeenah/features/account/domain/usecase/resend_new_phone_number_code_usecase.dart'
    as _i1062;
import 'package:Sakeenah/features/home/data/datasource/ihome_remote.dart'
    as _i835;
import 'package:Sakeenah/features/home/domain/repository/ihome_repository.dart'
    as _i329;
import 'package:Sakeenah/features/home/domain/usecase/comments_usecase.dart'
    as _i297;
import 'package:Sakeenah/features/home/domain/usecase/get_people_usecase.dart'
    as _i840;
import 'package:Sakeenah/features/home/domain/usecase/test_failure_usecase.dart'
    as _i187;
import 'package:Sakeenah/features/home/domain/usecase/test_success_usecase.dart'
    as _i592;
import 'package:Sakeenah/features/home/domain/usecase/test_validator_usecase.dart'
    as _i361;
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
    gh.factory<_i1064.IAccountRemoteSource>(() => _i1064.AccountRemoteSource());
    gh.factory<_i835.IHomeRemoteSource>(() => _i835.HomeRemoteSource());
    gh.factory<_i713.IAccountRepository>(
      () => _i713.AccountRepository(gh<_i1064.IAccountRemoteSource>()),
    );
    gh.factory<_i1015.ConfirmCodeUsecase>(
      () => _i1015.ConfirmCodeUsecase(gh<_i713.IAccountRepository>()),
    );
    gh.factory<_i179.ConfirmDeleteMyAccountUsecase>(
      () => _i179.ConfirmDeleteMyAccountUsecase(gh<_i713.IAccountRepository>()),
    );
    gh.factory<_i972.ConfirmNewPhoneNumberUsecase>(
      () => _i972.ConfirmNewPhoneNumberUsecase(gh<_i713.IAccountRepository>()),
    );
    gh.factory<_i670.GetProfileUsecase>(
      () => _i670.GetProfileUsecase(gh<_i713.IAccountRepository>()),
    );
    gh.factory<_i245.LoginUseCase>(
      () => _i245.LoginUseCase(gh<_i713.IAccountRepository>()),
    );
    gh.factory<_i472.RegisterUseCase>(
      () => _i472.RegisterUseCase(gh<_i713.IAccountRepository>()),
    );
    gh.factory<_i576.ResendCodeUsecase>(
      () => _i576.ResendCodeUsecase(gh<_i713.IAccountRepository>()),
    );
    gh.factory<_i824.ResendDeleteMyAccountCodeUsecase>(
      () => _i824.ResendDeleteMyAccountCodeUsecase(
        gh<_i713.IAccountRepository>(),
      ),
    );
    gh.factory<_i1062.ResendNewPhoneNumberCodeUsecase>(
      () => _i1062.ResendNewPhoneNumberCodeUsecase(
        gh<_i713.IAccountRepository>(),
      ),
    );
    gh.factory<_i329.IHomeRepository>(
      () => _i329.HomeRepository(gh<_i835.IHomeRemoteSource>()),
    );
    gh.singleton<_i995.RefreshTokenUsecase>(
      () => _i995.RefreshTokenUsecase(gh<_i713.IAccountRepository>()),
    );
    gh.factory<_i297.CommentsUseCase>(
      () => _i297.CommentsUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i840.GetPeopleUseCase>(
      () => _i840.GetPeopleUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i187.TestFailureUseCase>(
      () => _i187.TestFailureUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i592.TestSuccessUseCase>(
      () => _i592.TestSuccessUseCase(gh<_i329.IHomeRepository>()),
    );
    gh.factory<_i361.TestValidatorUseCase>(
      () => _i361.TestValidatorUseCase(gh<_i329.IHomeRepository>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i349.SharedPreferencesModule {}

class _$LoggerModule extends _i319.LoggerModule {}
