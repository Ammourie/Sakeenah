import 'dart:convert';

import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/notification_entity.dart';

class NotificationModel extends BaseModel<NotificationEntity> {
  final DateTime? createDate;
  final String title;
  final String description;
  final int? notificationType;
  final bool isSeen;

  NotificationModel({
    required this.createDate,
    required this.title,
    required this.description,
    required this.notificationType,
    required this.isSeen,
  });

  factory NotificationModel.fromMap(Map<String, dynamic>? map) =>
      NotificationModel(
        createDate: dateTimeV(map?["createDate"]),
        title: stringV(map?["title"]),
        description: stringV(map?["description"]),
        notificationType: numV(map?["notificationType"]),
        isSeen: boolV(map?["isSeen"]),
      );

  factory NotificationModel.fromJson(String map) =>
      NotificationModel.fromMap(json.decode(map));

  @override
  NotificationEntity toEntity() => NotificationEntity(
        createDate: createDate,
        title: title,
        description: description,
        notificationType: notificationType,
        isSeen: isSeen,
      );
}
