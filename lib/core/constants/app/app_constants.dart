import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Centralizing application constants
class AppConstants {
  AppConstants._();

  static const TITLE_APP_NAME = 'Sakeenah';
  static final screenPadding = 20.w;
  static final COUNTRY_CODE = "+964";

  /// Pagination constants
  static const paginationLimit = 10;
  static const paginationFirstPage = 0;

  /// Bubble chat constants
  static const BUBBLE_RADIUS = 16.0;

  /// Headers
  static const HEADER_AUTH = 'Authorization';
  static const HEADER_APP_VERSION = 'appversion';
  static const HEADER_OS = 'os';
  static const HEADER_SESSION = 'session';
  static const HEADER_LANGUAGE = 'Accept-Language';
  static const HEADER_DEVICE_ID = 'deviceId';

  /// Animations

  /// ERROR ANIMATIONS
  static const ANIM_LOTTIE_ERROR =
      "assets/anim/lottie/error/general_error_placeholder.json";
  static const ANIM_LOTTIE_ERROR_403_401 =
      "assets/images/png/error/403-error.png";
  static const ANIM_LOTTIE_ERROR_EMPTY =
      "assets/images/png/error/empty_placeholder.png";
  static const ANIM_LOTTIE_ERROR_INVALID =
      "assets/images/png/error/invalid_error.png";
  static const ANIM_LOTTIE_ERROR_SERVER =
      "assets/images/png/error/500-error.png";
  static const ANIM_LOTTIE_ERROR_TIMEOUT =
      "assets/images/png/error/timout_error.png";
  static const ANIM_LOTTIE_ERROR_UNKNOWING =
      "assets/images/png/error/unknown_error.png";
  // connection, not found

  /// Image
  /// Asset path for app logo PNG (light / dark).
  static String appLogoForTheme(Brightness brightness) {
    return brightness == Brightness.light
        ? "assets/images/png/logo_light.png"
        : "assets/images/png/logo_dark.png";
  }

  /// Large notification / lock-screen artwork (always the light logo).
  static final QURAN_RADIO_NOTIFICATION_ART_ASSET = mainImageForTheme(
    Brightness.light,
  );

  /// Android status-bar notification icon (Asset Studio white silhouette).
  static const QURAN_RADIO_NOTIFICATION_ICON = 'drawable/ic_stat_name';

  /// Android media-notification action icons (Lucide, matches home radio bar).
  static const QURAN_RADIO_NOTIF_ICON_PLAY = 'drawable/ic_radio_play';
  static const QURAN_RADIO_NOTIF_ICON_PAUSE = 'drawable/ic_radio_pause';
  static const QURAN_RADIO_NOTIF_ICON_SKIP_BACK = 'drawable/ic_radio_skip_back';
  static const QURAN_RADIO_NOTIF_ICON_SKIP_FORWARD =
      'drawable/ic_radio_skip_forward';
  static const QURAN_RADIO_NOTIF_ICON_STOP = 'drawable/ic_radio_stop';
  static String mainImageForTheme(Brightness brightness) {
    return brightness == Brightness.light
        ? "assets/images/png/main_image_light.png"
        : "assets/images/png/main_image_dark.png";
  }

  /// Svg Icons
  static const SVG_IMAGE_PLACEHOLDER =
      'assets/images/svg/image_placeholder.svg';
  static const SVG_ICON_LANGUAGES = 'assets/images/svg/icons/languages.svg';
  static const SVG_ICON_CHECK = 'assets/images/svg/icons/check.svg';
  static const SVG_ICON_WIFI_OFF = 'assets/images/svg/icons/wifi-off.svg';
  static const SVG_ICON_SUN = 'assets/images/svg/icons/sun.svg';
  static const SVG_ICON_MOON = 'assets/images/svg/icons/moon.svg';
  static const SVG_ICON_SUN_MOON = 'assets/images/svg/icons/sun-moon.svg';
  static const SVG_ICON_SMARTPHONE = 'assets/images/svg/icons/smartphone.svg';
  static const SVG_ICON_GLOBE_2 = 'assets/images/svg/icons/globe-2.svg';
  static const SVG_ICON_MAP_PIN = 'assets/images/svg/icons/map-pin.svg';
  static const SVG_ICON_BOOK_OPEN_TEXT =
      'assets/images/svg/icons/book-open-text.svg';
  static const SVG_ICON_PLAY = 'assets/images/svg/icons/play.svg';
  static const SVG_ICON_PAUSE = 'assets/images/svg/icons/pause.svg';
  static const SVG_ICON_VOLUME_2 = 'assets/images/svg/icons/volume-2.svg';
  static const SVG_ICON_VOLUME_X = 'assets/images/svg/icons/volume-x.svg';
  static const SVG_ICON_SKIP_BACK = 'assets/images/svg/icons/skip-back.svg';
  static const SVG_ICON_SKIP_FORWARD =
      'assets/images/svg/icons/skip-forward.svg';
  static const SVG_ICON_SQUARE = 'assets/images/svg/icons/square.svg';

  /// Quran radio live stream
  static const QURAN_RADIO_STREAM_URL =
      'https://stream.radiojar.com/8s5u5tpdtwzuv';
  static const QURAN_RADIO_SEEK_STEP_SECONDS = 10;
  static const QURAN_RADIO_MAX_BUFFER_DURATION_SECONDS =
      24 * 60 * 60; // 1 day of seconds
  static const QURAN_RADIO_MEDIA_ID = 'quran_radio';
  static const QURAN_RADIO_NOTIFICATION_CHANNEL_ID =
      'com.ammourie.sakeenah.quran_radio';

  /// ERROR IMAGES
  static const ERROR_403_401 = "assets/images/png/error/403.png";
  static const ERROR_EMPTY = "assets/images/png/error/empty.png";
  static const ERROR_INVALID = "assets/images/png/error/invalid.png";
  static const ERROR_SERVER = "assets/images/png/error/server_error.png";
  static const ERROR_TIMEOUT = "assets/images/png/error/time_out.png";
  static const ERROR_UNKNOWING = "assets/images/png/error/unknowing_error.png";

  /// Languages
  static const LANG_AR = 'ar';
  static const LANG_EN = 'en';

  /// Languages code & output
  static const LANG_AR_CODE = 'AR';
  static const LANG_EN_CODE = 'EN';

  static const LANG_AR_OUTPUT = 'العربية';
  static const LANG_EN_OUTPUT = 'English';

  /// APP constants
  static const MENU_CHANGE_LANG = "assets/png/menu/change_lang.png";

  /// Mock Json API Token

  ///Map Constants
  static const API_KEY_GOOGLE_MAPS = 'AIzaSyAT9wA45sR_sIsLAdWUhw-wLGH_othLH7M';
  static const API_MAP_DISTANCE =
      "https://maps.googleapis.com/maps/api/distancematrix/json";
  static const API_INITIAL_MAP_LOCATION = LatLng(33.510414, 36.278336);
  static const DEFAULT_MAP_ZOOM = 14.0;

  // Verification Code Length.
  static const OTP_LENGTH = 4;
}
