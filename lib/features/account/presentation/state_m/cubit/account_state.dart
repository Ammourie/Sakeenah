part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.accountInit() = AccountInit;
  const factory AccountState.accountLoading() = AccountLoading;
  const factory AccountState.loginLoaded(LoginEntity loginEntity) =
      AccLoginLoaded;
  const factory AccountState.registerLoaded(RegisterEntity registerEntity) =
      AccRegisterLoaded;
  const factory AccountState.profileLoaded({required ProfileEntity data}) =
      ProfileLoadedState;
  const factory AccountState.successResendNewPhoneNumberCode() =
      SuccessResendNewPhoneNumberCodeState;
  const factory AccountState.successResendCode() = SuccessResendCodeState;
  const factory AccountState.successConfirmDeleteMyAccount() =
      SuccessConfirmDeleteMyAccountState;
  const factory AccountState.successResendDeleteMyAccountCode() =
      SuccessResendDeleteMyAccountCodeState;
  const factory AccountState.successConfirmNewPhoneNumber() =
      SuccessConfirmNewPhoneNumberState;
  const factory AccountState.confirmCodeLoaded({
    required ConfirmCodeEntity data,
  }) = ConfirmCodeLoadedState;
  const factory AccountState.refreshTokenLoaded({
    required RefreshTokenEntity data,
  }) = RefreshTokenLoadedState;
  const factory AccountState.accountError(
    AppErrors error,
    VoidCallback callback,
  ) = AccountError;
  const factory AccountState.successLogout() = SuccessLogoutState;
}
