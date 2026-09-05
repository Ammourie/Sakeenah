import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app/app_constants.dart';

class BubbleText extends StatelessWidget {
  final double bubbleRadius;
  final bool isSender;
  final Color color;
  final String text;
  final bool tail;
  final bool sent;
  final bool delivered;
  final bool seen;
  final TextStyle textStyle;
  final BoxConstraints? constraints;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final String? sendAt;
  final TextStyle? sendAtTextStyle;
  final VoidCallback? onTextTap;
  final Widget? messageLeading;

  BubbleText({
    Key? key,
    required this.text,
    this.constraints,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    this.bubbleRadius = AppConstants.BUBBLE_RADIUS,
    this.isSender = true,
    this.color = Colors.white70,
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.textStyle = const TextStyle(color: Colors.black87, fontSize: 16),
    this.sendAt,
    this.sendAtTextStyle,
    this.onTextTap,
    this.messageLeading,
  }) : super(key: key);

  ///chat bubble builder method
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
          color: Colors.transparent,
          constraints:
              constraints ??
              BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .8,
                minWidth: 90,
              ),
          margin: margin,
          padding: padding,
          child: GestureDetector(
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            onLongPress: onLongPress,
            child: Container(
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
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding:
                        stateTick
                            ? const EdgeInsets.fromLTRB(12, 6, 22, 14)
                            : const EdgeInsets.fromLTRB(12, 6, 10, 14),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (messageLeading != null) ...[
                          messageLeading!,
                          Expanded(
                            child: SelectableText(
                              onTap: onTextTap,
                              text,
                              style: textStyle,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ] else
                          SelectableText(
                            onTap: onTextTap,
                            text,
                            style: textStyle,
                            textAlign: TextAlign.left,
                          ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    right: 6,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (sendAt != null) ...[
                          Text(sendAt!, style: sendAtTextStyle),
                          5.horizontalSpace,
                        ],
                        stateIcon != null && stateTick
                            ? stateIcon
                            : 10.horizontalSpace,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isSender && trailing != null) const SizedBox.shrink(),
      ],
    );
  }
}
