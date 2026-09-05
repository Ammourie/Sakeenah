import 'package:flutter/services.dart';

import '../../common/text_formatters/iq_number_formatter.dart';
import '../enums/app_options_enum.dart';

class AppSettings {
  // Api Url
  static const BASE_URL = "https://nest-starter.osousdev.com/api/";

  /// AlAdhan Prayer Times API — https://aladhan.com/prayer-times-api
  static const ALADHAN_BASE_URL = 'https://api.aladhan.com/v1/';

  /// Constants
  static const orientation = OrientationOptions.PORTRAIT;
  static const errorViewOption = ErrorWidgetOptions.IMAGE;
  static const changeLangRestart = true;
  static const enableDioPrinting = true;
  static const enableErrorCatcher = true;
  static const forceLocationPermission = false;
  static const enableNotification = false;
  static const enableBranchIO = false;

  // Sakeenah brand colors (see docs/prayer_quran_app_requirements.md)
  static const Color PRIMARY_COLOR_LIGHT = Color(0xFF0F4C3A);
  static const Color ACCENT_COLOR_LIGHT = Color(0xFFC9A24B);

  static const Color PRIMARY_COLOR_DARK = Color(0xFF0F4C3A);
  static const Color ACCENT_COLOR_DARK = Color(0xFFC9A24B);

  static final List<TextInputFormatter> PHONE_FIELD_FORMATTERS = [
    FilteringTextInputFormatter.allow(RegExp(r'^[0-9-]{1,12}')),
    IqNumberInputFormatter(),
  ];
}
