import 'dart:convert';

import '../../../../../../core/common/type_validators.dart';
import '../../../../../../core/models/base_model.dart';
import '../../../../domain/entity/pokemon_entity/pokemon_entity.dart';

class PokemonModel extends BaseModel<PokemonEntity> {
  PokemonModel({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory PokemonModel.fromJson(String str) =>
      PokemonModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromMap(Map<String, dynamic> json) => PokemonModel(
        name: stringV(json["name"]),
        url: stringV(json["url"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };

  @override
  PokemonEntity toEntity() {
    int? id;
    if (url != null) {
      final splitted = url!.split("/");
      id = int.tryParse(splitted[splitted.length-2]);
    }
    return PokemonEntity(
      name: name,
      url: url,
      id: id,
    );
  }
}
