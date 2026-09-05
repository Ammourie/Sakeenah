import '../entity/daily_prayer_schedule_entity.dart';
import '../entity/prayer_name.dart';
import '../entity/prayer_time_entity.dart';

class NextPrayerInfo {
  const NextPrayerInfo({
    required this.prayer,
    required this.remaining,
  });

  final PrayerTimeEntity prayer;
  final Duration remaining;
}

class PrayerTimesUtils {
  static PrayerTimeEntity? findNextPrayer(
    DailyPrayerScheduleEntity schedule,
    DateTime now,
  ) {
    final sorted = List<PrayerTimeEntity>.from(schedule.prayers)
      ..sort((a, b) => a.time.compareTo(b.time));

    for (final prayer in sorted) {
      if (prayer.time.isAfter(now)) {
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
      ..sort((a, b) => a.time.compareTo(b.time));

    for (final prayer in sorted) {
      if (prayer.time.isAfter(now)) {
        return NextPrayerInfo(
          prayer: prayer,
          remaining: prayer.time.difference(now),
        );
      }
    }

    if (sorted.isEmpty) return null;

    final tomorrowFajr = sorted.first.time.add(const Duration(days: 1));
    return NextPrayerInfo(
      prayer: PrayerTimeEntity(name: PrayerName.fajr, time: tomorrowFajr),
      remaining: tomorrowFajr.difference(now),
    );
  }

  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes.toString().padLeft(2, '0')}m';
    }
    if (minutes > 0) {
      return '${minutes}m ${seconds.toString().padLeft(2, '0')}s';
    }
    return '${seconds}s';
  }

  static String formatTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }
}
