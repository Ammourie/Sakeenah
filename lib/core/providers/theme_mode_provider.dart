import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import '../common/app_config.dart';
import '../common/local_storage.dart';

/// Notifies [MaterialApp] when [ThemeMode] changes so theme updates without restart.
class ThemeModeProvider extends ChangeNotifier with WidgetsBindingObserver {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void load() {
    _themeMode = LocalStorage.getThemeMode;
    AppConfig().themeMode = _themeMode;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    if (_themeMode != ThemeMode.system) return;
    notifyListeners();
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

    if (!animate || context == null) return;

    try {
      final theme = AppConfig().resolveThemeDataForMode(mode, context);
      ThemeSwitcher.of(context).changeTheme(
        theme: theme,
        isReversed: theme.brightness == Brightness.dark,
      );
    } catch (_) {
      // ThemeSwitcher not available in this subtree.
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
