part of '../themes_data.dart';

ThemeData _getDarkTheme() {
  final colorScheme = AppColorSchemes.dark();

  return ThemesData._baseTheme(
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    customColors: CustomThemeColors.fromScheme(colorScheme),
  );
}
