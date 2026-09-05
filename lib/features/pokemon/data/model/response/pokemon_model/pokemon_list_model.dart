// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromMap(jsonString);

import 'dart:convert';

import 'package:starter_application/core/common/type_validators.dart';
import 'package:starter_application/core/models/base_model.dart';
import 'package:starter_application/features/pokemon/data/model/response/pokemon_model/pokemon_model.dart';
import 'package:starter_application/features/pokemon/domain/entity/pokemon_entity/pkemon_list_entity.dart';
import 'package:starter_application/core/common/extensions/extensions.dart';


class PokemonListModel extends BaseModel<PokemonListEntity> {
  PokemonListModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonModel> results;

  factory PokemonListModel.fromJson(String str) =>
      PokemonListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonListModel.fromMap(Map<String, dynamic> json) =>
      PokemonListModel(
        count: numV(json["count"]),
        next: stringV(json["next"]),
        previous: stringV(json["previous"]),
        results: json['results'] == null ? [] : List<PokemonModel>.from(
            json["results"].map((x) => PokemonModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };

  @override
  PokemonListEntity toEntity() {
    return PokemonListEntity(
      count: count,
      next: next,
      previous: previous,
      results: results.toListEntity(),
    );
  }
}
