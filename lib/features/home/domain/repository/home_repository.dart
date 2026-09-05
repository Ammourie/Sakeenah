part of 'ihome_repository.dart';

@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  final IHomeRemoteSource remoteDataSource;

  HomeRepository(this.remoteDataSource);

  @override
  Future<Result<AppErrors, EmptyResponse>> testFailure(
      MockRequest mockRequest) async {
    final remote = await remoteDataSource.testFailure(mockRequest);
    return remote.result<EmptyResponse>();
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> testSuccess(
      MockRequest mockRequest) async {
    final remote = await remoteDataSource.testSuccess(mockRequest);
    return remote.result<EmptyResponse>();
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest) async {
    final remote = await remoteDataSource.testValidator(mockRequest);
    return remote.result<EmptyResponse>();
  }

  @override
  Future<Result<AppErrors, PeopleDataEntity>> getPeople(
      MockRequest mockRequest) async {
    final remote = await remoteDataSource.getPeople(mockRequest);
    return remote.result<PeopleDataEntity>();
  }

  @override
  Future<Result<AppErrors, List<CommentsEntity>>> getComments() async {
    final remote = await remoteDataSource.getComments();
    return executeForList<CommentsModel, CommentsEntity>(remoteResult: remote);
  }
}
