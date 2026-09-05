import '../../../../../core/common/type_validators.dart';
import '../../../../../core/constants/enums/attachment_type.dart';
import '../../../../../core/models/base_model.dart';
import '../../../../../core/models/user_info_model.dart';
import '../../../domain/entity/message_data_entity.dart';

class MessageDataModel extends BaseModel<MessageDataEntity> {
  final int? id;
  final int? senderId;
  final String text;
  final String attachmentUrl;
  final int? attachmentType;
  final DateTime? sentAt;
  final UserInfoModel? sender;

  MessageDataModel({
    required this.id,
    required this.senderId,
    required this.text,
    required this.attachmentUrl,
    required this.attachmentType,
    required this.sentAt,
    required this.sender,
  });

  factory MessageDataModel.fromMap(Map<String, dynamic> json) =>
      MessageDataModel(
        id: numV(json["id"]),
        senderId: numV(json["senderId"]),
        text: stringV(json["text"]),
        attachmentUrl: stringV(json["attachmentUrl"]),
        attachmentType: numV(json["attachmentType"]),
        sentAt: dateTimeV(json["sentAt"]),
        sender:
            json["sender"] == null
                ? null
                : UserInfoModel.fromMap(json["sender"]),
      );

  @override
  MessageDataEntity toEntity() {
    return MessageDataEntity(
      id: id,
      senderId: senderId,
      text: text,
      attachmentUrl: attachmentUrl,
      attachmentType: AttachmentType.mapToType(attachmentType),
      sentAt: sentAt,
      sender: sender?.toEntity(),
    );
  }
}
