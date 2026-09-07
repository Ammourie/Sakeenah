import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/audio/quran_radio_audio_service.dart';
import 'core/common/app_config.dart';
import 'core/common/hive_helper.dart';
import 'core/common/local_storage.dart';
import 'core/constants/app/app_settings.dart';
import 'core/constants/enums/app_options_enum.dart';
import 'core/localization/localization_provider.dart';
import 'core/net/http_overrides.dart';
import 'di/service_locator.dart';

void main() async {
  await _initAppConfigs();

  runApp(const App());
}

Future<void> _initAppConfigs() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await HiveHelper.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
    if (!systemOverlaysAreVisible)
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  });

  /// Injectable initialization
  await configureInjection();

  /// Init Language.
  await LocalizationProvider().fetchLocale();

  /// Background Quran Radio (notification + lock-screen controls).
  await initQuranRadioAudioService();

  /// Init app config
  await AppConfig().initApp();

  /// Init rotation of app (Should be called after [AppConfig.initApp()])
  await _initAppRotation();

  /// In case of network handshake error
  HttpOverrides.global = new BadCertHttpOverrides();

  // await DeepLinkService().init();
}

Future<void> _initAppRotation() async {
  switch (AppSettings.orientation) {
    case OrientationOptions.PORTRAIT:
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      break;
    case OrientationOptions.LANDSCAPE:
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      break;
    case OrientationOptions.BOTH:
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      break;
  }
}
