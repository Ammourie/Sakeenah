import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/iaccount_remote.dart';
import '../../data/request/model/login_model.dart';
import '../../data/request/model/register_model.dart';
import '../../data/request/param/confirm_code_param.dart';
import '../../data/request/param/confirm_delete_my_account_param.dart';
import '../../data/request/param/confirm_new_phone_number_param.dart';
import '../../data/request/param/login_request.dart';
import '../../data/request/param/refresh_token_param.dart';
import '../../data/request/param/register_request.dart';
import '../../data/request/param/resend_code_param.dart';
import '../entity/confirm_code_entity.dart';
import '../entity/login_entity.dart';
import '../entity/profile_entity.dart';
import '../entity/refresh_token_entity.dart';
import '../entity/register_entity.dart';

part 'account_repository.dart';

abstract class IAccountRepository extends Repository {
  Future<Result<AppErrors, LoginEntity>> login(LoginRequest loginRequest);

  Future<Result<AppErrors, RegisterEntity>> register(
    RegisterRequest registerRequest,
  );

  Future<Result<AppErrors, ProfileEntity>> profile(NoParams param);

  Future<Result<AppErrors, EmptyResponse>> resendNewPhoneNumberCode(
    NoParams params,
  );
  Future<Result<AppErrors, EmptyResponse>> resendCode(ResendCodeParam params);
  Future<Result<AppErrors, EmptyResponse>> confirmDeleteMyAccount(
    ConfirmDeleteMyAccountParam params,
  );
  Future<Result<AppErrors, EmptyResponse>> resendDeleteMyAccountCode(
    NoParams params,
  );
  Future<Result<AppErrors, EmptyResponse>> confirmNewPhoneNumber(
    ConfirmNewPhoneNumberParam params,
  );
  Future<Result<AppErrors, ConfirmCodeEntity>> confirmCode(
    ConfirmCodeParam params,
  );
  Future<Result<AppErrors, RefreshTokenEntity>> refreshToken(
    RefreshTokenParam param,
  );
}
