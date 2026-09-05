part of '../themes_data.dart';

ThemeData _getLightTheme() {
  final colorScheme = AppColorSchemes.light();

  return ThemesData._baseTheme(
    brightness: Brightness.light,
    colorScheme: colorScheme,
    customColors: CustomThemeColors.fromScheme(colorScheme),
  );
}
