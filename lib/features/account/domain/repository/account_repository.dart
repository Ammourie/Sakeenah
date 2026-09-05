part of 'iaccount_repository.dart';

@Injectable(as: IAccountRepository)
class AccountRepository extends IAccountRepository {
  final IAccountRemoteSource remoteDataSource;

  AccountRepository(this.remoteDataSource);

  @override
  Future<Result<AppErrors, LoginEntity>> login(
    LoginRequest loginRequest,
  ) async {
    final remote = await remoteDataSource.login(loginRequest);
    return execute<LoginModel, LoginEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, RegisterEntity>> register(
    RegisterRequest registerRequest,
  ) async {
    final remote = await remoteDataSource.register(registerRequest);
    return execute<RegisterModel, RegisterEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, ConfirmCodeEntity>> confirmCode(
    ConfirmCodeParam params,
  ) async {
    return execute(remoteResult: await remoteDataSource.confirmCode(params));
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> confirmDeleteMyAccount(
    ConfirmDeleteMyAccountParam params,
  ) async {
    return executeForNoEntity(
      remoteResult: await remoteDataSource.confirmDeleteMyAccount(params),
    );
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> confirmNewPhoneNumber(
    ConfirmNewPhoneNumberParam params,
  ) async {
    return executeForNoEntity(
      remoteResult: await remoteDataSource.confirmNewPhoneNumber(params),
    );
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> resendCode(
    ResendCodeParam params,
  ) async {
    return executeForNoEntity(
      remoteResult: await remoteDataSource.resendCode(params),
    );
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> resendDeleteMyAccountCode(
    NoParams params,
  ) async {
    return executeForNoEntity(
      remoteResult: await remoteDataSource.resendDeleteMyAccountCode(params),
    );
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> resendNewPhoneNumberCode(
    NoParams params,
  ) async {
    return executeForNoEntity(
      remoteResult: await remoteDataSource.resendNewPhoneNumberCode(params),
    );
  }

  @override
  Future<Result<AppErrors, ProfileEntity>> profile(NoParams param) async {
    return execute(remoteResult: await remoteDataSource.profile(param));
  }

  @override
  Future<Result<AppErrors, RefreshTokenEntity>> refreshToken(
    RefreshTokenParam param,
  ) async {
    return execute(remoteResult: await remoteDataSource.refreshToken(param));
  }
}
