import 'dart:io';

import 'package:eraser/eraser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:unique_identifier/unique_identifier.dart';

import '../../di/service_locator.dart';
import '../constants/app/google_map_styles.dart';
import '../constants/enums/system_type.dart';
import '../localization/flutter_localization.dart';
import '../navigation/navigation_service.dart';
import '../theme/themes_data.dart';
import 'local_storage.dart';

/// This class it contain multiple core functions
/// for get device info
/// for get and set language
/// for current app theme
/// for options in application
class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();

  final String apiKey = "";
  SystemType? _os;
  String? _currentVersion;
  late String _buildNumber;
  String? _appName;
  String? _appVersion;
  ThemeMode _themeMode = ThemeMode.system;

  BuildContext? get appContext => getIt<NavigationService>().appContext;

  Locale get appLanguage => LocalizationProvider().appLocal;

  SystemType? get os => _os;

  String? get currentVersion => _currentVersion;

  String get buildNumber => _buildNumber;

  String? get appVersion => _appVersion;

  String? get appName => _appName;

  /// Resolves [ThemeData] for an explicit [mode] (e.g. theme-picker preview).
  ThemeData resolveThemeDataForMode(ThemeMode mode, [BuildContext? context]) {
    switch (mode) {
      case ThemeMode.dark:
        return ThemesData.darkTheme;
      case ThemeMode.light:
        return ThemesData.lightTheme;
      case ThemeMode.system:
        final brightness =
            context != null
                ? MediaQuery.platformBrightnessOf(context)
                : WidgetsBinding.instance.platformDispatcher.platformBrightness;
        return brightness == Brightness.dark
            ? ThemesData.darkTheme
            : ThemesData.lightTheme;
    }
  }

  /// Resolves the active [ThemeData] for the current [themeMode].
  ThemeData resolveThemeData([Brightness? platformBrightness]) {
    switch (_themeMode) {
      case ThemeMode.dark:
        return ThemesData.darkTheme;
      case ThemeMode.light:
        return ThemesData.lightTheme;
      case ThemeMode.system:
        final brightness =
            platformBrightness ??
            WidgetsBinding.instance.platformDispatcher.platformBrightness;
        return brightness == Brightness.dark
            ? ThemesData.darkTheme
            : ThemesData.lightTheme;
    }
  }

  ThemeData get themeData => resolveThemeData();

  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode v) {
    _themeMode = v;
  }

  String? deviceId;

  Future<String?> _getDeviceId() async {
    return await UniqueIdentifier.serial;
  }

  initApp() async {
    /// get OS
    if (Platform.isIOS) {
      _os = SystemType.IOS;
    }
    if (Platform.isAndroid) {
      _os = SystemType.Android;
    }

    /// get version
    final packageInfo = await PackageInfo.fromPlatform();
    _currentVersion = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
    _appName = packageInfo.appName;

    /// Get Initital Theme Mode
    _themeMode = LocalStorage.getThemeMode;

    deviceId = await _getDeviceId();
  }

  /// Logical design canvas for [ScreenUtilInit].
  ///
  /// Use a phone logical size (not 1080×1920 export pixels) so `.sp`, `.w`,
  /// `.h`, and `.r` render at readable sizes on real devices.
  static Size screenUtilDesignSize() {
    // if (Device.get().isTablet) return const Size(768, 1024);

    return const Size(390, 844);
  }

  Future<String?> resolveGoogleMapStyle(Brightness brightness) async {
    if (brightness != Brightness.dark) return null;

    return rootBundle.loadString(GoogleMapStyles.darkAssetPath);
  }

  static void clearNotificationSystemCount() {
    if (Platform.isAndroid) Eraser.clearAllAppNotifications();
    if (Platform.isIOS)
      Eraser.resetBadgeCountAndRemoveNotificationsFromCenter();
  }
}
