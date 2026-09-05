import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/utils/utils.dart';
import '../../../../core/ui/widgets/bubbles/bubble_text.dart';
import '../../domain/entity/message_entity.dart';

class ChatBubbleText extends StatelessWidget {
  final MessageEntity message;
  final bool isMine;

  const ChatBubbleText({
    super.key,
    required this.isMine,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return BubbleText(
      onTextTap: () async {
        final uri = Uri.tryParse(message.text);
        if (uri != null && await canLaunchUrl(uri)) {
          Utils.launchURL(uri);
        }
      },
      text: message.text,
      color: isMine ? const Color(0xFF1B97F3) : const Color(0xFFE8E8EE),
      textStyle: TextStyle(
        color: isMine ? Colors.white : Colors.black,
        fontSize: 16,
      ),
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
