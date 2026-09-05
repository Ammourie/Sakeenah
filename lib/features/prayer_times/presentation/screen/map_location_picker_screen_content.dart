import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/ui/widgets/custom_image.dart';
import '../../../../core/ui/widgets/curved_app_bar.dart';
import '../../../../core/ui/widgets/waiting_widget.dart';
import '../../../../generated/l10n.dart';
import '../state_m/provider/map_location_picker_notifier.dart';

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
            Expanded(child: _MapPickerMapArea()),
            _MapPickerConfirmButton(
              onPressed: () => sn.confirmLocation(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _MapPickerMapArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        context.select<MapLocationPickerNotifier, bool>(
          (n) => n.mapReady || n.locationGranted || n.isLocating,
        );

        final sn = context.read<MapLocationPickerNotifier>();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  key: ValueKey(sn.locationGranted),
                  initialCameraPosition: sn.initialCameraPosition,
                  myLocationEnabled: sn.locationGranted,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  mapToolbarEnabled: false,
                  onMapCreated: sn.onMapCreated,
                  onCameraMove: (position) => sn.onCameraMove(position.target),
                ),
                if (!sn.mapReady)
                  ColoredBox(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    child: const Center(child: WaitingWidget()),
                  ),
                IgnorePointer(
                  child: Transform.translate(
                    offset: Offset(0, -18.h),
                    child: _CenterMapPin(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Positioned(
                  right: 12.w,
                  bottom: 12.h,
                  child: _MyLocationButton(
                    tooltip: S.current.goToMyLocation,
                    enabled: !sn.isLocating,
                    isLoading: sn.isLocating,
                    onPressed: () =>
                        sn.goToCurrentLocation(source: 'myLocationButton'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
        context.select<MapLocationPickerNotifier, bool>((n) => n.isSubmitting);

        final isSubmitting = context
            .read<MapLocationPickerNotifier>()
            .isSubmitting;
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
    required this.onPressed,
  });

  final String tooltip;
  final bool enabled;
  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 2,
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(4.r),
      child: IconButton(
        tooltip: tooltip,
        onPressed: enabled ? onPressed : null,
        icon: isLoading
            ? SizedBox(width: 20.r, height: 20.r, child: const WaitingWidget())
            : Icon(
                Icons.my_location_rounded,
                color: enabled
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
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
