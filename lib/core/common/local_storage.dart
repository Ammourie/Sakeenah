import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/shared_preference/shared_preference_keys.dart';

class LocalStorage {
  static late SharedPreferences _sp;

  static Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  static SharedPreferences get sharedPreferences => _sp;

  /// Persist Theme Mode
  static Future<void> persistThemeMode(ThemeMode theme) async {
    await _sp.setInt(SharedPreferenceKeys.KEY_APP_THEME, theme.index);
  }

  /// Get APP Theme Mode
  static ThemeMode get getThemeMode {
    final themeIndex = _sp.getInt(SharedPreferenceKeys.KEY_APP_THEME);
    if (themeIndex == null) return ThemeMode.system;
    return ThemeMode.values[themeIndex];
  }

  /// Persist LanguageFirstStartSelected
  static Future<void> persistLanguageFirstStartSelected(bool value) async {
    await _sp.setBool(
      SharedPreferenceKeys.KEY_LANGUAGE_FIRST_START_SELECTED,
      value,
    );
  }

  /// check if the user already selected a language on first app start
  static bool get languageFirstStartSelected {
    return _sp.getBool(
          SharedPreferenceKeys.KEY_LANGUAGE_FIRST_START_SELECTED,
        ) ??
        false;
  }

  /// Persist ThemeFirstStartSelected
  static Future<void> persistThemeFirstStartSelected(bool value) async {
    await _sp.setBool(
      SharedPreferenceKeys.KEY_THEME_FIRST_START_SELECTED,
      value,
    );
  }

  /// Whether the user completed theme selection on first app start.
  static bool get themeFirstStartSelected {
    return _sp.getBool(
          SharedPreferenceKeys.KEY_THEME_FIRST_START_SELECTED,
        ) ??
        false;
  }

  /// Resets onboarding flags so language and theme first-start screens show again.
  static Future<void> clearFirstStartPreferences() async {
    await _sp.remove(SharedPreferenceKeys.KEY_LANGUAGE_FIRST_START_SELECTED);
    await _sp.remove(SharedPreferenceKeys.KEY_THEME_FIRST_START_SELECTED);
    await _sp.remove(SharedPreferenceKeys.KEY_FIRST_START);
  }
}
