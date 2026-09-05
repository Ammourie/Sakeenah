import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app/app_constants.dart';

class BubbleImage extends StatelessWidget {
  static const loadingWidget = Center(child: CircularProgressIndicator());

  final String id;
  final Widget image;
  final double bubbleRadius;
  final bool isSender;
  final Color color;
  final bool tail;
  final bool sent;
  final bool delivered;
  final bool seen;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final String? sendAt;
  final TextStyle? sendAtTextStyle;

  const BubbleImage({
    Key? key,
    required this.id,
    required this.image,
    this.bubbleRadius = AppConstants.BUBBLE_RADIUS,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.fromLTRB(16, 8, 16, 8),
    this.leading,
    this.trailing,
    this.isSender = true,
    this.color = Colors.white70,
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.onTap,
    this.onLongPress,
    this.sendAt,
    this.sendAtTextStyle,
  }) : super(key: key);

  /// image bubble builder method
  @override
  Widget build(BuildContext context) {
    bool stateTick = false;
    Icon? stateIcon;
    if (sent) {
      stateTick = true;
      stateIcon = const Icon(Icons.done, size: 18, color: Color(0xFF97AD8E));
    }
    if (delivered) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF92DEDA),
      );
    }

    return Row(
      children: <Widget>[
        isSender
            ? const Expanded(child: SizedBox(width: 5))
            : leading ?? Container(),
        Container(
          padding: padding,
          margin: margin,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .5,
            maxHeight: MediaQuery.of(context).size.width * .5,
          ),
          child: GestureDetector(
            child: Hero(
              tag: id,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(bubbleRadius),
                        topRight: Radius.circular(bubbleRadius),
                        bottomLeft: Radius.circular(
                          tail
                              ? isSender
                                  ? bubbleRadius
                                  : 0
                              : AppConstants.BUBBLE_RADIUS,
                        ),
                        bottomRight: Radius.circular(
                          tail
                              ? isSender
                                  ? 0
                                  : bubbleRadius
                              : AppConstants.BUBBLE_RADIUS,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(bubbleRadius),
                        child: image,
                      ),
                    ),
                  ),
                  stateIcon != null && stateTick
                      ? Positioned(
                        bottom: 5,
                        right: 6,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (sendAt != null) ...[
                              Text(sendAt!, style: sendAtTextStyle),
                              5.horizontalSpace,
                            ],
                            stateTick ? stateIcon : 10.horizontalSpace,
                          ],
                        ),
                      )
                      : const SizedBox(width: 1),
                ],
              ),
            ),
            onLongPress: onLongPress,
            onTap:
                onTap ??
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return _DetailScreen(tag: id, image: image);
                      },
                    ),
                  );
                },
          ),
        ),
        if (isSender && trailing != null) const SizedBox.shrink(),
      ],
    );
  }
}

/// detail screen of the image, display when tap on the image bubble
class _DetailScreen extends StatefulWidget {
  final String tag;
  final Widget image;

  const _DetailScreen({Key? key, required this.tag, required this.image})
    : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

/// created using the Hero Widget
class _DetailScreenState extends State<_DetailScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Center(child: Hero(tag: widget.tag, child: widget.image)),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
