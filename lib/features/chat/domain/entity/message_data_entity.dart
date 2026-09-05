import '../../../../core/constants/enums/attachment_type.dart';
import '../../../../core/entities/base_entity.dart';
import '../../../../core/entities/user_info_entity.dart';

class MessageDataEntity extends BaseEntity {
  final int? id;
  final int? senderId;
  final String text;
  final String attachmentUrl;
  final AttachmentType attachmentType;
  final DateTime? sentAt;
  final UserInfoEntity? sender;

  MessageDataEntity({
    required this.id,
    required this.senderId,
    required this.text,
    required this.attachmentUrl,
    required this.attachmentType,
    required this.sentAt,
    required this.sender,
  });

  @override
  List<Object?> get props => [
    this.id,
    this.senderId,
    this.text,
    this.attachmentUrl,
    this.attachmentType,
    this.sentAt,
    this.sender,
  ];
}
