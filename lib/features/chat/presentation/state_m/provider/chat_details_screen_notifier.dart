import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/constants/enums/attachment_type.dart';
import '../../../../../core/constants/enums/create_attachment_type.dart';
import '../../../../../core/models/chat_message_data.dart';
import '../../../../../core/models/chat_ready_info.dart';
import '../../../../../core/models/message_sent_info.dart';
import '../../../../../core/models/receive_message_info.dart';
import '../../../../../core/socket/chat_socket.dart';
import '../../../../../di/service_locator.dart';
import '../../../../upload/data/model/request/upload_file_param.dart';
import '../../../../upload/domain/usecase/upload_file_usecase.dart';
import '../../../domain/entity/message_entity.dart';
import '../../screen/chat_details/chat_details_screen.dart';
import '../../widget/select_attachment_type_dialog.dart';
import '../cubit/chat_cubit.dart';

class ChatDetailsScreenNotifier extends ScreenNotifier {
  /// Constructors
  ChatDetailsScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final ChatDetailsScreenParam param;
  final chatCubit = ChatCubit();
  final refreshController = RefreshController();
  late ChatSocket chatSocket;
  List<MessageEntity> _messages = [];
  Map<DateTime, List<MessageEntity>> _groupedMessages = {};
  late ChatReadyInfo _chatInfo;

  /// Getters and Setters
  Map<DateTime, List<MessageEntity>> get groupedMessages => _groupedMessages;
  set messages(List<MessageEntity> val) {
    _messages = val;

    // Group messages by date
    final tempGroupedMessages = <DateTime, List<MessageEntity>>{};
    for (final message in _messages) {
      final date = DateTime(
        message.sentAt!.year,
        message.sentAt!.month,
        message.sentAt!.day,
      );
      tempGroupedMessages.putIfAbsent(date, () => []).add(message);
    }
    _groupedMessages = tempGroupedMessages;
    if (hasListeners) notifyListeners();
  }

  ChatReadyInfo get chatInfo => _chatInfo;
  set chatInfo(ChatReadyInfo val) {
    _chatInfo = val;
    if (hasListeners) notifyListeners();
  }

  /// Methods

  void _removeMessage(MessageEntity message) {
    _messages.remove(message);
    messages = [..._messages];
  }

  void _insertMessage(MessageEntity message) {
    _messages.insert(0, message);
    final date = DateTime(
      message.sentAt!.year,
      message.sentAt!.month,
      message.sentAt!.day,
    );
    if (groupedMessages.containsKey(date)) {
      groupedMessages[date]!.insert(0, message);
    } else {
      _groupedMessages = {
        date: [message],
        ..._groupedMessages,
      };
    }
    notifyListeners();
  }

  void connectToChatSocket() {
    chatCubit.connectToChatSocket();
  }

  void onSendMessage(String message) {
    if (_chatInfo.id != null && message.isNotEmpty) {
      final sentAt = DateTime.now();
      _insertMessage(
        MessageEntity(
          id: -1,
          chatId: chatInfo.id,
          senderId: chatInfo.myParticipant?.id,
          text: message,
          attachmentUrl: "",
          attachmentType: AttachmentType.None,
          sentAt: sentAt,
          successSent: false,
          isXFile: false,
        ),
      );

      chatSocket.emitSendMessage(
        ChatMessageData(
          chatId: _chatInfo.id!,
          receiverId: -1,
          text: message,
          attachmentUrl: null,
          attachmentType: null,
          sentAt: sentAt,
          version: 1.0,
        ),
      );
    }
  }

  void onReceiveMessage(ReceiveMessageInfo info) {
    _insertMessage(
      MessageEntity(
        id: info.id,
        chatId: info.chatId,
        senderId: info.senderId,
        text: info.text,
        attachmentUrl: info.attachmentUrl,
        attachmentType: info.attachmentType,
        sentAt: info.sentAt,
        successSent: true,
        isXFile: false,
      ),
    );
  }

  void onSuccessSentMessage(MessageSentInfo info) {
    if (info.sentAt != null) {
      final key = DateTime(
        info.sentAt!.year,
        info.sentAt!.month,
        info.sentAt!.day,
      );
      if (!groupedMessages.containsKey(key)) return;

      final values = groupedMessages[key] ?? [];
      for (int i = 0; i < values.length; i++) {
        if (_isSameDate(values[i].sentAt, info.sentAt)) {
          values[i] = MessageEntity(
            id: info.id,
            chatId: info.chatId,
            senderId: info.senderId,
            text: info.text,
            attachmentUrl: info.attachmentUrl,
            attachmentType: info.attachmentType,
            sentAt: info.sentAt,
            successSent: true,
            isXFile: false,
          );
          break;
        }
      }
      notifyListeners();
    }
  }

  void onAttachmentTap() async {
    AttachmentDialogType? selectedType = await showSelectAttachmentTypeDialog();
    if (selectedType == null) return;

    switch (selectedType) {
      case AttachmentDialogType.camera:
        final file = await ImagePicker().pickImage(source: ImageSource.camera);
        _handleSendFileMessage(file, AttachmentType.Image);
        break;
      case AttachmentDialogType.gallery:
        final file = await ImagePicker().pickImage(source: ImageSource.gallery);
        _handleSendFileMessage(file, AttachmentType.Image);
        break;
      case AttachmentDialogType.pdf:
        final file = await FilePicker.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );
        _handleSendFileMessage(file?.xFiles.firstOrNull, AttachmentType.PDF);
        break;
      case AttachmentDialogType.video:
        final file = await FilePicker.pickFiles(type: FileType.video);
        _handleSendFileMessage(file?.xFiles.firstOrNull, AttachmentType.Video);
        break;
      case AttachmentDialogType.audio:
        final file = await FilePicker.pickFiles(type: FileType.audio);
        _handleSendFileMessage(file?.xFiles.firstOrNull, AttachmentType.Audio);
        break;
      case AttachmentDialogType.word:
        final file = await FilePicker.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['doc', 'docx'],
        );
        _handleSendFileMessage(file?.xFiles.firstOrNull, AttachmentType.Word);
        break;
    }
  }

  void _handleSendFileMessage(XFile? file, AttachmentType type) {
    if (file == null || chatInfo.id == null) return;

    final tempMessage = MessageEntity(
      id: -1,
      chatId: chatInfo.id,
      senderId: chatInfo.myParticipant?.id,
      text: "",
      attachmentUrl: file.path,
      attachmentType: type,
      sentAt: DateTime.now(),
      successSent: false,
      isXFile: true,
    );
    _insertMessage(tempMessage);

    // upload image.
    uploadFileAndSend(tempMessage);
  }

  void uploadFileAndSend(MessageEntity message) async {
    final result = await getIt<UploadFileUsecase>()(
      UploadFileParam(
        name: message.attachmentUrl,
        imageUrl: message.attachmentUrl,
        onSendProgress: (_, _) {},
        onReceiveProgress: (_, _) {},
        attachmentType: CreateAttachmentType.Chat,
        fileType: message.attachmentType,
      ),
    );
    result.pick(
      onData: (data) {
        final messageData = ChatMessageData(
          chatId: _chatInfo.id!,
          receiverId: -1,
          text: null,
          attachmentUrl: data.url,
          attachmentType: message.attachmentType.mapToInt,
          sentAt: message.sentAt!,
          version: 1.0,
        );
        chatSocket.emitSendMessage(messageData);
      },
      onError: (error) {
        _removeMessage(message);
      },
    );
  }

  bool _isSameDate(DateTime? d1, DateTime? d2) {
    if (d1 == null || d2 == null) return false;

    return DateTime(d1.year, d1.month, d1.day, d1.hour, d1.minute, d1.second) ==
        DateTime(d2.year, d2.month, d2.day, d2.hour, d2.minute, d2.second);
  }

  @override
  void closeNotifier() {
    refreshController.dispose();
    chatCubit.close();
    chatSocket.disposeSocket();
    this.dispose();
  }
}
