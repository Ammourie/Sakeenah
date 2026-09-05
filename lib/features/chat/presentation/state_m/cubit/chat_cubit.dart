import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/constants/app/app_settings.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/models/chat_ready_info.dart';
import '../../../../../core/params/page_param.dart';
import '../../../../../core/socket/chat_socket.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/request/param/message_list_param.dart';
import '../../../domain/entity/message_list_entity.dart';
import '../../../domain/usecase/get_message_list_usecase.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState.chatInit());

  void connectToChatSocket() async {
    final chatSocket = ChatSocket();
    emit(ChatState.successCreateChatSocket(data: chatSocket));

    emit(
      ChatState.chatLoading(
        message: "${S.current.createConnectionToTheServer}...",
      ),
    );
    try {
      // connect to server.
      chatSocket.connect(
        url: AppSettings.SOCKET_URL,
        onError: () {
          emit(
            ChatState.chatError(
              AppErrors.customError(message: S.current.connectionToServerFaild),
              () => connectToChatSocket(),
            ),
          );
        },
        onConnect: () {
          // emit start chat.
          chatSocket.emitStartChat();

          // on receive chat is ready.
          chatSocket.onChatReady((data) {
            if (data.id != null) {
              getChatMessageList(data);
            }
          });
        },
      );
    } catch (e) {
      emit(
        ChatState.chatError(
          AppErrors.customError(message: S.current.connectionToServerFaild),
          () => connectToChatSocket(),
        ),
      );
    }
  }

  void getChatMessageList(ChatReadyInfo chatInfo) async {
    emit(ChatState.chatLoading(message: "${S.current.loadingYourMessages}..."));

    final result = await getIt<GetMessageListUsecase>()(
      MessageListParam(pageParam: PageParam(page: 0), chatId: chatInfo.id!),
    );

    result.pick(
      onData: (data) {
        emit(ChatState.messageListLoaded(data: data, chatInfo: chatInfo));
      },
      onError: (error) {
        emit(
          ChatState.chatError(
            AppErrors.customError(message: S.current.connectionToServerFaild),
            () => getChatMessageList(chatInfo),
          ),
        );
      },
    );
  }
}
