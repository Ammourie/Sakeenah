import 'package:flutter/material.dart';

/// Sakeenah brand palette and theme-independent color constants.
class AppColors {
  AppColors._();

  /// Deep emerald green — app bar, primary buttons, highlighted prayer.
  static const primary = Color(0xFF0F4C3A);

  /// Warm gold — countdown, play button, icons, highlights (both themes).
  static const accent = Color(0xFFC9A24B);

  /// Warm cream — light-mode background.
  static const cream = Color(0xFFFAF6EE);

  /// Charcoal — light-mode primary text.
  static const charcoal = Color(0xFF1F2622);

  /// Deep charcoal green — dark-mode background.
  static const darkBackground = Color(0xFF0B1512);

  /// Muted green-gray — dark-mode cards/surfaces.
  static const darkSurface = Color(0xFF16241F);

  /// Muted terracotta — errors and alerts.
  static const terracotta = Color(0xFFB5533C);

  // Legacy aliases consumed by older theme wiring.
  static const Color primaryColorLight = primary;
  static const Color accentColorLight = accent;
  static const Color primaryColorDark = primary;
  static const Color accentColorDark = accent;
}
