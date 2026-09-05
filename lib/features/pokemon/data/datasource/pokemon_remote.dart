
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/response_validators/pokemon_response_validators.dart';
import '../model/request/get_pokemons_parameter.dart';
import '../model/response/pokemon_model/pokemon_list_model.dart';
import 'ipokemon_remote.dart';

@Injectable(as: IPokemonRemoteSource)
class PokemonRemoteSource extends IPokemonRemoteSource {
  @override
  Future<Either<AppErrors, PokemonListModel>> getPokemons(
      GetPokemonsParameter paramteter) {
    return request<PokemonListModel>(
        converter: (json) => PokemonListModel.fromMap(json),
        method: HttpMethod.GET,
        baseUrl: "https://pokeapi.co/api/v2/pokemon/",
        url: "",
        queryParameters: paramteter.toMap(),
        responseValidator: PokemonResponseValidator());
  }
}
