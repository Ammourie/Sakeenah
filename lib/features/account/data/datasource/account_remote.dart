part of 'iaccount_remote.dart';

@Injectable(as: IAccountRemoteSource)
class AccountRemoteSource extends IAccountRemoteSource {
  @override
  Future<Either<AppErrors, LoginModel>> login(LoginRequest loginRequest) {
    return request<LoginModel>(
      converter: (json) => LoginModel.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.API_LOGIN,
      body: loginRequest.toMap(),
      cancelToken: loginRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, RegisterModel>> register(
    RegisterRequest registerRequest,
  ) async {
    return await request<RegisterModel>(
      converter: (json) => RegisterModel.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.API_REGISTER,
      body: registerRequest.toMap(),
      cancelToken: registerRequest.cancelToken,
    );
  }

  Future<Either<AppErrors, EmptyResponse>> resendNewPhoneNumberCode(
    NoParams params,
  ) {
    return request(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.PUT,
      url: APIUrls.API_RESEND_NEW_PHONE_NUMBER_CODE,
      cancelToken: params.cancelToken,
    );
  }

  Future<Either<AppErrors, EmptyResponse>> resendCode(ResendCodeParam params) {
    return request(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.API_RESEND_CODE,
      queryParameters: params.toMap(),
    );
  }

  Future<Either<AppErrors, EmptyResponse>> confirmDeleteMyAccount(
    ConfirmDeleteMyAccountParam params,
  ) {
    return request(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.DELETE,
      url: APIUrls.API_CONFIRM_DELETE_ACCOUNT,
      queryParameters: params.toMap(),
      cancelToken: params.cancelToken,
    );
  }

  Future<Either<AppErrors, EmptyResponse>> resendDeleteMyAccountCode(
    NoParams params,
  ) {
    return request(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.PUT,
      url: APIUrls.API_RESEND_DELETE_ACCOUNT_CODE,
      cancelToken: params.cancelToken,
    );
  }

  Future<Either<AppErrors, EmptyResponse>> confirmNewPhoneNumber(
    ConfirmNewPhoneNumberParam params,
  ) {
    return request(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.PUT,
      url: APIUrls.API_CONFIRM_NEW_PHONE_NUMBER,
      body: params.toMap(),
      cancelToken: params.cancelToken,
    );
  }

  Future<Either<AppErrors, ConfirmCodeModel>> confirmCode(
    ConfirmCodeParam params,
  ) {
    return request(
      converter: (json) => ConfirmCodeModel.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.API_CONFIRM_CODE,
      body: params.toMap(),
    );
  }

  @override
  Future<Either<AppErrors, ProfileModel>> profile(NoParams param) {
    return request(
      converter: (json) => ProfileModel.fromMap(json),
      method: HttpMethod.GET,
      url: APIUrls.API_PROFILE,
    );
  }

  @override
  Future<Either<AppErrors, RefreshTokenModel>> refreshToken(
    RefreshTokenParam param,
  ) {
    return request(
      converter: (json) => RefreshTokenModel.fromMap(json),
      method: HttpMethod.POST,
      body: param.toMap(),
      url: APIUrls.Refresh_Token_API,
      cancelToken: param.cancelToken,
    );
  }
}
