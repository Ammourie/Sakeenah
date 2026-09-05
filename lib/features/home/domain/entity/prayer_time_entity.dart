import '../../../../core/entities/base_entity.dart';
import 'prayer_name.dart';

class PrayerTimeEntity extends BaseEntity {
  final PrayerName? name;
  final DateTime? time;

  PrayerTimeEntity({
    required this.name,
    required this.time,
  });

  @override
  List<Object?> get props => [name, time];
}
