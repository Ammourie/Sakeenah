import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/ui/error_ui/errors_screens/error_widget.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../../../../core/ui/widgets/waiting_widget.dart';
import '../../../domain/entity/pokemon_entity/pkemon_list_entity.dart';
import '../../state_m/cubit/pokemon_cubit.dart';
import '../../state_m/provider/pokemons_screen_notifier.dart';
import 'pokemons_screen_content.dart';

class PokemonsScreenParam {}

class PokemonsScreen extends BaseScreen<PokemonsScreenParam> {
  static const String routeName = "/PokemonsScreen";

  const PokemonsScreen({Key? key, required PokemonsScreenParam param})
      : super(key: key, param: param);

  @override
  _PokemonsScreenState createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  final provider = PokemonsScreenNotifier();

  @override
  void initState() {
    provider.getPokemons();
    super.initState();
  }

  @override
  void dispose() {
    provider.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, _) {
      return ChangeNotifierProvider<PokemonsScreenNotifier>.value(
        value: provider,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Pokemon"),
            elevation: 0,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: BlocConsumer<PokemonCubit, PokemonState>(
            bloc: provider.pokemonCubit,
            listener: (context, state) {
              state.when(
                pokemonInitState: () {},
                pokemonLoadingState: () {},
                pokemonErrorState: (s, e) {},
                getPokemonsLoadedState: getPokemonsLoadedStateListener,
              );
            },
            builder: (context, state) {
              return state.map(
                pokemonInitState: buildPokemonInitState,
                pokemonLoadingState: buildPokemonLoadingState,
                pokemonErrorState: buildPokemonErrorState,
                getPokemonsLoadedState: buildGetPokemonsLoadedState,
              );
            },
          ),
        ),
      );
    });
  }

  /// Widget

  Widget buildPokemonInitState(PokemonInitState state) {
    return const WaitingWidget();
  }

  Widget buildPokemonLoadingState(PokemonLoadingState state) {
    return const WaitingWidget();
  }

  Widget buildPokemonErrorState(PokemonErrorState state) {
    return ErrorScreenWidget(error: state.error, callback: state.callback);
  }

  Widget buildGetPokemonsLoadedState(GetPokemonsLoadedState state) {
    return const PoekmonsScreenContent();
  }

  /// Logic

  // void pokemonLoadingStateListener() {}

  // void pokemonErrorStateListener(AppErrors errors, Function() callback) {}

  void getPokemonsLoadedStateListener(
    PokemonListEntity pokemonListEntity,
  ) {
    provider.pokemons = pokemonListEntity.results;
  }
}
