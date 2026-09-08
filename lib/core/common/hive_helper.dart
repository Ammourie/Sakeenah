import 'package:hive_flutter/hive_flutter.dart';

/// Local cache helper for Hive boxes used by feature datasources.
class HiveHelper {
  HiveHelper._();

  static const String prayerTimesBoxName = 'prayer_times_cache';

  static const String keyPrayerLocation = 'prayer_location';
  static const String keyPrayerSchedule = 'prayer_schedule';
  static const String keyPrayerScheduleDate = 'prayer_schedule_date';
  static const String keyGeocodingCache = 'geocoding_cache_entries';
  static const String keyCountriesListPrefix = 'countries_list_';
  static const String keyAdminDivisionsByCountryLang =
      'admin_divisions_by_country_lang';
  static const String keyCitiesByCountryLang = 'cities_by_country_lang';

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

  static String _countriesCacheKey(String lang) => '$keyCountriesListPrefix$lang';

  static List<Map<String, dynamic>>? getCountriesList(String lang) {
    final raw = prayerTimesBox.get(_countriesCacheKey(lang));
    if (raw is! List) return null;

    return raw
        .whereType<Map>()
        .map((entry) => Map<String, dynamic>.from(entry))
        .toList();
  }

  static bool hasCountriesList(String lang) {
    final cached = getCountriesList(lang);
    return cached != null && cached.isNotEmpty;
  }

  static Future<void> putCountriesList(
    String lang,
    List<Map<String, dynamic>> countries,
  ) async {
    await prayerTimesBox.put(_countriesCacheKey(lang), countries);
  }

  static String _citiesCacheKey(String countryCode, String adminCode1) =>
      '$countryCode|$adminCode1';

  static List<Map<String, dynamic>>? getAdminDivisionsForCountry(
    String lang,
    String countryCode,
  ) {
    final raw = prayerTimesBox.get(keyAdminDivisionsByCountryLang);
    if (raw is! Map) return null;

    final langBucket = raw[lang];
    if (langBucket is! Map) return null;

    final divisions = langBucket[countryCode];
    if (divisions is! List) return null;

    return divisions
        .whereType<Map>()
        .map((entry) => Map<String, dynamic>.from(entry))
        .toList();
  }

  static bool hasAdminDivisionsForCountry(String lang, String countryCode) {
    final cached = getAdminDivisionsForCountry(lang, countryCode);
    return cached != null && cached.isNotEmpty;
  }

  static Future<void> putAdminDivisionsForCountry({
    required String lang,
    required String countryCode,
    required List<Map<String, dynamic>> adminDivisions,
  }) async {
    final box = prayerTimesBox;
    final raw = box.get(keyAdminDivisionsByCountryLang);
    final cache = raw is Map
        ? Map<String, dynamic>.from(raw)
        : <String, dynamic>{};

    final langBucket = cache[lang] is Map
        ? Map<String, dynamic>.from(cache[lang] as Map)
        : <String, dynamic>{};

    langBucket[countryCode] = adminDivisions;
    cache[lang] = langBucket;
    await box.put(keyAdminDivisionsByCountryLang, cache);
  }

  static List<Map<String, dynamic>>? getCitiesForAdminDivision(
    String lang,
    String countryCode,
    String adminCode1,
  ) {
    final raw = prayerTimesBox.get(keyCitiesByCountryLang);
    if (raw is! Map) return null;

    final langBucket = raw[lang];
    if (langBucket is! Map) return null;

    final cities = langBucket[_citiesCacheKey(countryCode, adminCode1)];
    if (cities is! List) return null;

    return cities
        .whereType<Map>()
        .map((entry) => Map<String, dynamic>.from(entry))
        .toList();
  }

  static bool hasCitiesForAdminDivision(
    String lang,
    String countryCode,
    String adminCode1,
  ) {
    final cached = getCitiesForAdminDivision(lang, countryCode, adminCode1);
    return cached != null && cached.isNotEmpty;
  }

  static List<Map<String, dynamic>>? getCitiesForCountry(
    String lang,
    String countryCode,
  ) {
    // Kept for backward-compatible reads; prefer getCitiesForAdminDivision.
    final raw = prayerTimesBox.get(keyCitiesByCountryLang);
    if (raw is! Map) return null;

    final langBucket = raw[lang];
    if (langBucket is! Map) return null;

    final cities = langBucket[countryCode];
    if (cities is! List) return null;

    return cities
        .whereType<Map>()
        .map((entry) => Map<String, dynamic>.from(entry))
        .toList();
  }

  static bool hasCitiesForCountry(String lang, String countryCode) {
    final cached = getCitiesForCountry(lang, countryCode);
    return cached != null && cached.isNotEmpty;
  }

  static Future<void> putCitiesForCountry({
    required String lang,
    required String countryCode,
    required String adminCode1,
    required List<Map<String, dynamic>> cities,
  }) async {
    final box = prayerTimesBox;
    final raw = box.get(keyCitiesByCountryLang);
    final cache = raw is Map
        ? Map<String, dynamic>.from(raw)
        : <String, dynamic>{};

    final langBucket = cache[lang] is Map
        ? Map<String, dynamic>.from(cache[lang] as Map)
        : <String, dynamic>{};

    langBucket[_citiesCacheKey(countryCode, adminCode1)] = cities;
    cache[lang] = langBucket;
    await box.put(keyCitiesByCountryLang, cache);
  }

  static Future<void> clearPrayerCache() async {
    await prayerTimesBox.delete(keyPrayerLocation);
    await prayerTimesBox.delete(keyPrayerSchedule);
    await prayerTimesBox.delete(keyPrayerScheduleDate);
    await prayerTimesBox.delete(keyGeocodingCache);
    await _deleteCountriesCache();
    await prayerTimesBox.delete(keyAdminDivisionsByCountryLang);
    await prayerTimesBox.delete(keyCitiesByCountryLang);
  }

  static Future<void> _deleteCountriesCache() async {
    final keys = prayerTimesBox.keys.whereType<String>().where(
          (key) => key.startsWith(keyCountriesListPrefix),
        );
    for (final key in keys) {
      await prayerTimesBox.delete(key);
    }
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
