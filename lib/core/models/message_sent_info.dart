import 'dart:convert';

import '../common/type_validators.dart';
import '../constants/enums/attachment_type.dart';
import 'user_info_model.dart';

class MessageSentInfo {
  MessageSentInfo({
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

  factory MessageSentInfo.fromJson(String str) =>
      MessageSentInfo.fromMap(json.decode(str));

  factory MessageSentInfo.fromMap(Map<String, dynamic> json) => MessageSentInfo(
    id: numV(json["id"]),
    senderId: numV(json["senderId"]),
    text: stringV(json["text"]),
    chatId: numV(json["chatId"]),
    attachmentUrl: stringV(json["attachmentUrl"]),
    attachmentType: AttachmentType.mapToType(numV(json["attachmentType"])),
    sentAt: dateTimeV(json["sentAt"])?.toLocal(),
    sender:
        json["sender"] == null ? null : UserInfoModel.fromMap(json["sender"]),
  );
}
