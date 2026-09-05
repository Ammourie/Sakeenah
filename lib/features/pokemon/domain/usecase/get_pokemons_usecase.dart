import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/get_pokemons_parameter.dart';
import '../entity/pokemon_entity/pkemon_list_entity.dart';
import '../repository/irepository.dart';

@injectable
class GetPokemonsUseCase
    extends UseCase<PokemonListEntity, GetPokemonsParameter> {
  final IPokemonRepository repoistory;

  GetPokemonsUseCase(this.repoistory);
  @override
  Future<Result<AppErrors, PokemonListEntity>> call(
      GetPokemonsParameter params) {
    return repoistory.getPokemons(params);
  }
}
