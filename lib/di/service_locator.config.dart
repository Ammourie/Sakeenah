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
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:starter_application/core/navigation/navigation_service.dart'
    as _i943;
import 'package:starter_application/core/navigation/route_generator.dart'
    as _i1060;
import 'package:starter_application/core/net/http_client.dart' as _i184;
import 'package:starter_application/di/modules/logger_module.dart' as _i990;
import 'package:starter_application/di/modules/shared_preferences_module.dart'
    as _i592;
import 'package:starter_application/features/account/data/datasource/iaccount_remote.dart'
    as _i468;
import 'package:starter_application/features/account/domain/repository/iaccount_repository.dart'
    as _i893;
import 'package:starter_application/features/account/domain/usecase/confirm_code_usecase.dart'
    as _i112;
import 'package:starter_application/features/account/domain/usecase/confirm_delete_my_account_usecase.dart'
    as _i873;
import 'package:starter_application/features/account/domain/usecase/confirm_new_phone_number_usecase.dart'
    as _i641;
import 'package:starter_application/features/account/domain/usecase/get_profile_usecase.dart'
    as _i8;
import 'package:starter_application/features/account/domain/usecase/login_usecase.dart'
    as _i845;
import 'package:starter_application/features/account/domain/usecase/refresh_token_usecase.dart'
    as _i491;
import 'package:starter_application/features/account/domain/usecase/register_usecase.dart'
    as _i702;
import 'package:starter_application/features/account/domain/usecase/resend_code_usecase.dart'
    as _i476;
import 'package:starter_application/features/account/domain/usecase/resend_delete_my_account_code_usecase.dart'
    as _i292;
import 'package:starter_application/features/account/domain/usecase/resend_new_phone_number_code_usecase.dart'
    as _i359;
import 'package:starter_application/features/chat/data/datasource/ichat_remote.dart'
    as _i235;
import 'package:starter_application/features/chat/domain/repository/ichat_repository.dart'
    as _i430;
import 'package:starter_application/features/chat/domain/usecase/get_message_list_usecase.dart'
    as _i755;
import 'package:starter_application/features/home/data/datasource/ihome_remote.dart'
    as _i895;
import 'package:starter_application/features/home/domain/repository/ihome_repository.dart'
    as _i11;
import 'package:starter_application/features/home/domain/usecase/comments_usecase.dart'
    as _i816;
import 'package:starter_application/features/home/domain/usecase/get_people_usecase.dart'
    as _i635;
import 'package:starter_application/features/home/domain/usecase/test_failure_usecase.dart'
    as _i142;
import 'package:starter_application/features/home/domain/usecase/test_success_usecase.dart'
    as _i69;
import 'package:starter_application/features/home/domain/usecase/test_validator_usecase.dart'
    as _i630;
import 'package:starter_application/features/more/data/datasource/imore_remote.dart'
    as _i675;
import 'package:starter_application/features/more/domain/repository/imore_repository.dart'
    as _i211;
import 'package:starter_application/features/more/domain/usecase/check_update_app_usecase.dart'
    as _i1026;
import 'package:starter_application/features/more/domain/usecase/report_problem_usecase.dart'
    as _i357;
import 'package:starter_application/features/notification/data/datasource/inotification_remote.dart'
    as _i257;
import 'package:starter_application/features/notification/domain/repository/inotification_repository.dart'
    as _i759;
import 'package:starter_application/features/notification/domain/usecase/add_or_update_firebase_token_usecase.dart'
    as _i447;
import 'package:starter_application/features/notification/domain/usecase/change_notification_status_usecase.dart'
    as _i906;
import 'package:starter_application/features/notification/domain/usecase/get_notifications_usecase.dart'
    as _i435;
import 'package:starter_application/features/pokemon/data/datasource/ipokemon_remote.dart'
    as _i425;
import 'package:starter_application/features/pokemon/data/datasource/pokemon_remote.dart'
    as _i87;
import 'package:starter_application/features/pokemon/data/repository/pokemon_repository.dart'
    as _i310;
import 'package:starter_application/features/pokemon/domain/repository/irepository.dart'
    as _i1027;
import 'package:starter_application/features/pokemon/domain/usecase/get_pokemons_usecase.dart'
    as _i130;
import 'package:starter_application/features/upload/data/datasource/iupload_remote.dart'
    as _i981;
import 'package:starter_application/features/upload/domain/repository/iupload_repository.dart'
    as _i1047;
import 'package:starter_application/features/upload/domain/usecase/upload_file_usecase.dart'
    as _i975;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final loggerModule = _$LoggerModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i943.NavigationService>(() => _i943.NavigationService());
    gh.lazySingleton<_i1060.NavigationRoute>(() => _i1060.NavigationRoute());
    gh.lazySingleton<_i184.HttpClient>(() => _i184.HttpClient());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    gh.singleton<_i981.IUploadRemoteSource>(() => _i981.UploadRemoteSource());
    gh.factory<_i895.IHomeRemoteSource>(() => _i895.HomeRemoteSource());
    gh.singleton<_i675.IMoreRemoteSource>(() => _i675.MoreRemoteSource());
    gh.singleton<_i235.IChatRemoteSource>(() => _i235.ChatRemoteSource());
    gh.factory<_i468.IAccountRemoteSource>(() => _i468.AccountRemoteSource());
    gh.singleton<_i257.INotificationRemoteSource>(
        () => _i257.NotificationRemoteSource());
    gh.singleton<_i759.INotificationRepository>(() =>
        _i759.NotificationRepository(gh<_i257.INotificationRemoteSource>()));
    gh.factory<_i425.IPokemonRemoteSource>(() => _i87.PokemonRemoteSource());
    gh.factory<_i1027.IPokemonRepository>(
        () => _i310.PokemonRepository(gh<_i425.IPokemonRemoteSource>()));
    gh.singleton<_i1047.IUploadRepository>(
        () => _i1047.UploadRepository(gh<_i981.IUploadRemoteSource>()));
    gh.factory<_i11.IHomeRepository>(
        () => _i11.HomeRepository(gh<_i895.IHomeRemoteSource>()));
    gh.singleton<_i211.IMoreRepository>(
        () => _i211.MoreRepository(gh<_i675.IMoreRemoteSource>()));
    gh.singleton<_i430.IChatRepository>(
        () => _i430.ChatRepository(gh<_i235.IChatRemoteSource>()));
    gh.factory<_i816.CommentsUseCase>(
        () => _i816.CommentsUseCase(gh<_i11.IHomeRepository>()));
    gh.factory<_i635.GetPeopleUseCase>(
        () => _i635.GetPeopleUseCase(gh<_i11.IHomeRepository>()));
    gh.factory<_i142.TestFailureUseCase>(
        () => _i142.TestFailureUseCase(gh<_i11.IHomeRepository>()));
    gh.factory<_i69.TestSuccessUseCase>(
        () => _i69.TestSuccessUseCase(gh<_i11.IHomeRepository>()));
    gh.factory<_i630.TestValidatorUseCase>(
        () => _i630.TestValidatorUseCase(gh<_i11.IHomeRepository>()));
    gh.factory<_i130.GetPokemonsUseCase>(
        () => _i130.GetPokemonsUseCase(gh<_i1027.IPokemonRepository>()));
    gh.singleton<_i447.AddOrUpdateFirebaseTokenUsecase>(() =>
        _i447.AddOrUpdateFirebaseTokenUsecase(
            gh<_i759.INotificationRepository>()));
    gh.singleton<_i906.ChangeNotificationStatusUsecase>(() =>
        _i906.ChangeNotificationStatusUsecase(
            gh<_i759.INotificationRepository>()));
    gh.singleton<_i435.GetNotificationsUsecase>(() =>
        _i435.GetNotificationsUsecase(gh<_i759.INotificationRepository>()));
    gh.factory<_i893.IAccountRepository>(
        () => _i893.AccountRepository(gh<_i468.IAccountRemoteSource>()));
    gh.singleton<_i975.UploadFileUsecase>(
        () => _i975.UploadFileUsecase(gh<_i1047.IUploadRepository>()));
    gh.factory<_i112.ConfirmCodeUsecase>(
        () => _i112.ConfirmCodeUsecase(gh<_i893.IAccountRepository>()));
    gh.factory<_i873.ConfirmDeleteMyAccountUsecase>(() =>
        _i873.ConfirmDeleteMyAccountUsecase(gh<_i893.IAccountRepository>()));
    gh.factory<_i641.ConfirmNewPhoneNumberUsecase>(() =>
        _i641.ConfirmNewPhoneNumberUsecase(gh<_i893.IAccountRepository>()));
    gh.factory<_i8.GetProfileUsecase>(
        () => _i8.GetProfileUsecase(gh<_i893.IAccountRepository>()));
    gh.factory<_i845.LoginUseCase>(
        () => _i845.LoginUseCase(gh<_i893.IAccountRepository>()));
    gh.factory<_i702.RegisterUseCase>(
        () => _i702.RegisterUseCase(gh<_i893.IAccountRepository>()));
    gh.factory<_i476.ResendCodeUsecase>(
        () => _i476.ResendCodeUsecase(gh<_i893.IAccountRepository>()));
    gh.factory<_i292.ResendDeleteMyAccountCodeUsecase>(() =>
        _i292.ResendDeleteMyAccountCodeUsecase(gh<_i893.IAccountRepository>()));
    gh.factory<_i359.ResendNewPhoneNumberCodeUsecase>(() =>
        _i359.ResendNewPhoneNumberCodeUsecase(gh<_i893.IAccountRepository>()));
    gh.singleton<_i755.GetMessageListUsecase>(() =>
        _i755.GetMessageListUsecase(repository: gh<_i430.IChatRepository>()));
    gh.singleton<_i1026.CheckUpdateAppUsecase>(
        () => _i1026.CheckUpdateAppUsecase(gh<_i211.IMoreRepository>()));
    gh.factory<_i357.ReportProblemUsecase>(
        () => _i357.ReportProblemUsecase(gh<_i211.IMoreRepository>()));
    gh.singleton<_i491.RefreshTokenUsecase>(
        () => _i491.RefreshTokenUsecase(gh<_i893.IAccountRepository>()));
    return this;
  }
}

class _$SharedPreferencesModule extends _i592.SharedPreferencesModule {}

class _$LoggerModule extends _i990.LoggerModule {}
