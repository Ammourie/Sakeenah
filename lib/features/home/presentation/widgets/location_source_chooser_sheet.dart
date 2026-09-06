import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/ui/widgets/custom_image.dart';
import '../../../../generated/l10n.dart';

enum LocationPickerOption { map, manual }

Future<LocationPickerOption?> showLocationSourceChooser(
  BuildContext context,
) {
  final colorScheme = Theme.of(context).colorScheme;

  return showModalBottomSheet<LocationPickerOption>(
    context: context,
    backgroundColor: colorScheme.surfaceContainer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                ),
              ),
              16.verticalSpace,
              Text(
                S.current.changeLocation,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              8.verticalSpace,
              Text(
                S.current.locationSourceChooserMessage,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
              ),
              16.verticalSpace,
              _LocationSourceTile(
                iconAsset: AppConstants.SVG_ICON_MAP_PIN,
                title: S.current.pickFromMap,
                subtitle: S.current.pickFromMapDescription,
                onTap: () => Navigator.of(context).pop(LocationPickerOption.map),
              ),
              8.verticalSpace,
              _LocationSourceTile(
                iconAsset: AppConstants.SVG_ICON_GLOBE_2,
                title: S.current.countryCityPicker,
                subtitle: S.current.countryCityPickerDescription,
                onTap: () =>
                    Navigator.of(context).pop(LocationPickerOption.manual),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _LocationSourceTile extends StatelessWidget {
  const _LocationSourceTile({
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String iconAsset;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: colorScheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: CustomImage.asset(
                    iconAsset,
                    width: 22.r,
                    height: 22.r,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      subtitle,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
