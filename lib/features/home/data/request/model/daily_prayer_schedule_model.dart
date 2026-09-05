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
    // Use type validators for all fields
    return DailyPrayerScheduleModel(
      dateIso: stringV(json['dateIso']),
      locationKey: stringV(json['locationKey']),
      prayers: listV<PrayerTimeModel>(
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

  factory DailyPrayerScheduleModel.fromAlAdhanData(
    Map<String, dynamic> data, {
    required String locationKey,
  }) {
    // Use type validators for all field accesses
    final timings = (data['timings'] is Map) ? Map<String, dynamic>.from(data['timings']) : <String, dynamic>{};
    final dateMap = (data['date'] is Map) ? Map<String, dynamic>.from(data['date']) : <String, dynamic>{};
    final gregorian = (dateMap['gregorian'] is Map) ? Map<String, dynamic>.from(dateMap['gregorian']) : <String, dynamic>{};
    final dateParts = stringV(gregorian['date']).split('-');
    final now = DateTime.now();

    DateTime scheduleDate = DateTime(now.year, now.month, now.day);
    if (dateParts.length == 3) {
      final day = numV<int>(dateParts[0]) ?? now.day;
      final month = numV<int>(dateParts[1]) ?? now.month;
      final year = numV<int>(dateParts[2]) ?? now.year;
      scheduleDate = DateTime(year, month, day);
    }

    final prayers = <PrayerTimeModel>[];
    for (final name in PrayerName.values) {
      final raw = stringV(timings[name.apiKey]);
      if (raw.isEmpty) continue;
      final timePart = raw.split(' ').first;
      final segments = timePart.split(':');
      if (segments.length < 2) continue;
      final hour = numV<int>(segments[0]) ?? 0;
      final minute = numV<int>(segments[1]) ?? 0;
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
      locationKey: stringV(locationKey),
      prayers: prayers,
      fetchedAtIso: DateTime.now().toIso8601String(),
      isFromCache: false,
    );
  }

  factory DailyPrayerScheduleModel.fromEntity(DailyPrayerScheduleEntity entity) {
    // Use type validators and handle possible nullables
    final date = entity.date ?? DateTime.now();
    final fetchedAt = entity.fetchedAt ?? DateTime.now();

    return DailyPrayerScheduleModel(
      dateIso: date.toIso8601String(),
      locationKey: stringV(entity.locationKey),
      prayers: listV<PrayerTimeModel>(
        entity.prayers
            .map(
              (prayer) => PrayerTimeModel(
                name: stringV(prayer.name?.name ?? PrayerName.fajr.name),
                timeIso: (prayer.time ?? date).toIso8601String(),
              ),
            )
            .toList(),
      ),
      fetchedAtIso: fetchedAt.toIso8601String(),
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
      date: dateTimeV(dateIso),
      locationKey: stringV(locationKey),
      prayers: prayers.map((e) => e.toEntity()).toList(),
      fetchedAt: dateTimeV(fetchedAtIso),
    );
  }
}
