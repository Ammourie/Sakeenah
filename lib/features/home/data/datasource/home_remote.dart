part of 'ihome_remote.dart';

@Injectable(as: IHomeRemoteSource)
class HomeRemoteSource extends IHomeRemoteSource {
  @override
  Future<Either<AppErrors, EmptyResponse>> testFailure(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> testSuccess(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
      responseValidator: TestResponseValidator(),
    );
  }

  @override
  Future<Either<AppErrors, PeopleDataModel>> getPeople(
      MockRequest mockRequest) {
    return request<PeopleDataModel>(
      converter: (json) => PeopleDataModel.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, List<CommentsModel>>> getComments() {
    return listRequest<CommentsModel>(
      converter: (json) => CommentsModel.fromJson(json),
      method: HttpMethod.GET,
      url: APIUrls.API_JP_COMMENTS,
      baseUrl: APIUrls.BASE_JSON_PLACEHOLDER,
    );
  }
}
