import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadioWaveVisualizer extends StatefulWidget {
  const RadioWaveVisualizer({
    super.key,
    required this.isPlaying,
    required this.isLoading,
    this.inactiveColor,
  });

  final bool isPlaying;
  final bool isLoading;
  final Color? inactiveColor;

  bool get isAnimating => isPlaying || isLoading;

  @override
  State<RadioWaveVisualizer> createState() => _RadioWaveVisualizerState();
}

class _RadioWaveVisualizerState extends State<RadioWaveVisualizer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _syncAnimation();
  }

  @override
  void didUpdateWidget(RadioWaveVisualizer oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncAnimation();
  }

  void _syncAnimation() {
    if (widget.isAnimating) {
      _controller.duration = Duration(
        milliseconds: widget.isLoading ? 1400 : 900,
      );
      if (!_controller.isAnimating) {
        _controller.repeat();
      }
    } else {
      _controller.stop();
      _controller.value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          painter: _RadioWavePainter(
            progress: _controller.value,
            isPlaying: widget.isPlaying,
            isLoading: widget.isLoading,
            activeColor: colorScheme.primary,
            inactiveColor: widget.inactiveColor ?? colorScheme.outlineVariant,
          ),
          size: Size(double.infinity, 44.h),
        );
      },
    );
  }
}

class _RadioWavePainter extends CustomPainter {
  _RadioWavePainter({
    required this.progress,
    required this.isPlaying,
    required this.isLoading,
    required this.activeColor,
    required this.inactiveColor,
  });

  static const _barCount = 9;

  final double progress;
  final bool isPlaying;
  final bool isLoading;
  final Color activeColor;
  final Color inactiveColor;

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = 4.w;
    final totalBarsWidth = _barCount * barWidth;
    final totalGap = size.width - totalBarsWidth;
    final gap = totalGap / (_barCount + 1);
    final maxHeight = size.height * 0.92;
    final minHeight = size.height * 0.16;

    for (var i = 0; i < _barCount; i++) {
      final phase = (progress * math.pi * 2) + (i * 0.62);
      final normalized = (math.sin(phase) + 1) / 2;

      late final double scale;
      if (isPlaying) {
        scale = 0.28 + (0.72 * normalized);
      } else if (isLoading) {
        scale = 0.22 + (0.38 * normalized);
      } else {
        scale = 0.2;
      }

      final barHeight = minHeight + ((maxHeight - minHeight) * scale);
      final x = gap + (i * (barWidth + gap));
      final y = (size.height - barHeight) / 2;

      final paint = Paint()
        ..color = isPlaying || isLoading ? activeColor : inactiveColor
        ..style = PaintingStyle.fill;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, barWidth, barHeight),
          Radius.circular(barWidth / 2),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RadioWavePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.isPlaying != isPlaying ||
        oldDelegate.isLoading != isLoading ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.inactiveColor != inactiveColor;
  }
}
