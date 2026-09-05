import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../../../core/constants/enums/attachment_type.dart';
import '../../../../../core/params/page_param.dart';
import '../../../../../core/results/result.dart';
import '../../../../../core/ui/widgets/chat_message_bar.dart';
import '../../../../../core/ui/widgets/pagination_widget.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/request/param/message_list_param.dart';
import '../../../domain/entity/message_entity.dart';
import '../../../domain/usecase/get_message_list_usecase.dart';
import '../../state_m/provider/chat_details_screen_notifier.dart';
import '../../widget/chat_bubble_audio.dart';
import '../../widget/chat_bubble_image.dart';
import '../../widget/chat_bubble_pdf.dart';
import '../../widget/chat_bubble_text.dart';
import '../../widget/chat_bubble_video.dart';
import '../../widget/chat_bubble_word.dart';

class ChatDetailsScreenContent extends StatefulWidget {
  const ChatDetailsScreenContent({Key? key}) : super(key: key);
  @override
  State<ChatDetailsScreenContent> createState() =>
      _ChatDetailsScreenContentState();
}

class _ChatDetailsScreenContentState extends State<ChatDetailsScreenContent> {
  late ChatDetailsScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.watch<ChatDetailsScreenNotifier>();
    sn.context = context;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Expanded(child: _buildMessages()),
          ChatMessageBar(
            textAlign: intl.Bidi.isRtlLanguage()
                ? TextAlign.end
                : TextAlign.start,
            messageBarHintText: S.current.typeYourMessageHere,
            messageBarHintStyle: const TextStyle(fontSize: 14),
            onSend: sn.onSendMessage,
            actions: [
              IconButton(
                icon: const Icon(Icons.attachment),
                onPressed: sn.onAttachmentTap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessages() {
    if (sn.groupedMessages.keys.isEmpty) {
      return Center(child: Text(S.current.thereAreNoMessagesToDisplay));
    }
    return const _ChatListView();
  }
}

class _ChatListView extends StatefulWidget {
  const _ChatListView({Key? key}) : super(key: key);

  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<_ChatListView> {
  late ChatDetailsScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = context.read<ChatDetailsScreenNotifier>();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<ChatDetailsScreenNotifier>();

    return PaginationWidget<MessageEntity>(
      enablePullUp: true,
      enablePullDown: false,
      refreshController: sn.refreshController,
      initialItems: sn.groupedMessages.values.expand((list) => list).toList(),
      onDataFetched: (items, nextUnit) {
        sn.messages = items;
      },
      getItems: (page) async {
        final result = await getIt<GetMessageListUsecase>()(
          MessageListParam(
            pageParam: PageParam(page: page),
            chatId: sn.chatInfo.id!,
          ),
        );

        return Result(data: result.data?.items, error: result.error);
      },
      child: ListView.builder(
        scrollCacheExtent: const ScrollCacheExtent.pixels(double.infinity),
        reverse: true,
        itemCount: sn.groupedMessages.keys.length,
        itemBuilder: (context, index) {
          final key = sn.groupedMessages.keys.toList()[index];
          final messages = sn.groupedMessages[key];

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Text(
                      intl.DateFormat('MMMM d, y').format(key),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 20),
                physics: const BouncingScrollPhysics(),
                reverse: true,
                itemCount: messages!.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  bool isMine =
                      message.senderId == sn.chatInfo.myParticipant?.id;

                  return Column(
                    crossAxisAlignment: isMine
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      switch (message.attachmentType) {
                        AttachmentType.Image => ChatBubbleImage(
                          key: message.key,
                          isMine: isMine,
                          message: message,
                        ),
                        AttachmentType.PDF => ChatBubblePDF(
                          key: message.key,
                          isMine: isMine,
                          message: message,
                        ),
                        AttachmentType.Video => ChatBubbleVideo(
                          key: message.key,
                          isMine: isMine,
                          message: message,
                        ),
                        AttachmentType.Audio => ChatBubbleAudio(
                          key: message.key,
                          isMine: isMine,
                          message: message,
                        ),
                        AttachmentType.Word => ChatBubbleWord(
                          key: message.key,
                          isMine: isMine,
                          message: message,
                        ),
                        _ => ChatBubbleText(isMine: isMine, message: message),
                      },
                    ],
                  );
                },
                separatorBuilder: (_, __) => 10.verticalSpace,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
