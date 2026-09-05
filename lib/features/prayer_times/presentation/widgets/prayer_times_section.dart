import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/ui/widgets/animated_wrapper.dart';
import '../../../../core/ui/widgets/waiting_widget.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entity/daily_prayer_schedule_entity.dart';
import '../../domain/entity/location_preference_entity.dart';
import '../../domain/utils/location_label_utils.dart';
import '../../domain/utils/prayer_times_utils.dart';
import '../state_m/cubit/prayer_times_cubit.dart';
import '../utils/prayer_name_l10n.dart';
import 'prayer_row.dart';

/// Display-only prayer times card. Data loading and cubit wiring live on the
/// home screen / [HomeScreenNotifier] — pass [state] and callbacks in.
class PrayerTimesSection extends StatelessWidget {
  const PrayerTimesSection({
    super.key,
    required this.state,
    required this.clock,
    required this.onPickMapLocation,
    required this.onRetryGps,
  });

  final PrayerTimesState state;
  final DateTime clock;
  final VoidCallback onPickMapLocation;
  final VoidCallback onRetryGps;

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
          Row(
            children: [
              Expanded(
                child: Text(
                  S.current.prayerTimesTitle,
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextButton(
                onPressed: onPickMapLocation,
                child: Text(S.current.pickLocationOnMapTitle),
              ),
            ],
          ),
          state.maybeWhen(
            initial: () => const SizedBox.shrink(),
            loading: () => _buildLoading(),
            noLocation: () => _buildNoLocation(context),
            error: (error, callback) => _buildError(context, callback),
            loaded: (schedule, location, isCached) => _buildLoaded(
              context,
              schedule,
              location,
              isCached,
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: const WaitingWidget(),
    );
  }

  Widget _buildNoLocation(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        8.verticalSpace,
        Text(
          S.current.noLocationMessage,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        16.verticalSpace,
        FilledButton(
          onPressed: onPickMapLocation,
          child: Text(S.current.pickLocationOnMapTitle),
        ),
        8.verticalSpace,
        OutlinedButton(
          onPressed: onRetryGps,
          child: Text(S.current.useGpsLocation),
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context, VoidCallback callback) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        8.verticalSpace,
        Text(
          S.current.faildToFetchData,
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
        ),
        16.verticalSpace,
        FilledButton(
          onPressed: callback,
          child: Text(S.current.retry),
        ),
      ],
    );
  }

  Widget _buildLoaded(
    BuildContext context,
    DailyPrayerScheduleEntity schedule,
    LocationPreferenceEntity location,
    bool isCached,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final nextInfo = PrayerTimesUtils.nextPrayerInfo(schedule, clock);
    final nextName = nextInfo?.prayer.name;

    final sortedPrayers = List.from(schedule.prayers)
      ..sort((a, b) => a.time.compareTo(b.time));

    return AnimatedWrapper(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        4.verticalSpace,
        Text(
          S.current.prayerLocationLabel(
            LocationLabelUtils.readableLabel(
              location,
              fallback: S.current.locationAreaFallback,
            ),
          ),
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        if (isCached) ...[
          4.verticalSpace,
          Text(
            S.current.cachedPrayerTimes,
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        if (nextInfo != null) ...[
          16.verticalSpace,
          NextPrayerBanner(
            nextInfo: nextInfo,
            countdownLabel: S.current.nextPrayerIn(
              nextInfo.prayer.name.localized(),
              PrayerTimesUtils.formatDuration(nextInfo.remaining),
            ),
          ),
        ],
        16.verticalSpace,
        ...sortedPrayers.map((prayer) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: PrayerRow(
              name: prayer.name,
              timeLabel: PrayerTimesUtils.formatTime(prayer.time),
              isNext: prayer.name == nextName,
            ),
          );
        }),
      ],
    );
  }
}
