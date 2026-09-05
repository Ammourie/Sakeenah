import '../../../../../core/common/type_validators.dart';
import '../../../../../core/constants/enums/attachment_type.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/message_entity.dart';

class MessageModel extends BaseModel<MessageEntity> {
  final int? id;
  final int? chatId;
  final int? senderId;
  final String text;
  final String attachmentUrl;
  final int? attachmentType;
  final DateTime? sentAt;
  final bool successSent;
  final bool isXFile;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.text,
    required this.attachmentUrl,
    required this.attachmentType,
    required this.sentAt,
    required this.successSent,
    required this.isXFile,
  });

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
    id: numV(json["id"]),
    chatId: numV(json["chatId"]),
    senderId: numV(json["senderId"]),
    text: stringV(json["text"]),
    attachmentUrl: stringV(json["attachmentUrl"]),
    attachmentType: numV(json["attachmentType"]),
    sentAt: dateTimeV(json["sentAt"]),
    successSent: true,
    isXFile: false,
  );

  @override
  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      chatId: chatId,
      senderId: senderId,
      text: text,
      attachmentUrl: attachmentUrl,
      attachmentType: AttachmentType.mapToType(attachmentType),
      sentAt: sentAt?.toLocal(),
      successSent: successSent,
      isXFile: isXFile,
    );
  }
}
