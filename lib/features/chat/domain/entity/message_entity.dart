import 'package:flutter/material.dart';

import '../../../../core/constants/enums/attachment_type.dart';
import '../../../../core/entities/base_entity.dart';

class MessageEntity extends BaseEntity {
  final key = GlobalKey();
  final int? id;
  final int? chatId;
  final int? senderId;
  final String text;
  final String attachmentUrl;
  final AttachmentType attachmentType;
  final DateTime? sentAt;
  final bool successSent;
  final bool isXFile;

  MessageEntity({
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

  @override
  List<Object?> get props => [
    this.id,
    this.chatId,
    this.senderId,
    this.text,
    this.attachmentUrl,
    this.attachmentType,
    this.sentAt,
    this.successSent,
    this.isXFile,
  ];
}
