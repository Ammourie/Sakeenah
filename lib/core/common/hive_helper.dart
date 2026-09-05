import 'package:hive_flutter/hive_flutter.dart';

/// Local cache helper for Hive boxes used by feature datasources.
class HiveHelper {
  HiveHelper._();

  static const String prayerTimesBoxName = 'prayer_times_cache';

  static const String keyPrayerLocation = 'prayer_location';
  static const String keyPrayerSchedule = 'prayer_schedule';
  static const String keyPrayerScheduleDate = 'prayer_schedule_date';
  static const String keyGeocodingCache = 'geocoding_cache_entries';

  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;

    await Hive.initFlutter();
    await Hive.openBox<dynamic>(prayerTimesBoxName);
    _initialized = true;
  }

  static Box<dynamic> get prayerTimesBox {
    _ensureInitialized();
    return Hive.box<dynamic>(prayerTimesBoxName);
  }

  static Future<void> putPrayerLocation(Map<String, dynamic> value) async {
    await prayerTimesBox.put(keyPrayerLocation, value);
  }

  static Map<String, dynamic>? getPrayerLocation() {
    final raw = prayerTimesBox.get(keyPrayerLocation);
    if (raw is Map) {
      return Map<String, dynamic>.from(raw);
    }
    return null;
  }

  static Future<void> putPrayerSchedule({
    required Map<String, dynamic> schedule,
    required String scheduleDate,
  }) async {
    final box = prayerTimesBox;
    await box.put(keyPrayerSchedule, schedule);
    await box.put(keyPrayerScheduleDate, scheduleDate);
  }

  static Map<String, dynamic>? getPrayerSchedule() {
    final raw = prayerTimesBox.get(keyPrayerSchedule);
    if (raw is Map) {
      return Map<String, dynamic>.from(raw);
    }
    return null;
  }

  static String? getPrayerScheduleDate() {
    final raw = prayerTimesBox.get(keyPrayerScheduleDate);
    return raw?.toString();
  }

  static List<Map<String, dynamic>> getGeocodingCacheEntries() {
    final raw = prayerTimesBox.get(keyGeocodingCache);
    if (raw is! List) return [];

    return raw
        .whereType<Map>()
        .map((entry) => Map<String, dynamic>.from(entry))
        .toList();
  }

  static Future<void> putGeocodingCacheEntries(
    List<Map<String, dynamic>> entries,
  ) async {
    await prayerTimesBox.put(keyGeocodingCache, entries);
  }

  static Future<void> clearPrayerCache() async {
    await prayerTimesBox.delete(keyPrayerLocation);
    await prayerTimesBox.delete(keyPrayerSchedule);
    await prayerTimesBox.delete(keyPrayerScheduleDate);
    await prayerTimesBox.delete(keyGeocodingCache);
  }

  /// Clears all locally cached API / datasource responses.
  static Future<void> clearAllCachedRequests() async {
    await clearPrayerCache();
  }

  static void _ensureInitialized() {
    if (!_initialized) {
      throw StateError(
        'HiveHelper.init() must be called before accessing Hive boxes.',
      );
    }
  }
}
