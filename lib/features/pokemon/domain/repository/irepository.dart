import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/model/request/get_pokemons_parameter.dart';
import '../entity/pokemon_entity/pkemon_list_entity.dart';

abstract class IPokemonRepository extends Repository{
  Future<Result<AppErrors, PokemonListEntity>> getPokemons(GetPokemonsParameter parameter);
}
