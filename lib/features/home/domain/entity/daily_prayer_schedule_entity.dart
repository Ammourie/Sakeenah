import '../../../../core/entities/base_entity.dart';
import 'prayer_time_entity.dart';

class DailyPrayerScheduleEntity extends BaseEntity {
  final DateTime? date;
  final String locationKey;
  final List<PrayerTimeEntity> prayers;
  final DateTime? fetchedAt;

  DailyPrayerScheduleEntity({
    required this.date,
    required this.locationKey,
    required this.prayers,
    required this.fetchedAt,
  });

  @override
  List<Object?> get props => [date, locationKey, prayers, fetchedAt];
}
