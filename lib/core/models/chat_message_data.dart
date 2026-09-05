import 'dart:convert';

class ChatMessageData {
  final int chatId;
  final int receiverId;
  final String? text;
  final String? attachmentUrl;
  final int? attachmentType;
  final DateTime sentAt;
  final double version;

  ChatMessageData({
    required this.chatId,
    required this.receiverId,
    required this.text,
    required this.attachmentUrl,
    required this.attachmentType,
    required this.sentAt,
    required this.version,
  });

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'receiverId': receiverId,
      'text': text,
      'attachmentUrl': attachmentUrl,
      'attachmentType': attachmentType,
      'sentAt': sentAt.toUtc().toIso8601String(),
      'version': version,
    };
  }

  String toJson() => json.encode(toMap());
}
