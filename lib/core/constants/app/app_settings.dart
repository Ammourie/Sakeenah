import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/text_formatters/iq_number_formatter.dart';
import '../enums/app_options_enum.dart';

class AppSettings {
  // Api Url
  static const BASE_URL = "https://nest-starter.osousdev.com/api/";
  static const SOCKET_URL = "https://nest-starter.osousdev.com";

  /// Constants
  static const orientation = OrientationOptions.PORTRAIT;
  static const errorViewOption = ErrorWidgetOptions.IMAGE;
  static const changeLangRestart = true;
  static const enableDioPrinting = true;
  static const enableErrorCatcher = true;
  static const forceLocationPermission = false;
  static const enableNotification = false;
  static const enableBranchIO = false;

  // App Colors
  static const Color PRIMARY_COLOR_LIGHT = Colors.blue;
  static const Color ACCENT_COLOR_LIGHT = Colors.black;

  static const Color PRIMARY_COLOR_DARK = Colors.blue;
  static const Color ACCENT_COLOR_DARK = Colors.black;

  static final List<TextInputFormatter> PHONE_FIELD_FORMATTERS = [
    FilteringTextInputFormatter.allow(RegExp(r'^[0-9-]{1,12}')),
    IqNumberInputFormatter(),
  ];
}
