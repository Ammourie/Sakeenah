import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/app/app_constants.dart';

/// Resolves cached on-disk artwork for media notifications / lock screen.
class QuranRadioNotificationArt {
  QuranRadioNotificationArt._();

  static Uri? _cachedArtUri;

  /// Always uses [AppConstants.QURAN_RADIO_NOTIFICATION_ART_ASSET] (logo light).
  static Future<Uri?> resolveArtUri() async {
    if (_cachedArtUri != null) return _cachedArtUri;

    try {
      final bytes =
          await rootBundle.load(AppConstants.QURAN_RADIO_NOTIFICATION_ART_ASSET);
      final dir = await getApplicationSupportDirectory();
      final file = File('${dir.path}/quran_radio_notification_art.png');
      await file.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
        flush: true,
      );

      _cachedArtUri = Uri.file(file.path);
      return _cachedArtUri;
    } catch (_) {
      return null;
    }
  }

  /// Clears cache so the next publish re-copies the asset if needed.
  static void invalidateCache() {
    _cachedArtUri = null;
  }
}
