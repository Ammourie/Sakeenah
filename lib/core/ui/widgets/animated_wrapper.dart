import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

enum AnimationPreset {
  /// Fade in + vertical slide up.
  fadeSlideUp,

  /// Fade in + vertical slide down.
  fadeSlideDown,

  /// Fade in + horizontal slide from the logical start side
  /// (left in LTR, right in RTL).
  fadeSlideStart,

  /// Fade in + horizontal slide from the logical end side
  /// (right in LTR, left in RTL).
  fadeSlideEnd,

  /// Fade in + scale in.
  fadeScale,

  /// Fade only, no transform.
  fadeOnly,

  /// Slide up only, no fade.
  slideUp,

  /// Scale in only.
  scaleIn,

  /// Horizontal flip entrance.
  flipX,

  /// Vertical flip entrance.
  flipY,

  /// Bounce-in scale.
  bounceIn,

  /// Shimmer highlight.
  shimmer,
}

class AnimatedWrapper extends StatelessWidget {
  const AnimatedWrapper({
    super.key,
    required this.children,
    this.preset = AnimationPreset.fadeSlideEnd,
    this.interval = const Duration(milliseconds: 50),
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeOutBack,
    this.fadeBegin = 0.0,
    this.slideBeginOffset,
    this.scaleBegin = 0.85,
    this.enabled = true,
    this.onPlay,
    this.onComplete,
    this.shimmerColor,
    this.shimmerAngle = 45.0,
    this.blurBegin = 0.0,
    this.blurEnd = 0.0,
    this.rotationBegin = 0.0,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding = EdgeInsets.zero,
  });

  /// Cross axis alignment.
  final CrossAxisAlignment crossAxisAlignment;

  /// The list of widgets to animate with stagger.
  final List<Widget> children;

  /// Preset animation type.
  final AnimationPreset preset;

  /// Stagger interval between each child.
  final Duration interval;

  /// Optional initial delay before animation starts.
  final Duration delay;

  /// Duration of each child's animation.
  final Duration duration;

  /// Animation curve.
  final Curve curve;

  /// Starting opacity for fade effects (0.0–1.0).
  final double fadeBegin;

  /// Custom slide offset. Overrides preset slide direction if provided.
  final Offset? slideBeginOffset;

  /// Starting scale for scale effects.
  final double scaleBegin;

  /// Whether the animation is active. Set false to skip animation.
  final bool enabled;

  /// Callback when animation begins.
  final VoidCallback? onPlay;

  /// Callback when animation completes.
  final VoidCallback? onComplete;

  /// Shimmer highlight color (only for [AnimationPreset.shimmer]).
  final Color? shimmerColor;

  /// Shimmer angle in degrees.
  final double shimmerAngle;

  /// Starting blur amount (0 = no blur).
  final double blurBegin;

  /// Ending blur amount (0 = no blur).
  final double blurEnd;

  /// Rotation begin value in turns (1.0 = 360°).
  final double rotationBegin;

  /// Padding for the wrapper.
  final EdgeInsets padding;

  /// Quick constructor for a simple fade + slide up, the most common use case.
  const AnimatedWrapper.fadeUp({
    super.key,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.children,
    this.interval = const Duration(milliseconds: 60),
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutCubic,
    this.enabled = true,
    this.onPlay,
    this.onComplete,
  }) : preset = AnimationPreset.fadeSlideUp,
       fadeBegin = 0.0,
       slideBeginOffset = null,
       scaleBegin = 1.0,
       shimmerColor = null,
       shimmerAngle = 45.0,
       blurBegin = 0.0,
       blurEnd = 0.0,
       rotationBegin = 0.0,
       padding = EdgeInsets.zero;

  /// Quick constructor for scale + fade in.
  const AnimatedWrapper.scaleIn({
    super.key,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.children,
    this.interval = const Duration(milliseconds: 70),
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 450),
    this.curve = Curves.elasticOut,
    this.scaleBegin = 0.7,
    this.enabled = true,
    this.onPlay,
    this.onComplete,
  }) : preset = AnimationPreset.fadeScale,
       fadeBegin = 0.0,
       slideBeginOffset = null,
       shimmerColor = null,
       shimmerAngle = 45.0,
       blurBegin = 0.0,
       blurEnd = 0.0,
       rotationBegin = 0.0,
       padding = EdgeInsets.zero;

  Offset _resolveSlideOffset(BuildContext context) {
    if (slideBeginOffset != null) return slideBeginOffset!;

    final isLtr = Directionality.of(context) == TextDirection.ltr;

    return switch (preset) {
      AnimationPreset.fadeSlideUp ||
      AnimationPreset.slideUp =>
          const Offset(0, 0.3),
      AnimationPreset.fadeSlideDown =>
          const Offset(0, -0.3),
      // For horizontal slide presets, respect the current text direction
      // so that entrance animations always come from the logical start/end.
      AnimationPreset.fadeSlideStart =>
          Offset(isLtr ? 0.3 : -0.3, 0),
      AnimationPreset.fadeSlideEnd =>
          Offset(isLtr ? -0.3 : 0.3, 0),
      _ => Offset.zero,
    };
  }

  List<Effect<dynamic>> _buildEffects(BuildContext context) {
    final offset = _resolveSlideOffset(context);

    return switch (preset) {
      AnimationPreset.fadeOnly => [
        FadeEffect(
          begin: fadeBegin,
          end: 1.0,
          curve: curve,
          duration: duration,
        ),
      ],
      AnimationPreset.fadeSlideUp ||
      AnimationPreset.fadeSlideDown ||
      AnimationPreset.fadeSlideStart ||
      AnimationPreset.fadeSlideEnd => [
        FadeEffect(
          begin: fadeBegin,
          end: 1.0,
          curve: curve,
          duration: duration,
        ),
        SlideEffect(
          begin: offset,
          end: Offset.zero,
          curve: curve,
          duration: duration,
        ),
        if (blurBegin > 0 || blurEnd > 0)
          BlurEffect(
            begin: Offset(blurBegin, blurBegin),
            end: Offset(blurEnd, blurEnd),
            duration: duration,
          ),
      ],
      AnimationPreset.fadeScale => [
        FadeEffect(
          begin: fadeBegin,
          end: 1.0,
          curve: curve,
          duration: duration,
        ),
        ScaleEffect(
          begin: Offset(scaleBegin, scaleBegin),
          end: const Offset(1, 1),
          curve: curve,
          duration: duration,
        ),
      ],
      AnimationPreset.slideUp => [
        SlideEffect(
          begin: offset,
          end: Offset.zero,
          curve: curve,
          duration: duration,
        ),
      ],
      AnimationPreset.scaleIn => [
        ScaleEffect(
          begin: Offset(scaleBegin, scaleBegin),
          end: const Offset(1, 1),
          curve: curve,
          duration: duration,
        ),
      ],
      AnimationPreset.bounceIn => [
        FadeEffect(begin: fadeBegin, end: 1.0, duration: duration * 0.5),
        ScaleEffect(
          begin: Offset(scaleBegin, scaleBegin),
          end: const Offset(1, 1),
          curve: Curves.bounceOut,
          duration: duration,
        ),
      ],
      AnimationPreset.flipX => [
        FadeEffect(begin: fadeBegin, end: 1.0, duration: duration),
        FlipEffect(
          begin: 0.5,
          end: 1.0,
          direction: Axis.horizontal,
          curve: curve,
          duration: duration,
        ),
      ],
      AnimationPreset.flipY => [
        FadeEffect(begin: fadeBegin, end: 1.0, duration: duration),
        FlipEffect(
          begin: 0.5,
          end: 1.0,
          direction: Axis.vertical,
          curve: curve,
          duration: duration,
        ),
      ],
      AnimationPreset.shimmer => [
        ShimmerEffect(
          color: shimmerColor ?? Colors.white54,
          angle: shimmerAngle * (3.14159 / 180),
          duration: duration,
        ),
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return Column(crossAxisAlignment: crossAxisAlignment, children: children);
    }

    final effects = _buildEffects(context);

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: children.asMap().entries.map((entry) {
          final index = entry.key;
          final child = entry.value;

          return child.animate(
            delay: delay + (interval * index),
            effects: effects,
            onPlay: index == 0 ? (_) => onPlay?.call() : null,
            onComplete: index == children.length - 1
                ? (_) => onComplete?.call()
                : null,
          );
        }).toList(),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Convenience extension — keeps call sites looking clean
// ---------------------------------------------------------------------------

extension AnimatedWrapperX on List<Widget> {
  /// Wraps a list in [AnimatedWrapper] with a given preset.
  Widget animatedWith({
    AnimationPreset preset = AnimationPreset.fadeSlideUp,
    Duration interval = const Duration(milliseconds: 50),
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.easeOutBack,
    double fadeBegin = 0.0,
    Offset? slideBeginOffset,
    double scaleBegin = 0.85,
    bool enabled = true,
    VoidCallback? onPlay,
    VoidCallback? onComplete,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return AnimatedWrapper(
      crossAxisAlignment: crossAxisAlignment,
      preset: preset,
      interval: interval,
      delay: delay,
      duration: duration,
      curve: curve,
      fadeBegin: fadeBegin,
      slideBeginOffset: slideBeginOffset,
      scaleBegin: scaleBegin,
      enabled: enabled,
      onPlay: onPlay,
      onComplete: onComplete,
      children: this,
    );
  }
}
