import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/params/no_params.dart';
import '../request/model/confirm_code_model.dart';
import '../request/model/login_model.dart';
import '../request/model/profile_model.dart';
import '../request/model/refresh_token_model.dart';
import '../request/model/register_model.dart';
import '../request/param/confirm_code_param.dart';
import '../request/param/confirm_delete_my_account_param.dart';
import '../request/param/confirm_new_phone_number_param.dart';
import '../request/param/login_request.dart';
import '../request/param/refresh_token_param.dart';
import '../request/param/register_request.dart';
import '../request/param/resend_code_param.dart';

part 'account_remote.dart';

abstract class IAccountRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, LoginModel>> login(LoginRequest loginRequest);

  Future<Either<AppErrors, RegisterModel>> register(
    RegisterRequest registerRequest,
  );

  Future<Either<AppErrors, ProfileModel>> profile(NoParams param);

  Future<Either<AppErrors, EmptyResponse>> resendNewPhoneNumberCode(
    NoParams params,
  );
  Future<Either<AppErrors, EmptyResponse>> resendCode(ResendCodeParam params);
  Future<Either<AppErrors, EmptyResponse>> confirmDeleteMyAccount(
    ConfirmDeleteMyAccountParam params,
  );
  Future<Either<AppErrors, EmptyResponse>> resendDeleteMyAccountCode(
    NoParams params,
  );
  Future<Either<AppErrors, EmptyResponse>> confirmNewPhoneNumber(
    ConfirmNewPhoneNumberParam params,
  );
  Future<Either<AppErrors, ConfirmCodeModel>> confirmCode(
    ConfirmCodeParam params,
  );
  Future<Either<AppErrors, RefreshTokenModel>> refreshToken(
    RefreshTokenParam param,
  );
}
