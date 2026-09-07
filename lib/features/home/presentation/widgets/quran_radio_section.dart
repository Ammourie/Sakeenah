import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/utils/language_utils.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/ui/widgets/custom_image.dart';
import '../../../../core/ui/widgets/waiting_widget.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entity/radio_player_entity.dart';
import '../utils/quran_radio_error_message.dart';
import 'radio_wave_visualizer.dart';

/// Theme-aware surface and accent tokens for the radio card (light + dark).
class _RadioSurfaceTokens {
  const _RadioSurfaceTokens(this.scheme);

  factory _RadioSurfaceTokens.of(ColorScheme scheme) =>
      _RadioSurfaceTokens(scheme);

  final ColorScheme scheme;

  bool get _isDark => scheme.brightness == Brightness.dark;

  List<Color> get heroGradient => [
    scheme.primaryContainer.withValues(alpha: _isDark ? 0.78 : 0.95),
    scheme.secondaryContainer.withValues(alpha: _isDark ? 0.42 : 0.72),
    scheme.surfaceContainer.withValues(alpha: _isDark ? 0.08 : 0.35),
  ];

  Color get heroOrbPrimary =>
      scheme.primary.withValues(alpha: _isDark ? 0.28 : 0.18);

  Color get heroOrbSecondary =>
      scheme.secondary.withValues(alpha: _isDark ? 0.18 : 0.14);

  Color get artworkFill =>
      _isDark ? scheme.surfaceContainerHigh : scheme.surface;

  Color get artworkBorder => scheme.outline;

  Color get pulseRingColor =>
      scheme.primary.withValues(alpha: _isDark ? 0.55 : 0.35);

  List<BoxShadow> get artworkShadow => _isDark
      ? []
      : [
          BoxShadow(
            color: scheme.shadow.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ];

  Color get controlsPanelFill =>
      _isDark ? scheme.surfaceContainerHigh : scheme.surface;

  Color get controlsPanelBorder => scheme.outline;

  Color get popupFill => scheme.surfaceContainerHighest;

  Color get popupBorder => scheme.outline;

  Color get activeSubtitle => scheme.onPrimaryContainer;

  Color get badgeShadow =>
      scheme.shadow.withValues(alpha: _isDark ? 0.35 : 0.12);

  Color get waveInactive => _isDark ? scheme.outline : scheme.outlineVariant;
}

class QuranRadioSection extends StatelessWidget {
  const QuranRadioSection({
    super.key,
    required this.radio,
    required this.hasInternet,
    required this.onPlay,
    required this.onPause,
    required this.onVolumeChanged,
    required this.onToggleMute,
    required this.onSeekBackward,
    required this.onSeekForward,
    required this.onSeekToProgress,
    required this.onStop,
    required this.onRetry,
    this.isBootstrapping = false,
    this.appError,
  });

  final RadioPlayerEntity radio;
  final bool hasInternet;
  final bool isBootstrapping;
  final AppErrors? appError;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final ValueChanged<double> onVolumeChanged;
  final VoidCallback onToggleMute;
  final VoidCallback onSeekBackward;
  final VoidCallback onSeekForward;
  final ValueChanged<double> onSeekToProgress;
  final VoidCallback onStop;
  final VoidCallback onRetry;

  bool get _isPlaying => radio.status == RadioPlayerStatus.playing;
  bool get _isLoading => radio.status == RadioPlayerStatus.loading;
  bool get _isError => radio.status == RadioPlayerStatus.error;
  bool get _isIdle => radio.status == RadioPlayerStatus.idle;
  bool get _canUseSeekControls => !_isLoading && !_isError && !_isIdle;
  bool get _canStop => !_isIdle && !_isError;
  bool get _shouldShowPlaybackProgress => !_isIdle && !_isError;
  bool get _showPlayerBar => !_isError;
  bool get _showPlayLoading => _isLoading || (isBootstrapping && _isIdle);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tokens = _RadioSurfaceTokens.of(colorScheme);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer,
          border: Border.all(
            color: tokens.controlsPanelBorder,
            width: colorScheme.brightness == Brightness.dark ? 1.25 : 1,
          ),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _RadioHeroStage(
              radio: radio,
              isPlaying: _isPlaying,
              isLoading: _isLoading,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.w, 16.h, 16.w, 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_isError) ...[
                    _RadioErrorPanel(
                      radio: radio,
                      hasInternet: hasInternet,
                      appError: appError,
                      onRetry: onRetry,
                      onStop: onStop,
                    ),
                    16.verticalSpace,
                  ],
                  _RadioMetadata(
                    radio: radio,
                    isIdle: _isIdle,
                    isError: _isError,
                  ),
                  if (_showPlayerBar) ...[
                    16.verticalSpace,
                    _RadioPlayerBar(
                      radio: radio,
                      isPlaying: _isPlaying,
                      isLoading: _showPlayLoading,
                      canUseSeekControls: _canUseSeekControls,
                      canStop: _canStop,
                      showPlaybackProgress: _shouldShowPlaybackProgress,
                      onPlay: onPlay,
                      onPause: onPause,
                      onSeekBackward: onSeekBackward,
                      onSeekForward: onSeekForward,
                      onSeekToProgress: onSeekToProgress,
                      onStop: onStop,
                      onToggleMute: onToggleMute,
                      onVolumeChanged: onVolumeChanged,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RadioHeroStage extends StatefulWidget {
  const _RadioHeroStage({
    required this.radio,
    required this.isPlaying,
    required this.isLoading,
  });

  final RadioPlayerEntity radio;
  final bool isPlaying;
  final bool isLoading;

  @override
  State<_RadioHeroStage> createState() => _RadioHeroStageState();
}

class _RadioHeroStageState extends State<_RadioHeroStage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _syncPulse();
  }

  @override
  void didUpdateWidget(covariant _RadioHeroStage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncPulse();
  }

  void _syncPulse() {
    if (widget.isPlaying) {
      _pulseController.repeat();
    } else {
      _pulseController
        ..stop()
        ..value = 0;
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tokens = _RadioSurfaceTokens.of(colorScheme);
    final showLiveBadge =
        widget.isPlaying ||
        widget.isLoading ||
        widget.radio.status == RadioPlayerStatus.paused;

    return SizedBox(
      height: 196.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: tokens.heroGradient,
              ),
            ),
          ),
          PositionedDirectional(
            top: -28.h,
            end: -18.w,
            child: _AmbientOrb(diameter: 120.w, color: tokens.heroOrbPrimary),
          ),
          PositionedDirectional(
            bottom: -36.h,
            start: -24.w,
            child: _AmbientOrb(diameter: 140.w, color: tokens.heroOrbSecondary),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.w, 20.h, 20.w, 12.h),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (widget.isPlaying)
                        AnimatedBuilder(
                          animation: _pulseController,
                          builder: (context, child) {
                            final scale =
                                1 +
                                (0.08 *
                                    math.sin(
                                      _pulseController.value * math.pi * 2,
                                    ));
                            return Transform.scale(
                              scale: scale,
                              child: Container(
                                width: 118.w,
                                height: 118.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: tokens.pulseRingColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      Container(
                        width: 96.w,
                        height: 96.w,
                        decoration: BoxDecoration(
                          color: tokens.artworkFill,
                          shape: BoxShape.circle,
                          border: Border.all(color: tokens.artworkBorder),
                          boxShadow: tokens.artworkShadow,
                        ),
                        alignment: Alignment.center,
                        child: CustomImage.asset(
                          AppConstants.SVG_ICON_BOOK_OPEN_TEXT,
                          width: 40.w,
                          height: 40.w,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      if (showLiveBadge)
                        PositionedDirectional(
                          top: 0,
                          end: 0,
                          child: _LiveBadge(status: widget.radio.status),
                        ),
                    ],
                  ),
                ),
                RadioWaveVisualizer(
                  isPlaying: widget.isPlaying,
                  isLoading: widget.isLoading,
                  inactiveColor: tokens.waveInactive,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioErrorPanel extends StatelessWidget {
  const _RadioErrorPanel({
    required this.radio,
    required this.hasInternet,
    required this.onRetry,
    required this.onStop,
    this.appError,
  });

  final RadioPlayerEntity radio;
  final bool hasInternet;
  final AppErrors? appError;
  final VoidCallback onRetry;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final useOfflineIcon = QuranRadioErrorMessage.useOfflineIcon(
      hasInternet: hasInternet,
    );

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage.asset(
                useOfflineIcon
                    ? AppConstants.SVG_ICON_WIFI_OFF
                    : AppConstants.SVG_ICON_CIRCLE_ALERT,
                width: 22.w,
                height: 22.w,
                color: colorScheme.onErrorContainer,
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      QuranRadioErrorMessage.title(
                        player: radio,
                        hasInternet: hasInternet,
                        appError: appError,
                      ),
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onErrorContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      QuranRadioErrorMessage.hint,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onErrorContainer.withValues(
                          alpha: 0.85,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          16.verticalSpace,
          FilledButton(
            onPressed: onRetry,
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.error,
              foregroundColor: colorScheme.onError,
            ),
            child: Text(S.current.quranRadioRetry),
          ),
          8.verticalSpace,
          OutlinedButton(
            onPressed: onStop,
            style: OutlinedButton.styleFrom(
              foregroundColor: colorScheme.onErrorContainer,
              side: BorderSide(color: colorScheme.outline),
            ),
            child: Text(S.current.quranRadioStop),
          ),
        ],
      ),
    );
  }
}

class _AmbientOrb extends StatelessWidget {
  const _AmbientOrb({required this.diameter, required this.color});

  final double diameter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
      ),
    );
  }
}

class _LiveBadge extends StatelessWidget {
  const _LiveBadge({required this.status});

  final RadioPlayerStatus status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final (label, background, foreground, pulse) = switch (status) {
      RadioPlayerStatus.loading => (
        S.current.quranRadioConnecting,
        colorScheme.secondaryContainer,
        colorScheme.onSecondaryContainer,
        true,
      ),
      RadioPlayerStatus.playing => (
        S.current.quranRadioLive,
        colorScheme.primaryContainer,
        colorScheme.onPrimaryContainer,
        true,
      ),
      RadioPlayerStatus.paused => (
        S.current.quranRadioPause,
        colorScheme.surfaceContainerHighest,
        colorScheme.onSurfaceVariant,
        false,
      ),
      _ => (
        S.current.quranRadioLive,
        colorScheme.primaryContainer,
        colorScheme.onPrimaryContainer,
        false,
      ),
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999.r),
        boxShadow: [
          BoxShadow(
            color: _RadioSurfaceTokens.of(colorScheme).badgeShadow,
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (pulse) ...[
            Container(
              width: 7.w,
              height: 7.w,
              decoration: BoxDecoration(
                color: foreground,
                shape: BoxShape.circle,
              ),
            ),
            6.horizontalSpace,
          ],
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: foreground,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioMetadata extends StatelessWidget {
  const _RadioMetadata({
    required this.radio,
    required this.isIdle,
    required this.isError,
  });

  final RadioPlayerEntity radio;
  final bool isIdle;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final tokens = _RadioSurfaceTokens.of(colorScheme);

    final subtitle = switch (radio.status) {
      RadioPlayerStatus.idle => S.current.quranRadioIdleHint,
      RadioPlayerStatus.loading => S.current.quranRadioConnecting,
      RadioPlayerStatus.playing => S.current.quranRadioLive,
      RadioPlayerStatus.paused => S.current.quranRadioPause,
      RadioPlayerStatus.error => S.current.quranRadioError,
    };

    return Column(
      children: [
        Text(
          S.current.quranRadioTitle,
          textAlign: TextAlign.center,
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.2,
          ),
        ),
        6.verticalSpace,
        Text(
          subtitle,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodyMedium?.copyWith(
            color: isError || isIdle
                ? colorScheme.onSurfaceVariant
                : tokens.activeSubtitle,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _RadioPlayerBar extends StatefulWidget {
  const _RadioPlayerBar({
    required this.radio,
    required this.isPlaying,
    required this.isLoading,
    required this.canUseSeekControls,
    required this.canStop,
    required this.showPlaybackProgress,
    required this.onPlay,
    required this.onPause,
    required this.onSeekBackward,
    required this.onSeekForward,
    required this.onSeekToProgress,
    required this.onStop,
    required this.onToggleMute,
    required this.onVolumeChanged,
  });

  final RadioPlayerEntity radio;
  final bool isPlaying;
  final bool isLoading;
  final bool canUseSeekControls;
  final bool canStop;
  final bool showPlaybackProgress;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onSeekBackward;
  final VoidCallback onSeekForward;
  final ValueChanged<double> onSeekToProgress;
  final VoidCallback onStop;
  final VoidCallback onToggleMute;
  final ValueChanged<double> onVolumeChanged;

  @override
  State<_RadioPlayerBar> createState() => _RadioPlayerBarState();
}

class _RadioPlayerBarState extends State<_RadioPlayerBar> {
  double? _dragProgress;
  final LayerLink _volumeLayerLink = LayerLink();
  OverlayEntry? _volumeOverlay;
  bool _volumePopupOpen = false;

  @override
  void didUpdateWidget(covariant _RadioPlayerBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.showPlaybackProgress) {
      _dragProgress = null;
    }
    if (_volumeOverlay != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _volumeOverlay?.markNeedsBuild();
        }
      });
    }
  }

  @override
  void dispose() {
    _volumeOverlay?.remove();
    _volumeOverlay = null;
    _volumePopupOpen = false;
    super.dispose();
  }

  void _toggleVolumePopup() {
    if (_volumeOverlay != null) {
      _removeVolumeOverlay();
    } else {
      _showVolumeOverlay();
    }
  }

  void _showVolumeOverlay() {
    final overlay = Overlay.of(context);
    final theme = Theme.of(context);
    _volumeOverlay = OverlayEntry(
      builder: (overlayContext) {
        return Theme(
          data: theme,
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: _removeVolumeOverlay,
                ),
              ),
              CompositedTransformFollower(
                link: _volumeLayerLink,
                targetAnchor: Alignment.topCenter,
                followerAnchor: Alignment.bottomCenter,
                offset: Offset(0, -8.h),
                showWhenUnlinked: false,
                child: _VolumeVerticalPopup(
                  volume: widget.radio.volume,
                  isMuted: widget.radio.volume == 0,
                  onVolumeChanged: widget.onVolumeChanged,
                  onToggleMute: widget.onToggleMute,
                ),
              ),
            ],
          ),
        );
      },
    );
    overlay.insert(_volumeOverlay!);
    _volumePopupOpen = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  void _removeVolumeOverlay() {
    if (_volumeOverlay == null) return;
    _volumeOverlay!.remove();
    _volumeOverlay = null;
    if (!mounted) return;
    if (!_volumePopupOpen) return;
    _volumePopupOpen = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final tokens = _RadioSurfaceTokens.of(colorScheme);
    final isMuted = widget.radio.volume == 0;
    final volumePopupOpen = _volumePopupOpen;
    final canSeek =
        widget.showPlaybackProgress &&
        !widget.isLoading &&
        widget.radio.bufferedSeconds > 0;
    final progress =
        _dragProgress ?? (canSeek ? widget.radio.playbackProgress : 0.0);
    final positionSeconds = canSeek
        ? (progress * widget.radio.bufferedSeconds).round()
        : widget.radio.positionSeconds;
    final progressLabel = widget.isLoading
        ? '--:-- / --:--'
        : widget.showPlaybackProgress
        ? '${_formatRadioSeconds(positionSeconds)} / ${_formatRadioSeconds(widget.radio.bufferedSeconds)}'
        : '--:-- / --:--';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsetsDirectional.fromSTEB(12.w, 10.h, 12.w, 12.h),
          decoration: BoxDecoration(
            color: tokens.controlsPanelFill,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: tokens.controlsPanelBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _SkipSeekButton(
                    tooltip: S.current.quranRadioSkipBackward,
                    iconPath: AppConstants.SVG_ICON_SKIP_BACK,
                    enabled:
                        widget.canUseSeekControls &&
                        widget.radio.canSeekBackward,
                    onPressed: widget.onSeekBackward,
                  ),
                  8.horizontalSpace,
                  _InlinePlayButton(
                    isPlaying: widget.isPlaying,
                    isLoading: widget.isLoading,
                    onPlay: widget.onPlay,
                    onPause: widget.onPause,
                  ),
                  8.horizontalSpace,
                  _SkipSeekButton(
                    tooltip: S.current.quranRadioSkipForward,
                    iconPath: AppConstants.SVG_ICON_SKIP_FORWARD,
                    enabled:
                        widget.canUseSeekControls &&
                        widget.radio.canSeekForward,
                    onPressed: widget.onSeekForward,
                  ),
                  const Spacer(),
                  CompositedTransformTarget(
                    link: _volumeLayerLink,
                    child: _BarIconButton(
                      tooltip: S.current.quranRadioVolume,
                      iconPath: isMuted
                          ? AppConstants.SVG_ICON_VOLUME_X
                          : AppConstants.SVG_ICON_VOLUME_2,
                      enabled: true,
                      onPressed: _toggleVolumePopup,
                      iconColor: volumePopupOpen ? colorScheme.primary : null,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 4.h,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.r),
                  overlayShape: SliderComponentShape.noOverlay,
                  inactiveTrackColor: tokens.waveInactive,
                  activeTrackColor: colorScheme.primary,
                  disabledInactiveTrackColor: tokens.waveInactive,
                  disabledActiveTrackColor: colorScheme.primary.withValues(
                    alpha: 0.45,
                  ),
                  thumbColor: colorScheme.primary,
                  disabledThumbColor: colorScheme.primary.withValues(
                    alpha: 0.45,
                  ),
                ),
                child: Slider(
                  value: progress.clamp(0.0, 1.0),
                  onChanged: canSeek
                      ? (value) => setState(() => _dragProgress = value)
                      : null,
                  onChangeEnd: canSeek
                      ? (value) {
                          widget.onSeekToProgress(value);
                          setState(() => _dragProgress = null);
                        }
                      : null,
                ),
              ),
              4.verticalSpace,
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  progressLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.canStop) ...[
          10.verticalSpace,
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: widget.onStop,
              icon: _RadioDirectionalIcon(
                iconPath: AppConstants.SVG_ICON_SQUARE,
                width: 18.w,
                height: 18.w,
                color: colorScheme.error,
              ),
              label: Text(S.current.quranRadioStop),
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.error,
                backgroundColor: colorScheme.errorContainer.withValues(
                  alpha: colorScheme.brightness == Brightness.dark ? 0.35 : 0,
                ),
                side: BorderSide(
                  color: colorScheme.error.withValues(
                    alpha: colorScheme.brightness == Brightness.dark
                        ? 0.65
                        : 0.5,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              ),
            ),
          ),
        ],
        if (widget.isLoading) ...[
          8.verticalSpace,
          Text(
            S.current.quranRadioBufferLoading,
            textAlign: TextAlign.center,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  String _formatRadioSeconds(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '${hours}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes}:${seconds.toString().padLeft(2, '0')}';
  }
}

class _VolumeVerticalPopup extends StatelessWidget {
  const _VolumeVerticalPopup({
    required this.volume,
    required this.isMuted,
    required this.onVolumeChanged,
    required this.onToggleMute,
  });

  final double volume;
  final bool isMuted;
  final ValueChanged<double> onVolumeChanged;
  final VoidCallback onToggleMute;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final tokens = _RadioSurfaceTokens.of(colorScheme);

    return Material(
      elevation: colorScheme.brightness == Brightness.dark ? 8 : 6,
      shadowColor: tokens.badgeShadow,
      color: tokens.popupFill,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: 52.w,
        padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: tokens.popupBorder),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${(volume * 100).round()}%',
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
            8.verticalSpace,
            SizedBox(
              height: 120.h,
              width: 36.w,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4.h,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.r),
                      overlayShape: SliderComponentShape.noOverlay,
                      inactiveTrackColor: tokens.waveInactive,
                      activeTrackColor: colorScheme.primary,
                      thumbColor: colorScheme.primary,
                    ),
                    child: Slider(
                      value: volume,
                      onChanged: onVolumeChanged,
                      label: S.current.quranRadioVolume,
                    ),
                  ),
                ),
              ),
            ),
            4.verticalSpace,
            Semantics(
              button: true,
              label: isMuted
                  ? S.current.quranRadioUnmute
                  : S.current.quranRadioMute,
              child: IconButton(
                onPressed: onToggleMute,
                tooltip: isMuted
                    ? S.current.quranRadioUnmute
                    : S.current.quranRadioMute,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.w),
                icon: _RadioDirectionalIcon(
                  iconPath: isMuted
                      ? AppConstants.SVG_ICON_VOLUME_X
                      : AppConstants.SVG_ICON_VOLUME_2,
                  width: 20.w,
                  height: 20.w,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkipSeekButton extends StatelessWidget {
  const _SkipSeekButton({
    required this.tooltip,
    required this.iconPath,
    required this.enabled,
    required this.onPressed,
  });

  final String tooltip;
  final String iconPath;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tint = enabled
        ? colorScheme.onSurface
        : colorScheme.onSurfaceVariant.withValues(alpha: 0.35);

    return Semantics(
      button: true,
      enabled: enabled,
      label: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: enabled ? onPressed : null,
          child: SizedBox(
            width: 36.w,
            height: 36.w,
            child: Center(
              child: _RadioDirectionalIcon(
                iconPath: iconPath,
                width: 22.w,
                height: 22.w,
                color: tint,
                mirrorInRtl: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InlinePlayButton extends StatelessWidget {
  const _InlinePlayButton({
    required this.isPlaying,
    required this.isLoading,
    required this.onPlay,
    required this.onPause,
  });

  final bool isPlaying;
  final bool isLoading;
  final VoidCallback onPlay;
  final VoidCallback onPause;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: isPlaying ? S.current.quranRadioPause : S.current.quranRadioPlay,
      child: Material(
        color: colorScheme.primary,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: isLoading ? null : (isPlaying ? onPause : onPlay),
          child: SizedBox(
            width: 40.w,
            height: 40.w,
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: 20.w,
                      height: 20.w,
                      child: WaitingWidget(
                        option: ProgressIndicatorOption.Circular,
                        valueColor: AlwaysStoppedAnimation<Color?>(
                          colorScheme.onPrimary,
                        ),
                        backgroundColor: colorScheme.onPrimary.withValues(
                          alpha: 0.24,
                        ),
                      ),
                    )
                  : _RadioDirectionalIcon(
                      iconPath: isPlaying
                          ? AppConstants.SVG_ICON_PAUSE
                          : AppConstants.SVG_ICON_PLAY,
                      width: 18.w,
                      height: 18.w,
                      color: colorScheme.onPrimary,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BarIconButton extends StatelessWidget {
  const _BarIconButton({
    required this.tooltip,
    required this.iconPath,
    required this.enabled,
    required this.onPressed,
    this.iconColor,
  });

  final String tooltip;
  final String iconPath;
  final bool enabled;
  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tint = enabled
        ? (iconColor ?? colorScheme.onSurface)
        : colorScheme.onSurfaceVariant.withValues(alpha: 0.35);

    return Semantics(
      button: true,
      enabled: enabled,
      label: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: enabled ? onPressed : null,
          child: SizedBox(
            width: 36.w,
            height: 36.w,
            child: Center(
              child: _RadioDirectionalIcon(
                iconPath: iconPath,
                width: 18.w,
                height: 18.w,
                color: tint,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Mirrors skip forward/back icons in RTL when [mirrorInRtl] is true.
class _RadioDirectionalIcon extends StatelessWidget {
  const _RadioDirectionalIcon({
    required this.iconPath,
    required this.width,
    required this.height,
    required this.color,
    this.mirrorInRtl = false,
  });

  final String iconPath;
  final double width;
  final double height;
  final Color color;
  final bool mirrorInRtl;

  @override
  Widget build(BuildContext context) {
    final icon = CustomImage.asset(
      iconPath,
      width: width,
      height: height,
      color: color,
    );

    if (!mirrorInRtl || LanguageUtils.isLTR()) {
      return icon;
    }

    return Transform.flip(flipX: true, child: icon);
  }
}
