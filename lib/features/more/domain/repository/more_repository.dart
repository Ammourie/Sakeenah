part of 'imore_repository.dart';

@Singleton(as: IMoreRepository)
class MoreRepository extends IMoreRepository {
  final IMoreRemoteSource remoteDataSource;

  MoreRepository(this.remoteDataSource);

  @override
  Future<Result<AppErrors, VersionEntity>> checkUpdateApp(
      CheckVersionParam param) async {
    return execute(remoteResult: await remoteDataSource.checkUpdateApp(param));
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> reportProblem(
      ReportProblemParam params) async {
    return executeForNoEntity(
        remoteResult: await remoteDataSource.reportProblem(params));
  }
}
