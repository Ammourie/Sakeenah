part of 'ichat_remote.dart';

@Singleton(as: IChatRemoteSource)
class ChatRemoteSource extends IChatRemoteSource {
  @override
  Future<Either<AppErrors, MessageListModel>> messageList(
    MessageListParam param,
  ) {
    return request(
      converter: (json) => MessageListModel.fromMap(json),
      method: HttpMethod.GET,
      url: APIUrls.CHAT_MESSAGES,
      queryParameters: param.toMap(),
      cancelToken: param.cancelToken,
    );
  }
}
