part of 'ichat_repository.dart';

@Singleton(as: IChatRepository)
class ChatRepository extends IChatRepository {
  final IChatRemoteSource remoteDataSource;

  ChatRepository(this.remoteDataSource);

  @override
  Future<Result<AppErrors, MessageListEntity>> messageList(
    MessageListParam param,
  ) async {
    return execute(remoteResult: await remoteDataSource.messageList(param));
  }
}
