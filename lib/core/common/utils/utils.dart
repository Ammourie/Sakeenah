import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/l10n.dart';
import '../../providers/theme_mode_provider.dart';
import '../../ui/show_toast.dart';
import '../app_config.dart';

class Utils {
  Utils._();

  /// Find if any widget has focus in the given [context] and unfocus it
  static void unFocus(BuildContext context) {
    if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
  }

  static Future<void> launchURL(Uri url, {LaunchMode? mode}) async {
    if (await canLaunchUrl(url)) {
      try {
        final platformLaunchMode =
            Platform.isIOS
                ? LaunchMode.externalApplication
                : LaunchMode.externalNonBrowserApplication;

        await launchUrl(url, mode: mode ?? platformLaunchMode);
      } catch (e) {
        showToast(S.current.errorOccurred);
      }
    } else {
      showToast(S.current.errorOccurred);
    }
  }

  static Brightness effectiveBrightness(BuildContext context) {
    switch (AppConfig().themeMode) {
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.system:
        return MediaQuery.platformBrightnessOf(context);
    }
  }

  static void changeTheme(BuildContext context) async {
    final isDark = effectiveBrightness(context) == Brightness.dark;
    final nextMode = isDark ? ThemeMode.light : ThemeMode.dark;

    await context.read<ThemeModeProvider>().setThemeMode(
      nextMode,
      context: context,
    );
  }

  static void share({required BuildContext context, required Uri link}) {
    try {
      final box = context.findRenderObject() as RenderBox?;

      SharePlus.instance.share(
        ShareParams(
          text: link.toString(),
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
        ),
      );
    } catch (e) {
      showToast(S.current.errorOccurred);
    }
  }
}
