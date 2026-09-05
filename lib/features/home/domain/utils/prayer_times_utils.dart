import '../entity/daily_prayer_schedule_entity.dart';
import '../entity/prayer_name.dart';
import '../entity/prayer_time_entity.dart';

class NextPrayerInfo {
  const NextPrayerInfo({required this.prayer, required this.remaining});

  final PrayerTimeEntity prayer;
  final Duration remaining;
}

class PrayerTimesUtils {
  static PrayerTimeEntity? findNextPrayer(
    DailyPrayerScheduleEntity schedule,
    DateTime now,
  ) {
    final sorted = List<PrayerTimeEntity>.from(schedule.prayers)
      ..sort((a, b) => a.time?.compareTo(b.time!) ?? 0);

    for (final prayer in sorted) {
      if (prayer.time?.isAfter(now) ?? false) {
        return prayer;
      }
    }
    return sorted.isNotEmpty ? sorted.first : null;
  }

  static NextPrayerInfo? nextPrayerInfo(
    DailyPrayerScheduleEntity schedule,
    DateTime now,
  ) {
    final sorted = List<PrayerTimeEntity>.from(schedule.prayers)
      ..sort((a, b) => a.time?.compareTo(b.time!) ?? 0);

    for (final prayer in sorted) {
      if (prayer.time?.isAfter(now) ?? false) {
        return NextPrayerInfo(
          prayer: prayer,
          remaining: prayer.time?.difference(now) ?? Duration.zero,
        );
      }
    }

    if (sorted.isEmpty) return null;

    final tomorrowFajr =
        sorted.first.time?.add(const Duration(days: 1)) ?? DateTime.now();
    return NextPrayerInfo(
      prayer: PrayerTimeEntity(name: PrayerName.fajr, time: tomorrowFajr),
      remaining: tomorrowFajr.difference(now),
    );
  }
}
