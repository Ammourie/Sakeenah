import 'dart:convert';

import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/url_entity.dart';

class UrlModel extends BaseModel<UrlEntity> {
  final String url;

  UrlModel({required this.url});

  factory UrlModel.fromMap(Map<String, dynamic>? map) {
    return UrlModel(url: stringV(map?['url']));
  }

  factory UrlModel.fromJson(String json) => UrlModel.fromMap(jsonDecode(json));

  @override
  UrlEntity toEntity() {
    return UrlEntity(url: this.url);
  }
}
