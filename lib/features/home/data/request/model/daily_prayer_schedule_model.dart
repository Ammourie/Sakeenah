import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/daily_prayer_schedule_entity.dart';
import '../../../domain/entity/prayer_name.dart';
import 'prayer_time_model.dart';

class DailyPrayerScheduleModel extends BaseModel<DailyPrayerScheduleEntity> {
  final String dateIso;
  final String locationKey;
  final List<PrayerTimeModel> prayers;
  final String fetchedAtIso;
  final bool isFromCache;

  DailyPrayerScheduleModel({
    required this.dateIso,
    required this.locationKey,
    required this.prayers,
    required this.fetchedAtIso,
    this.isFromCache = false,
  });

  factory DailyPrayerScheduleModel.fromMap(Map<String, dynamic> json) {
    final prayerMaps = json['prayers'];
    return DailyPrayerScheduleModel(
      dateIso: stringV(json['dateIso']),
      locationKey: stringV(json['locationKey']),
      prayers: listV(
        (prayerMaps is List
                ? prayerMaps
                      .whereType<Map>()
                      .map(
                        (e) => PrayerTimeModel.fromMap(
                          Map<String, dynamic>.from(e),
                        ),
                      )
                      .toList()
                : [])
            as List<PrayerTimeModel?>?,
      ),

      fetchedAtIso: stringV(json['fetchedAtIso']),
      isFromCache: boolV(json['isFromCache']),
    );
  }

  /// Parses AlAdhan API `data` object.
  factory DailyPrayerScheduleModel.fromAlAdhanData(
    Map<String, dynamic> data, {
    required String locationKey,
  }) {
    final timings = data['timings'] as Map<String, dynamic>? ?? {};
    final dateMap = data['date'] as Map<String, dynamic>? ?? {};
    final gregorian = dateMap['gregorian'] as Map<String, dynamic>? ?? {};
    final dateParts = stringV(gregorian['date']).split('-');
    final now = DateTime.now();

    DateTime scheduleDate = DateTime(now.year, now.month, now.day);
    if (dateParts.length == 3) {
      final day = int.tryParse(dateParts[0]) ?? now.day;
      final month = int.tryParse(dateParts[1]) ?? now.month;
      final year = int.tryParse(dateParts[2]) ?? now.year;
      scheduleDate = DateTime(year, month, day);
    }

    final prayers = <PrayerTimeModel>[];
    for (final name in PrayerName.values) {
      final raw = stringV(timings[name.apiKey]);
      if (raw.isEmpty) continue;
      final timePart = raw.split(' ').first;
      final segments = timePart.split(':');
      if (segments.length < 2) continue;
      final hour = int.tryParse(segments[0]) ?? 0;
      final minute = int.tryParse(segments[1]) ?? 0;
      final prayerTime = DateTime(
        scheduleDate.year,
        scheduleDate.month,
        scheduleDate.day,
        hour,
        minute,
      );
      prayers.add(
        PrayerTimeModel(name: name.name, timeIso: prayerTime.toIso8601String()),
      );
    }

    return DailyPrayerScheduleModel(
      dateIso: scheduleDate.toIso8601String(),
      locationKey: locationKey,
      prayers: prayers,
      fetchedAtIso: DateTime.now().toIso8601String(),
      isFromCache: false,
    );
  }

  Map<String, dynamic> toMap() => {
    'dateIso': dateIso,
    'locationKey': locationKey,
    'prayers': prayers.map((e) => e.toMap()).toList(),
    'fetchedAtIso': fetchedAtIso,
    'isFromCache': isFromCache,
  };

  @override
  DailyPrayerScheduleEntity toEntity() {
    return DailyPrayerScheduleEntity(
      date: DateTime.parse(dateIso),
      locationKey: locationKey,
      prayers: prayers.map((e) => e.toEntity()).toList(),
      fetchedAt: DateTime.parse(fetchedAtIso),
    );
  }
}
