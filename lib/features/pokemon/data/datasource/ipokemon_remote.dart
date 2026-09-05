
import 'package:dartz/dartz.dart';

import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../model/request/get_pokemons_parameter.dart';
import '../model/response/pokemon_model/pokemon_list_model.dart';

abstract class IPokemonRemoteSource extends RemoteDataSource{
  Future<Either<AppErrors, PokemonListModel>> getPokemons(GetPokemonsParameter parameter);

}
