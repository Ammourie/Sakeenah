import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/providers/theme_mode_provider.dart';
import '../../../../core/ui/widgets/custom_image.dart';
import '../../../../core/ui/widgets/curved_app_bar.dart';
import '../../../../core/ui/widgets/waiting_widget.dart';
import '../../../../generated/l10n.dart';
import '../state_m/provider/map_location_picker_notifier.dart';

/// Icons and controls sit on map tiles, not the scaffold — pick contrast against the map.
Color _mapAccentColor(ColorScheme scheme) =>
    scheme.brightness == Brightness.dark ? scheme.secondary : scheme.primary;

Color _mapControlSurface(ColorScheme scheme) =>
    scheme.brightness == Brightness.dark
    ? scheme.surfaceBright
    : scheme.surfaceContainerHigh;

Color _mapControlBorder(ColorScheme scheme) =>
    scheme.brightness == Brightness.dark
    ? scheme.outline
    : scheme.outlineVariant;

class MapLocationPickerScreenContent extends StatelessWidget {
  const MapLocationPickerScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final sn = context.read<MapLocationPickerNotifier>();

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CurvedAppBarLayout(
        appBar: CurvedAppBar(
          title: S.current.pickLocationOnMapTitle,
          automaticallyImplyLeading: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
              child: Text(
                S.current.pickLocationOnMapMessage,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
            ),
            const Expanded(child: _MapPickerMapArea()),
            _MapPickerConfirmButton(
              onPressed: () => sn.confirmLocation(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _MapPickerMapArea extends StatefulWidget {
  const _MapPickerMapArea();

  @override
  State<_MapPickerMapArea> createState() => _MapPickerMapAreaState();
}

class _MapPickerMapAreaState extends State<_MapPickerMapArea> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncMapStyle();
  }

  void _syncMapStyle() {
    final sn = context.read<MapLocationPickerNotifier>();
    if (!sn.mapReady) return;
    sn.applyMapStyle(Theme.of(context).brightness);
  }

  @override
  Widget build(BuildContext context) {
    final mapReady = context.select<MapLocationPickerNotifier, bool>(
      (n) => n.mapReady,
    );
    final locationGranted = context.select<MapLocationPickerNotifier, bool>(
      (n) => n.locationGranted,
    );
    final isLocating = context.select<MapLocationPickerNotifier, bool>(
      (n) => n.isLocating,
    );
    final mapStyle = context.select<MapLocationPickerNotifier, String?>(
      (n) => n.mapStyle,
    );
    context.select<ThemeModeProvider, ThemeMode>((p) => p.themeMode);

    final sn = context.read<MapLocationPickerNotifier>();
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: colorScheme.outlineVariant),
          boxShadow: brightness == Brightness.dark
              ? null
              : [
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.06),
                    blurRadius: 12.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                key: ValueKey(locationGranted),
                initialCameraPosition: sn.initialCameraPosition,
                style: mapStyle,
                myLocationEnabled: locationGranted,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                compassEnabled: false,
                mapToolbarEnabled: false,
                onMapCreated: (controller) =>
                    sn.onMapCreated(controller, brightness: brightness),
                onCameraMove: (position) => sn.onCameraMove(position.target),
                onCameraIdle: sn.onCameraIdle,
              ),
              if (!mapReady)
                ColoredBox(
                  color: colorScheme.surfaceContainerHigh,
                  child: const Center(child: WaitingWidget()),
                ),
              IgnorePointer(
                child: Transform.translate(
                  offset: Offset(0, -18.h),
                  child: _CenterMapPin(color: _mapAccentColor(colorScheme)),
                ),
              ),
              Positioned(
                right: 12.w,
                bottom: 12.h,
                child: _MyLocationButton(
                  tooltip: S.current.goToMyLocation,
                  enabled: !isLocating,
                  isLoading: isLocating,
                  accentColor: _mapAccentColor(colorScheme),
                  surfaceColor: _mapControlSurface(colorScheme),
                  borderColor: _mapControlBorder(colorScheme),
                  onPressed: () =>
                      sn.goToCurrentLocation(source: 'myLocationButton'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapPickerConfirmButton extends StatelessWidget {
  const _MapPickerConfirmButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isSubmitting = context.select<MapLocationPickerNotifier, bool>(
          (n) => n.isSubmitting,
        );
        final colorScheme = Theme.of(context).colorScheme;

        return Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
          child: FilledButton(
            onPressed: isSubmitting ? null : onPressed,
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            child: isSubmitting
                ? SizedBox(
                    width: 22.r,
                    height: 22.r,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colorScheme.onPrimary,
                    ),
                  )
                : Text(S.current.confirmMapLocation),
          ),
        );
      },
    );
  }
}

class _MyLocationButton extends StatelessWidget {
  const _MyLocationButton({
    required this.tooltip,
    required this.enabled,
    required this.isLoading,
    required this.accentColor,
    required this.surfaceColor,
    required this.borderColor,
    required this.onPressed,
  });

  final String tooltip;
  final bool enabled;
  final bool isLoading;
  final Color accentColor;
  final Color surfaceColor;
  final Color borderColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 0,
      color: surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: borderColor),
      ),
      child: IconButton(
        tooltip: tooltip,
        onPressed: enabled ? onPressed : null,
        icon: isLoading
            ? SizedBox(width: 20.r, height: 20.r, child: const WaitingWidget())
            : Icon(
                Icons.my_location_rounded,
                color: enabled ? accentColor : colorScheme.onSurfaceVariant,
              ),
      ),
    );
  }
}

class _CenterMapPin extends StatelessWidget {
  const _CenterMapPin({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomImage.asset(
      AppConstants.SVG_ICON_MAP_PIN,
      width: 44.r,
      height: 44.r,
      color: color,
    );
  }
}
