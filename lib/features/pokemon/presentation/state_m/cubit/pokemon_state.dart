part of 'pokemon_cubit.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState.pokemonInitState() = PokemonInitState;

  const factory PokemonState.pokemonLoadingState() = PokemonLoadingState;

  const factory PokemonState.pokemonErrorState(
    AppErrors error,
    VoidCallback callback,
  ) = PokemonErrorState;

  const factory PokemonState.getPokemonsLoadedState(
    PokemonListEntity pokemonListEntity,
  ) = GetPokemonsLoadedState;
}
