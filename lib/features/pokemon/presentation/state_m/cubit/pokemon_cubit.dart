import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/model/request/get_pokemons_parameter.dart';
import '../../../domain/entity/pokemon_entity/pkemon_list_entity.dart';
import '../../../domain/usecase/get_pokemons_usecase.dart';

part 'pokemon_cubit.freezed.dart';
part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(const PokemonState.pokemonInitState());

  void getPokemons(
    GetPokemonsParameter parameter,
  ) async {
    emit(const PokemonState.pokemonLoadingState());
    final result = await getIt<GetPokemonsUseCase>()(
      parameter,
    );

    result.pick(
      onData: (data) {
        emit(PokemonState.getPokemonsLoadedState(result.data!));
      },
      onError: (error) {
        emit(
          PokemonState.pokemonErrorState(
            result.error!,
            () => this.getPokemons(parameter),
          ),
        );
      },
    );
  }
}
