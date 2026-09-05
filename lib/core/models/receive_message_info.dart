import 'dart:convert';

import '../common/type_validators.dart';
import '../constants/enums/attachment_type.dart';
import 'user_info_model.dart';

class ReceiveMessageInfo {
  ReceiveMessageInfo({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.text,
    required this.attachmentUrl,
    required this.attachmentType,
    required this.sentAt,
    required this.sender,
  });

  final int? id;
  final int? chatId;
  final int? senderId;
  final String text;
  final String attachmentUrl;
  final AttachmentType attachmentType;
  final DateTime? sentAt;
  final UserInfoModel? sender;

  factory ReceiveMessageInfo.fromJson(String str) =>
      ReceiveMessageInfo.fromMap(json.decode(str));

  factory ReceiveMessageInfo.fromMap(Map<String, dynamic> json) =>
      ReceiveMessageInfo(
        id: numV(json["id"]),
        senderId: numV(json["senderId"]),
        text: stringV(json["text"]),
        chatId: numV(json["chatId"]),
        attachmentUrl: stringV(json["attachmentUrl"]),
        attachmentType: AttachmentType.mapToType(numV(json["attachmentType"])),
        sentAt: dateTimeV(json["sentAt"])?.toLocal(),
        sender:
            json["sender"] == null
                ? null
                : UserInfoModel.fromMap(json["sender"]),
      );
}
