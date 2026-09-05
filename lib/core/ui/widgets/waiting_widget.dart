import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


enum ProgressIndicatorOption {
  Circular,
  AdaptiveCircular,
  Linear,
  SpinningLines,
}

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({
    super.key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
    this.option = ProgressIndicatorOption.SpinningLines,
  });

  final double? value;
  final Color? backgroundColor;
  final Animation<Color?>? valueColor;
  final String? semanticsLabel;
  final String? semanticsValue;
  final ProgressIndicatorOption? option;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final progressColor =
        valueColor ?? AlwaysStoppedAnimation<Color?>(colorScheme.primary);
    final trackColor = backgroundColor ?? colorScheme.surfaceContainerHighest;

    switch (option) {
      case ProgressIndicatorOption.Circular:
        return Center(
          child: CircularProgressIndicator(
            value: value,
            backgroundColor: trackColor,
            valueColor: progressColor,
            semanticsLabel: semanticsLabel,
            semanticsValue: semanticsValue,
          ),
        );
      case ProgressIndicatorOption.AdaptiveCircular:
        return Center(
          child: CircularProgressIndicator.adaptive(
            value: value,
            backgroundColor: trackColor,
            valueColor: progressColor,
            semanticsLabel: semanticsLabel,
            semanticsValue: semanticsValue,
          ),
        );
      case ProgressIndicatorOption.Linear:
        return Center(
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: trackColor,
            valueColor: progressColor,
            semanticsLabel: semanticsLabel,
            semanticsValue: semanticsValue,
          ),
        );
      case ProgressIndicatorOption.SpinningLines:
      default:
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final spinningLinesColor =
            backgroundColor ?? (isDark ? Colors.white : colorScheme.primary);
        return Center(
          child: SpinKitSpinningLines(
            color: spinningLinesColor,
            size: 50.r,
          ),
        );
    }
  }

  static Widget wavyText(
    BuildContext context, {
    String? loadingMessage,
    TextStyle? textStyle,
    Duration pause = const Duration(milliseconds: 1000),
    Duration speed = const Duration(milliseconds: 300),
    TextAlign textAlign = TextAlign.start,
    bool repeat = true,
    void Function()? onTap,
    void Function(int, bool)? onNext,
    void Function(int, bool)? onNextBeforePause,
    void Function()? onFinished,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AnimatedTextKit(
      onTap: onTap,
      onNext: onNext,
      onNextBeforePause: onNextBeforePause,
      onFinished: onFinished,
      pause: pause,
      repeatForever: repeat,
      animatedTexts: [
        WavyAnimatedText(
          loadingMessage?.toUpperCase() ?? 'LOADING...',
          textStyle:
              textStyle ??
              textTheme.headlineSmall?.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 4,
              ),
          speed: speed,
          textAlign: textAlign,
        ),
      ],
    );
  }

  
}
