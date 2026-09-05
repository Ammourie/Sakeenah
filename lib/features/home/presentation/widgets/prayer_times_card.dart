import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/utils/date_utils.dart';
import '../../../../core/ui/widgets/animated_wrapper.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entity/daily_prayer_schedule_entity.dart';
import '../../domain/entity/prayer_name.dart';
import '../../domain/entity/prayer_time_entity.dart';
import '../../domain/utils/prayer_times_utils.dart';
import '../utils/prayer_name_l10n.dart';
import 'prayer_row.dart';

class PrayerTimesCard extends StatelessWidget {
  const PrayerTimesCard({
    super.key,
    required this.schedule,
    required this.clock,
    required this.label,
    required this.onChangeLocation,
  }) : _skeletonize = false;

  PrayerTimesCard.dummy({super.key})
      : schedule = _dummySchedule(),
        clock = DateTime.now(),
        label = 'Placeholder location',
        onChangeLocation = _noop,
        _skeletonize = true;

  static void _noop() {}

  final DailyPrayerScheduleEntity schedule;
  final DateTime clock;
  final String label;
  final VoidCallback onChangeLocation;
  final bool _skeletonize;

  static DailyPrayerScheduleEntity _dummySchedule() {
    final now = DateTime.now();
    return DailyPrayerScheduleEntity(
      date: now,
      locationKey: 'dummy',
      prayers: PrayerName.values
          .map(
            (name) => PrayerTimeEntity(
              name: name,
              time: DateTime(
                now.year,
                now.month,
                now.day,
                5 + (name.index * 2),
                30,
              ),
            ),
          )
          .toList(),
      fetchedAt: now,
    );
  }

  @override
  Widget build(BuildContext context) {
    final card = _buildCard(context, useSkeleton: _skeletonize);
    if (_skeletonize) {
      return Skeletonizer(enabled: true, child: card);
    }
    return card;
  }

  Widget _buildCard(BuildContext context, {required bool useSkeleton}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context).languageCode;
    final use24Hour = MediaQuery.alwaysUse24HourFormatOf(context);
    final nextInfo = PrayerTimesUtils.nextPrayerInfo(schedule, clock);
    final nextName = nextInfo?.prayer.name;

    final sortedPrayers = List<PrayerTimeEntity>.from(schedule.prayers)
      ..sort((a, b) => a.time?.compareTo(b.time ?? DateTime.now()) ?? 0);

    final List<Widget> cardChildren = [
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
            onPressed: onChangeLocation,
            child: Text(S.current.changeLocation),
          ),
        ],
      ),
      useSkeleton
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                4.verticalSpace,
                Text(
                  DateUtility.formatLocalFullDate(schedule.date, locale: locale),
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.verticalSpace,
                Text(
                  S.current.prayerLocationLabel(label),
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                if (nextInfo != null) ...[
                  16.verticalSpace,
                  NextPrayerBanner(
                    countdownLabel: S.current.nextPrayerIn(
                      nextInfo.prayer.name?.localized() ?? '',
                      DateUtility.formatLocalDuration(
                        nextInfo.remaining,
                        locale: locale,
                        hourUnitOne: S.current.durationHourUnitOne,
                        hourUnitOther: S.current.durationHourUnitOther,
                        minuteUnitOne: S.current.durationMinuteUnitOne,
                        minuteUnitOther: S.current.durationMinuteUnitOther,
                      ),
                    ),
                  ),
                ],
                16.verticalSpace,
                ...sortedPrayers.map((prayer) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: PrayerRow(
                      name: prayer.name ?? PrayerName.fajr,
                      timeLabel: DateUtility.formatLocalTime(
                        prayer.time ?? DateTime.now(),
                        locale: locale,
                        use24HourFormat: use24Hour,
                      ),
                      isNext: prayer.name == nextName,
                    ),
                  );
                }),
              ],
            )
          : AnimatedWrapper(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                4.verticalSpace,
                Text(
                  DateUtility.formatLocalFullDate(schedule.date, locale: locale),
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.verticalSpace,
                Text(
                  S.current.prayerLocationLabel(label),
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                if (nextInfo != null) ...[
                  16.verticalSpace,
                  NextPrayerBanner(
                    countdownLabel: S.current.nextPrayerIn(
                      nextInfo.prayer.name?.localized() ?? '',
                      DateUtility.formatLocalDuration(
                        nextInfo.remaining,
                        locale: locale,
                        hourUnitOne: S.current.durationHourUnitOne,
                        hourUnitOther: S.current.durationHourUnitOther,
                        minuteUnitOne: S.current.durationMinuteUnitOne,
                        minuteUnitOther: S.current.durationMinuteUnitOther,
                      ),
                    ),
                  ),
                ],
                16.verticalSpace,
                ...sortedPrayers.map((prayer) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: PrayerRow(
                      name: prayer.name ?? PrayerName.fajr,
                      timeLabel: DateUtility.formatLocalTime(
                        prayer.time ?? DateTime.now(),
                        locale: locale,
                        use24HourFormat: use24Hour,
                      ),
                      isNext: prayer.name == nextName,
                    ),
                  );
                }),
              ],
            ),
    ];

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
        children: cardChildren,
      ),
    );
  }
}
