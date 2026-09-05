import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/common/app_config.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/ui/widgets/bubbles/bubble_widget.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entity/message_entity.dart';

class ChatBubbleAudio extends StatefulWidget {
  final MessageEntity message;
  final bool isMine;

  const ChatBubbleAudio({
    super.key,
    required this.isMine,
    required this.message,
  });

  @override
  State<ChatBubbleAudio> createState() => _ChatBubbleVideoState();
}

class _ChatBubbleVideoState extends State<ChatBubbleAudio> {
  VideoPlayerController? videoPlayerController;
  ChewieAudioController? chewieController;
  bool initializeError = false;
  bool isXFile = false;

  void _initializeControllers() {
    try {
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.message.attachmentUrl),
      );
      final chewieProgressColors = ChewieProgressColors(
        playedColor: Theme.of(AppConfig().appContext!).primaryColor,
        bufferedColor: Theme.of(
          AppConfig().appContext!,
        ).primaryColor.withValues(alpha: .2),
      );
      videoPlayerController!.initialize().then(
        (_) {
          chewieController = ChewieAudioController(
            cupertinoProgressColors: chewieProgressColors,
            materialProgressColors: chewieProgressColors,
            showOptions: false,
            videoPlayerController: videoPlayerController!,
            errorBuilder: (_, errorMessage) => Text(errorMessage),
          );

          if (mounted) {
            setState(() {});
          }
        },
        onError: (e) {
          debugPrint(e.toString());
          initializeError = true;

          if (mounted) {
            setState(() {});
          }
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      initializeError = true;

      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // display video only if it's not a XFile.
    isXFile = widget.message.isXFile;
    if (isXFile) return;

    _initializeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BubbleWidget(
      contentPadding: const EdgeInsets.all(3),
      color: widget.isMine ? const Color(0xFF1B97F3) : const Color(0xFFE8E8EE),
      isSender: widget.isMine,
      sent: widget.isMine ? widget.message.successSent : false,
      sendAt:
          widget.message.sentAt != null
              ? intl.DateFormat('H:mm').format(widget.message.sentAt!)
              : "",
      sendAtTextStyle: TextStyle(
        fontSize: 9,
        color: widget.isMine ? Colors.grey.shade200 : Colors.grey.shade500,
        fontWeight: FontWeight.w600,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.BUBBLE_RADIUS),
        child:
            initializeError
                ? Text(
                  S.current.anErrorOccurredWhileDisplayingTheAudio,
                  style: const TextStyle(fontSize: 12),
                )
                : chewieController != null
                ? ChewieAudio(controller: chewieController!)
                : Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    height: 50,
                    width: .5.sw,
                    decoration: const BoxDecoration(color: Colors.black),
                  ),
                ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ChatBubbleAudio oldWidget) {
    if (isXFile && (!widget.message.isXFile)) {
      isXFile = false;
      _initializeControllers();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }
}
