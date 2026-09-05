import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/custom_modules/screen_notifier.dart';
import '../../common/local_storage.dart';
import '../../navigation/nav.dart';
import '../../providers/theme_mode_provider.dart';
import 'theme_screen.dart';

class ThemeScreenNotifier extends ScreenNotifier<ThemeScreenParam> {
  ThemeScreenNotifier(super.param)
    : _selectedTheme = LocalStorage.getThemeMode {
    _initialTheme = _selectedTheme;
  }

  /// fields
  late final ThemeMode _initialTheme;
  ThemeMode _selectedTheme;

  /// setters
  set selectedTheme(ThemeMode value) {
    _selectedTheme = value;
    notifyListeners();
  }

  /// getters
  ThemeMode get selectedTheme => _selectedTheme;

  bool get hasChanges => _selectedTheme != _initialTheme;

  void selectTheme(ThemeMode value) {
    if (_selectedTheme == value) return;
    _selectedTheme = value;
    notifyListeners();
  }

  /// Applies the selected theme. Returns `true` when first-start onboarding
  /// should navigate to [SplashScreen].
  Future<bool> confirm(BuildContext context) async {
    final themeProvider = context.read<ThemeModeProvider>();

    if (!LocalStorage.themeFirstStartSelected) {
      await LocalStorage.persistThemeFirstStartSelected(true);
      await themeProvider.setThemeMode(_selectedTheme, context: context);
      return true;
    }

    if (hasChanges) {
      await themeProvider.setThemeMode(_selectedTheme, context: context);
    }

    Nav.pop();
    return false;
  }

  void cancel(BuildContext context) {
    Nav.pop();
  }

  @override
  void closeNotifier() {
    dispose();
  }
}
