import 'package:flutter/material.dart';

import '../common/app_colors.dart';

/// Material 3 color schemes for Sakeenah (prayer & Quran radio app).
class AppColorSchemes {
  AppColorSchemes._();

  static ColorScheme light() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.cream,
      primaryContainer: Color(0xFFDCE8E2),
      onPrimaryContainer: Color(0xFF0A3A2C),
      secondary: AppColors.accent,
      onSecondary: AppColors.charcoal,
      secondaryContainer: Color(0xFFF3E6C8),
      onSecondaryContainer: Color(0xFF3D3010),
      tertiary: Color(0xFF5A7A6E),
      onTertiary: AppColors.cream,
      tertiaryContainer: Color(0xFFDCE8E2),
      onTertiaryContainer: Color(0xFF1F3A30),
      error: AppColors.terracotta,
      onError: AppColors.cream,
      errorContainer: Color(0xFFF5DDD6),
      onErrorContainer: Color(0xFF5C2418),
      surface: AppColors.cream,
      onSurface: AppColors.charcoal,
      onSurfaceVariant: Color(0xFF5A6560),
      outline: Color(0xFFBBC5BF),
      outlineVariant: Color(0xFFDDE5E0),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: AppColors.charcoal,
      onInverseSurface: AppColors.cream,
      inversePrimary: Color(0xFF8BC4AD),
      surfaceTint: AppColors.primary,
      surfaceContainerHighest: Color(0xFFE8E2D6),
      surfaceContainerHigh: Color(0xFFF0EBE1),
      surfaceContainer: Color(0xFFFFFCF7),
      surfaceContainerLow: Color(0xFFF5F0E6),
      surfaceContainerLowest: AppColors.cream,
      surfaceBright: AppColors.cream,
      surfaceDim: Color(0xFFE8E2D6),
    );
  }

  static ColorScheme dark() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.cream,
      primaryContainer: Color(0xFF1A4D3C),
      onPrimaryContainer: Color(0xFFDCE8E2),
      secondary: AppColors.accent,
      onSecondary: AppColors.charcoal,
      secondaryContainer: Color(0xFF3D3010),
      onSecondaryContainer: Color(0xFFF3E6C8),
      tertiary: Color(0xFF8BC4AD),
      onTertiary: Color(0xFF0B1512),
      tertiaryContainer: Color(0xFF1F3A30),
      onTertiaryContainer: Color(0xFFDCE8E2),
      error: AppColors.terracotta,
      onError: AppColors.cream,
      errorContainer: Color(0xFF5C2418),
      onErrorContainer: Color(0xFFF5DDD6),
      surface: AppColors.darkBackground,
      onSurface: Color(0xFFE8EDE9),
      onSurfaceVariant: Color(0xFFA8B5AE),
      outline: Color(0xFF3D5248),
      outlineVariant: Color(0xFF2A3A33),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE8EDE9),
      onInverseSurface: AppColors.darkBackground,
      inversePrimary: AppColors.primary,
      surfaceTint: AppColors.primary,
      surfaceContainerHighest: Color(0xFF243830),
      surfaceContainerHigh: Color(0xFF1E3229),
      surfaceContainer: AppColors.darkSurface,
      surfaceContainerLow: Color(0xFF121F1A),
      surfaceContainerLowest: Color(0xFF080F0C),
      surfaceBright: Color(0xFF243830),
      surfaceDim: AppColors.darkBackground,
    );
  }
}
