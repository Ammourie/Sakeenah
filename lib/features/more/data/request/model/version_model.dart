import 'dart:convert';

import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/version_entity.dart';

class VersionModel extends BaseModel<VersionEntity> {
  final String appLink;
  final int? lastSupportedVersion;
  final int? lastVersion;

  VersionModel({
    required this.appLink,
    required this.lastSupportedVersion,
    required this.lastVersion,
  });

  factory VersionModel.fromMap(Map<String, dynamic>? map) => VersionModel(
        appLink: stringV(map?["appLink"]),
        lastSupportedVersion: numV(map?["lastSupportedVersion"]),
        lastVersion: numV(map?["lastVersion"]),
      );

  factory VersionModel.fromJson(String map) =>
      VersionModel.fromMap(json.decode(map));

  @override
  VersionEntity toEntity() => VersionEntity(
        appLink: appLink,
        lastSupportedVersion: lastSupportedVersion ?? 0,
        lastVersion: lastVersion ?? 0,
      );
}
