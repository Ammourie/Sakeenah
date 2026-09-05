import 'package:flutter/material.dart';

import 'app_color_schemes.dart';

/// Semantic color aliases mapped from [ColorScheme] for Sakeenah UI.
@immutable
class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  const CustomThemeColors({
    required this.gold,
    required this.ink,
    required this.muted,
    required this.card,
    required this.testButtonColor,
  });

  /// Warm gold accent — countdown, play controls, highlights.
  final Color gold;

  /// Primary text.
  final Color ink;

  /// Secondary/supporting text.
  final Color muted;

  /// Card and grouped surface fill.
  final Color card;

  /// Legacy demo alias; maps to [gold].
  final Color testButtonColor;

  static CustomThemeColors fromScheme(ColorScheme scheme) {
    return CustomThemeColors(
      gold: scheme.secondary,
      ink: scheme.onSurface,
      muted: scheme.onSurfaceVariant,
      card: scheme.surfaceContainer,
      testButtonColor: scheme.secondary,
    );
  }

  static final light = fromScheme(AppColorSchemes.light());
  static final dark = fromScheme(AppColorSchemes.dark());

  @override
  CustomThemeColors copyWith({
    Color? gold,
    Color? ink,
    Color? muted,
    Color? card,
    Color? testButtonColor,
  }) {
    return CustomThemeColors(
      gold: gold ?? this.gold,
      ink: ink ?? this.ink,
      muted: muted ?? this.muted,
      card: card ?? this.card,
      testButtonColor: testButtonColor ?? this.testButtonColor,
    );
  }

  @override
  CustomThemeColors lerp(ThemeExtension<CustomThemeColors>? other, double t) {
    if (other is! CustomThemeColors) {
      return this;
    }
    return CustomThemeColors(
      gold: Color.lerp(gold, other.gold, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      card: Color.lerp(card, other.card, t)!,
      testButtonColor: Color.lerp(testButtonColor, other.testButtonColor, t)!,
    );
  }
}
