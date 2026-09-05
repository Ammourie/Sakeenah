part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.chatInit() = ChatInitState;

  const factory ChatState.chatLoading({String? message}) = ChatLoadingState;

  const factory ChatState.successCreateChatSocket({required ChatSocket data}) =
      SuccessCreateChatSocket;

  const factory ChatState.messageListLoaded({
    required MessageListEntity data,
    required ChatReadyInfo chatInfo,
  }) = MessageListLoadedState;

  const factory ChatState.chatError(AppErrors error, VoidCallback callback) =
      ChatErrorState;
}
