part of 'imore_remote.dart';

@Singleton(as: IMoreRemoteSource)
class MoreRemoteSource extends IMoreRemoteSource {
  @override
  Future<Either<AppErrors, VersionModel>> checkUpdateApp(
    CheckVersionParam param,
  ) async {
    await Future.delayed(const Duration(seconds: 1));

    return Right(
      VersionModel(appLink: '', lastSupportedVersion: 1, lastVersion: 1),
    );
    // return request(
    //   converter: (json) => VersionModel.fromMap(json),
    //   method: HttpMethod.GET,
    //   url: "Check_Version_API",
    //   queryParameters: param.toMap(),
    // );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> reportProblem(
    ReportProblemParam params,
  ) {
    return request(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.API_REPORT_PROBLEM,
      body: params.toMap(),
    );
  }
}
