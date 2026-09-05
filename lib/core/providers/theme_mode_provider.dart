import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import '../common/app_config.dart';
import '../common/local_storage.dart';
import '../theme/themes_data.dart';

/// Notifies [MaterialApp] when [ThemeMode] changes so theme updates without restart.
class ThemeModeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void load() {
    _themeMode = LocalStorage.getThemeMode;
    AppConfig().themeMode = _themeMode;
  }

  Future<void> setThemeMode(
    ThemeMode mode, {
    BuildContext? context,
    bool animate = true,
  }) async {
    if (_themeMode == mode) return;

    await LocalStorage.persistThemeMode(mode);
    AppConfig().themeMode = mode;
    _themeMode = mode;
    notifyListeners();

    if (!animate || context == null || mode == ThemeMode.system) return;

    try {
      final isDark = mode == ThemeMode.dark;
      ThemeSwitcher.of(context).changeTheme(
        theme: isDark ? ThemesData.darkTheme : ThemesData.lightTheme,
        isReversed: isDark,
      );
    } catch (_) {
      // ThemeSwitcher not available in this subtree.
    }
  }
}
