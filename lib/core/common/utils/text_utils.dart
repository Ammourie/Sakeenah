import 'package:flutter/material.dart';

import '../../theme/text_theme_styles.dart';
import '../app_config.dart';
import '../utils/language_utils.dart';

class TextUtils {
  TextUtils._();

  /// util function to get the size of a text
  static Size getTextSize(
    String text,
    TextStyle style, {
    double minWidth = 0,
    double maxWidth = double.infinity,
    int? maxLines = null,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style.copyWith(
          fontFamily: style.fontFamily ?? TextThemeStyles.fontFamily(),
        ),
      ),
      maxLines: maxLines,
      textDirection:
          LanguageUtils.isLTR()
              ? TextDirection.ltr
              : TextDirection.rtl,
      textScaler: MediaQuery.of(AppConfig().appContext!).textScaler,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.size;
  }
}
