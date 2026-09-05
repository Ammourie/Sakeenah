import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class PrayerTimesErrorWidget extends StatelessWidget {
  const PrayerTimesErrorWidget({
    super.key,
    required this.onRefresh,
  });

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.current.prayerTimesTitle,
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
          8.verticalSpace,
          Text(
            S.current.faildToFetchData,
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
          ),
          16.verticalSpace,
          FilledButton(
            onPressed: onRefresh,
            child: Text(S.current.retry),
          ),
        ],
      ),
    );
  }
}
