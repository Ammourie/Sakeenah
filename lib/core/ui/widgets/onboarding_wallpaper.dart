import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Minimal grid + blob wallpaper for onboarding screens (language, theme).
class OnboardingWallpaper extends StatelessWidget {
  const OnboardingWallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CustomPaint(
      painter: _OnboardingWallpaperPainter(
        surface: colorScheme.surface,
        primary: colorScheme.primary,
        secondary: colorScheme.secondary,
        outlineVariant: colorScheme.outlineVariant,
        gridStep: 48.w,
      ),
    );
  }
}

class _OnboardingWallpaperPainter extends CustomPainter {
  _OnboardingWallpaperPainter({
    required this.surface,
    required this.primary,
    required this.secondary,
    required this.outlineVariant,
    required this.gridStep,
  });

  final Color surface;
  final Color primary;
  final Color secondary;
  final Color outlineVariant;
  final double gridStep;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = surface);

    _drawBlob(
      canvas,
      center: Offset(size.width * 0.85, size.height * 0.12),
      radius: size.width * 0.42,
      color: primary.withValues(alpha: 0.1),
    );
    _drawBlob(
      canvas,
      center: Offset(size.width * 0.1, size.height * 0.78),
      radius: size.width * 0.38,
      color: secondary.withValues(alpha: 0.08),
    );
    _drawBlob(
      canvas,
      center: Offset(size.width * 0.55, size.height * 0.55),
      radius: size.width * 0.55,
      color: primary.withValues(alpha: 0.05),
    );

    final gridPaint = Paint()
      ..color = outlineVariant.withValues(alpha: 0.22)
      ..strokeWidth = 0.5;

    for (var x = 0.0; x < size.width; x += gridStep) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (var y = 0.0; y < size.height; y += gridStep) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  void _drawBlob(
    Canvas canvas, {
    required Offset center,
    required double radius,
    required Color color,
  }) {
    canvas.drawCircle(center, radius, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _OnboardingWallpaperPainter oldDelegate) {
    return surface != oldDelegate.surface ||
        primary != oldDelegate.primary ||
        secondary != oldDelegate.secondary ||
        outlineVariant != oldDelegate.outlineVariant ||
        gridStep != oldDelegate.gridStep;
  }
}
