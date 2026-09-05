import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Applies status-bar and navigation-bar overlay styles from the current
/// [Theme] brightness. Use on full-screen scaffolds that have no [AppBar].
class ThemedSystemOverlay extends StatelessWidget {
  const ThemedSystemOverlay({super.key, required this.child});

  final Widget child;

  static SystemUiOverlayStyle overlayStyleFor(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = theme.brightness;
    final colorScheme = theme.colorScheme;
    final isDark = brightness == Brightness.dark;

    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: colorScheme.surface,
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyleFor(context),
      child: child,
    );
  }
}
