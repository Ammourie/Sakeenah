import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/ui/widgets/bubbles/bubble_image.dart';
import '../../../../core/ui/widgets/custom_image.dart';
import '../../domain/entity/message_entity.dart';

class ChatBubbleImage extends StatelessWidget {
  final MessageEntity message;
  final bool isMine;

  const ChatBubbleImage({
    super.key,
    required this.isMine,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return BubbleImage(
      id: message.sentAt.toString(),
      image:
          message.isXFile
              ? Image.file(File(message.attachmentUrl))
              : CustomImage.network(message.attachmentUrl),
      color: isMine ? const Color(0xFF1B97F3) : const Color(0xFFE8E8EE),
      isSender: isMine,
      sent: isMine ? message.successSent : false,
      sendAt:
          message.sentAt != null
              ? intl.DateFormat('H:mm').format(message.sentAt!)
              : "",
      sendAtTextStyle: TextStyle(
        fontSize: 9,
        color: isMine ? Colors.grey.shade200 : Colors.grey.shade500,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
