import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entity/prayer_name.dart';
import '../../domain/utils/prayer_times_utils.dart';
import '../utils/prayer_name_l10n.dart';

class NextPrayerBanner extends StatelessWidget {
  const NextPrayerBanner({
    super.key,
    required this.nextInfo,
    required this.countdownLabel,
  });

  final NextPrayerInfo nextInfo;
  final String countdownLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nextInfo.prayer.name.localized(),
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.w700,
            ),
          ),
          4.verticalSpace,
          Text(
            countdownLabel,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class PrayerRow extends StatelessWidget {
  const PrayerRow({
    super.key,
    required this.name,
    required this.timeLabel,
    required this.isNext,
  });

  final PrayerName name;
  final String timeLabel;
  final bool isNext;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final backgroundColor = isNext
        ? colorScheme.secondaryContainer
        : colorScheme.surfaceContainerHigh;
    final primaryTextColor = isNext
        ? colorScheme.onSecondaryContainer
        : colorScheme.onSurface;
    final secondaryTextColor = isNext
        ? colorScheme.onSecondaryContainer
        : colorScheme.onSurfaceVariant;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: isNext ? colorScheme.secondary : colorScheme.outlineVariant,
          width: isNext ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name.localized(),
              style: textTheme.titleSmall?.copyWith(
                color: primaryTextColor,
                fontWeight: isNext ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ),
          Text(
            timeLabel,
            style: textTheme.titleSmall?.copyWith(
              color: secondaryTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
