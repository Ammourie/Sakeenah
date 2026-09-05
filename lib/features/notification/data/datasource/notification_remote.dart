part of 'inotification_remote.dart';

@Singleton(as: INotificationRemoteSource)
class NotificationRemoteSource extends INotificationRemoteSource {
  @override
  Future<Either<AppErrors, List<NotificationModel>>> getNotifications(
      PageParam param) async {
    await Future.delayed(const Duration(seconds: 5));
    return Right(List.generate(
      10,
      (index) => NotificationModel(
        createDate: DateTime.now(),
        title: "title ${index + 1}",
        description: "description ${index + 1}",
        notificationType: index + 1,
        isSeen: false,
      ),
    ));
    // return listRequest(
    // 	converter: (json) => NotificationModel.fromMap(json),
    // 	method: HttpMethod.GET,
    // 	url: APIUrls.NOTIFICATIONS_API,
    //   queryParameters: param.toMap(),
    // );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> changeNotificationStatus(
      ChangeNotificationStatusParam param) async {
    return await request(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.PUT,
      url: APIUrls.API_CHANGE_NOTIFICATION_STATUS,
      queryParameters: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> addOrUpdateFirebaseToken(
      AddOrUpdateFirebaseTokenParam param) async {
    return Right(EmptyResponse(message: '', succeed: true));
    // return request(
    // 	converter: (json) => EmptyResponse.fromMap(json),
    // 	method: HttpMethod.POST,
    // 	url: APIUrls.ADD_OR_UPDATE_FIRBASE_TOKEN,
    // 	body: param.toMap(),
    // 	createModelInterceptor: const PrimativeCreateModelInterceptor(),
    // );
  }
}
