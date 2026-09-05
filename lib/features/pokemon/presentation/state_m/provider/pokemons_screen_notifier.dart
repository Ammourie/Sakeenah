import 'package:dio/dio.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/results/result.dart';
import '../../../../../core/ui/show_toast.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/model/request/get_pokemons_parameter.dart';
import '../../../domain/entity/pokemon_entity/pokemon_entity.dart';
import '../../../domain/usecase/get_pokemons_usecase.dart';
import '../cubit/pokemon_cubit.dart';

class PokemonsScreenNotifier extends ScreenNotifier {
  /// Fields

  int _page = 0;
  final pokemonCubit = PokemonCubit();
  List<PokemonEntity> _pokemons = [];

  // bool _isLoading = false;
  RefreshController _refreshController = RefreshController();
  bool _endLoadingProducts = false;
  CancelToken cancelToken = CancelToken();

  /// Getters and Setters

  get endLoadingProducts => this._endLoadingProducts;

  set endLoadingProducts(value) {
    this._endLoadingProducts = value;
    notifyListeners();
  }

  RefreshController get refreshController => this._refreshController;

  set refreshController(RefreshController value) =>
      this._refreshController = value;

  List<PokemonEntity> get pokemons => this._pokemons;

  set pokemons(List<PokemonEntity> pokemons) {
    this._pokemons = pokemons;
    notifyListeners();
  }

  get page => this._page;

  set page(value) {
    this._page = value;
    notifyListeners();
  }

  /// Methods

  void onPokemonTap(int index) {
    CustomToast.show("${pokemons[index].name}");
  }

  bool enablePullUp() {
    return (!endLoadingProducts && !refreshController.isRefresh);
  }

  void getPokemons() {
    pokemonCubit.getPokemons(GetPokemonsParameter(
      limit: AppConstants.paginationLimit,
      offset: AppConstants.paginationFirstPage,
    ));
    _page = 1;
  }

  Future<Result<AppErrors, List<PokemonEntity>>> loadPokemons(int unit) async {
    final result = await getIt<GetPokemonsUseCase>()(GetPokemonsParameter(
        limit: AppConstants.paginationLimit,
        offset: AppConstants.paginationLimit * unit));
    return Result<AppErrors, List<PokemonEntity>>(
        error: result.error, data: result.data?.results ?? []);
  }

  void onPokemonsListLoaded(List<PokemonEntity> items, int nextUnit) {
    _pokemons = items;
    notifyListeners();
  }

  @override
  void closeNotifier() {
    pokemonCubit.close();
    this.dispose();
  }
}
