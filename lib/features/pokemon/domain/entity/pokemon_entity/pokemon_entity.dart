import '../../../../../core/entities/base_entity.dart';

class PokemonEntity extends BaseEntity {
  PokemonEntity({
    required this.name,
    required this.url,
    required this.id,
  });

  final String? name;
  final String? url;
  final int? id;

  @override
  List<Object?> get props => [name, url];
}
