import 'package:injectable/injectable.dart';

import '../../../../core/common/extensions/either_error_model_extension.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../domain/entity/pokemon_entity/pkemon_list_entity.dart';
import '../../domain/repository/irepository.dart';
import '../datasource/ipokemon_remote.dart';
import '../model/request/get_pokemons_parameter.dart';

@Injectable(as: IPokemonRepository)
class PokemonRepository extends IPokemonRepository {
  final IPokemonRemoteSource remoteSource;

  PokemonRepository(this.remoteSource);

  @override
  Future<Result<AppErrors, PokemonListEntity>> getPokemons(
      GetPokemonsParameter parameter) async {
    return (await remoteSource.getPokemons(parameter))
        .result<PokemonListEntity>();
  }
}
