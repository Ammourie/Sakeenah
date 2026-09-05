import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_config.dart';
import '../common/utils/language_utils.dart';
import '../constants/app/app_constants.dart';

/// Centralized, locale-aware typography for the app design canvas
/// ([AppConfig.screenUtilDesignSize] — 390×844 logical).
///
/// English: [GoogleFonts.plusJakartaSans] — clean geometric sans for UI.
/// Arabic: [GoogleFonts.tajawal] — modern Arabic sans with strong mobile readability.
class TextThemeStyles {
  TextThemeStyles._();

  /// English UI font.
  static TextStyle get _englishFont => GoogleFonts.plusJakartaSans();

  /// Arabic UI font (also used for other RTL locales).
  static TextStyle get _arabicFont => GoogleFonts.tajawal();

  /// Active [fontFamily] for the current or given locale.
  static String? fontFamily({String? languageCode}) {
    return _isEnglish(languageCode) ? _englishFont.fontFamily : _arabicFont.fontFamily;
  }

  /// Material 3 [TextTheme] with scaled sizes and locale-appropriate Google Font.
  static TextTheme textTheme({String? languageCode}) {
    final scaled = TextTheme(
      displayLarge: _size(
        fontSize: 57.sp,
        height: 1.12,
        letterSpacing: -0.25,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: _size(
        fontSize: 45.sp,
        height: 1.16,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: _size(
        fontSize: 36.sp,
        height: 1.22,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: _size(
        fontSize: 28.sp,
        height: 1.28,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: _size(
        fontSize: 24.sp,
        height: 1.33,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: _size(
        fontSize: 22.sp,
        height: 1.27,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: _size(
        fontSize: 18.sp,
        height: 1.33,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: _size(
        fontSize: 16.sp,
        height: 1.43,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: _size(
        fontSize: 16.sp,
        height: 1.5,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: _size(
        fontSize: 15.sp,
        height: 1.5,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: _size(
        fontSize: 13.sp,
        height: 1.43,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: _size(
        fontSize: 14.sp,
        height: 1.43,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: _size(
        fontSize: 12.sp,
        height: 1.33,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w500,
      ),
    );

    return _applyGoogleFont(scaled, languageCode: languageCode);
  }

  // Legacy static accessors — prefer [textTheme] or Theme.of(context).textTheme.
  static TextStyle get displayLarge => textTheme().displayLarge!;
  static TextStyle get displayMedium => textTheme().displayMedium!;
  static TextStyle get displaySmall => textTheme().displaySmall!;
  static TextStyle get headlineMedium => textTheme().headlineMedium!;
  static TextStyle get headlineSmall => textTheme().headlineSmall!;
  static TextStyle get titleLarge => textTheme().titleLarge!;
  static TextStyle get titleMedium => textTheme().titleMedium!;
  static TextStyle get titleSmall => textTheme().titleSmall!;
  static TextStyle get bodyLarge => textTheme().bodyLarge!;
  static TextStyle get bodyMedium => textTheme().bodyMedium!;
  static TextStyle get bodySmall => textTheme().bodySmall!;
  static TextStyle get labelLarge => textTheme().labelLarge!;
  static TextStyle get labelSmall => textTheme().labelSmall!;

  static bool _isEnglish(String? languageCode) {
    final code = languageCode ?? AppConfig().appLanguage.languageCode;
    return code.startsWith(AppConstants.LANG_EN) || LanguageUtils.isLTR(languageCode: code);
  }

  static TextStyle _size({
    required double fontSize,
    required double height,
    required double letterSpacing,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
    );
  }

  static TextTheme _applyGoogleFont(TextTheme base, {String? languageCode}) {
    if (_isEnglish(languageCode)) {
      return GoogleFonts.plusJakartaSansTextTheme(base);
    }
    return GoogleFonts.tajawalTextTheme(base);
  }
}
