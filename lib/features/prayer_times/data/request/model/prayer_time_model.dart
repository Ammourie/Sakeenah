import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/prayer_name.dart';
import '../../../domain/entity/prayer_time_entity.dart';

class PrayerTimeModel extends BaseModel<PrayerTimeEntity> {
  final String name;
  final String timeIso;

  PrayerTimeModel({
    required this.name,
    required this.timeIso,
  });

  factory PrayerTimeModel.fromMap(Map<String, dynamic> json) {
    return PrayerTimeModel(
      name: stringV(json['name']),
      timeIso: stringV(json['timeIso']),
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'timeIso': timeIso,
      };

  @override
  PrayerTimeEntity toEntity() {
    return PrayerTimeEntity(
      name: PrayerName.values.firstWhere(
        (e) => e.name == name,
        orElse: () => PrayerName.fajr,
      ),
      time: DateTime.parse(timeIso),
    );
  }

  factory PrayerTimeModel.fromEntity(PrayerTimeEntity entity) {
    return PrayerTimeModel(
      name: entity.name.name,
      timeIso: entity.time.toIso8601String(),
    );
  }
}
