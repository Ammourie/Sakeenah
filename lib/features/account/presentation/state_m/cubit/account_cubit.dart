import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/common/app_config.dart';
import '../../../../../core/common/local_storage.dart';
import '../../../../../core/common/utils/cubit_utils.dart';
import '../../../../../core/constants/shared_preference/shared_preference_keys.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/params/no_params.dart';
import '../../../../../core/results/result.dart';
import '../../../../../core/ui/widgets/restart_widget.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/request/param/confirm_code_param.dart';
import '../../../data/request/param/confirm_delete_my_account_param.dart';
import '../../../data/request/param/confirm_new_phone_number_param.dart';
import '../../../data/request/param/login_request.dart';
import '../../../data/request/param/refresh_token_param.dart';
import '../../../data/request/param/register_request.dart';
import '../../../data/request/param/resend_code_param.dart';
import '../../../domain/entity/confirm_code_entity.dart';
import '../../../domain/entity/login_entity.dart';
import '../../../domain/entity/profile_entity.dart';
import '../../../domain/entity/refresh_token_entity.dart';
import '../../../domain/entity/register_entity.dart';
import '../../../domain/usecase/confirm_code_usecase.dart';
import '../../../domain/usecase/confirm_delete_my_account_usecase.dart';
import '../../../domain/usecase/confirm_new_phone_number_usecase.dart';
import '../../../domain/usecase/get_profile_usecase.dart';
import '../../../domain/usecase/login_usecase.dart';
import '../../../domain/usecase/refresh_token_usecase.dart';
import '../../../domain/usecase/register_usecase.dart';
import '../../../domain/usecase/resend_code_usecase.dart';
import '../../../domain/usecase/resend_delete_my_account_code_usecase.dart';
import '../../../domain/usecase/resend_new_phone_number_code_usecase.dart';

part 'account_cubit.freezed.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState.accountInit());

  void login(LoginRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<LoginUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.loginLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => this.login(body)));
      },
    );
  }

  void register(RegisterRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<RegisterUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.registerLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => this.register(body)));
      },
    );
  }

  void getProfile(NoParams param) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<GetProfileUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(AccountState.profileLoaded(data: data));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => getProfile(param)));
      },
    );
  }

  void resendNewPhoneNumberCode(NoParams param) async {
    emit(const AccountState.accountLoading());
    final result = await getIt<ResendNewPhoneNumberCodeUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(const AccountState.successResendNewPhoneNumberCode());
      },
      onError: (error) {
        emit(
          AccountState.accountError(
            error,
            () => resendNewPhoneNumberCode(param),
          ),
        );
      },
    );
  }

  void resendCode(ResendCodeParam param) async {
    emit(const AccountState.accountLoading());
    final result = await getIt<ResendCodeUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(const AccountState.successResendCode());
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => resendCode(param)));
      },
    );
  }

  void confirmDeleteMyAccount(ConfirmDeleteMyAccountParam param) async {
    emit(const AccountState.accountLoading());
    final result = await getIt<ConfirmDeleteMyAccountUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(const AccountState.successConfirmDeleteMyAccount());
      },
      onError: (error) {
        emit(
          AccountState.accountError(error, () => confirmDeleteMyAccount(param)),
        );
      },
    );
  }

  void resendDeleteMyAccountCode() async {
    emit(const AccountState.accountLoading());
    final result = await getIt<ResendDeleteMyAccountCodeUsecase>()(NoParams());

    result.pick(
      onData: (data) {
        emit(const AccountState.successResendDeleteMyAccountCode());
      },
      onError: (error) {
        emit(
          AccountState.accountError(error, () => resendDeleteMyAccountCode()),
        );
      },
    );
  }

  void confirmNewPhoneNumber(ConfirmNewPhoneNumberParam param) async {
    emit(const AccountState.accountLoading());
    final result = await getIt<ConfirmNewPhoneNumberUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(const AccountState.successConfirmNewPhoneNumber());
      },
      onError: (error) {
        emit(
          AccountState.accountError(error, () => confirmNewPhoneNumber(param)),
        );
      },
    );
  }

  void confirmCode(ConfirmCodeParam param) async {
    emit(const AccountState.accountLoading());
    final result = await getIt<ConfirmCodeUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(AccountState.confirmCodeLoaded(data: data));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => confirmCode(param)));
      },
    );
  }

  void logout() async {
    emit(const AccountState.accountLoading());

    for (String key in SharedPreferenceKeys.REMOVE_KEYS_ON_LOGOUT) {
      bool success = await LocalStorage.sharedPreferences.remove(key);
      if (success) debugPrint("$key removed");
    }

    // Todo: remove this line
    await Future.delayed(const Duration(seconds: 1));

    final List<Result> results = await Future.wait([]);
    final error = CubitUtils.checkError(results);

    if (error != null) {
      emit(AccountState.accountError(error, () => this.logout()));
    } else {
      emit(const AccountState.successLogout());
      RestartWidget.restartApp(AppConfig().appContext!);
    }
  }

  void refreshToken(RefreshTokenParam param) async {
    emit(const AccountState.accountLoading());
    final result = await getIt<RefreshTokenUsecase>()(param);
    result.pick(
      onData: (data) {
        emit(AccountState.refreshTokenLoaded(data: data));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => this.refreshToken(param)));
      },
    );
  }
}
