import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/ui/widgets/pagination_widget.dart';
import '../../state_m/provider/pokemons_screen_notifier.dart';
import '../../widget/pokemon_card_tablet.dart';

class PokemonsScreenContentTablet extends StatefulWidget {
  @override
  State<PokemonsScreenContentTablet> createState() => _PokemonsScreenContentTabletState();
}

class _PokemonsScreenContentTabletState extends State<PokemonsScreenContentTablet> {
  late PokemonsScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = context.watch<PokemonsScreenNotifier>();

    return PaginationWidget(
       refreshController: sn.refreshController,
      getItems: sn.loadPokemons,
      initialItems: sn.pokemons,
      onDataFetched: sn.onPokemonsListLoaded,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 100.h,
          horizontal: 25.w,
        ),
        itemBuilder: (context, index) {
          return PokemonCardTablet(
            name: provider(context).pokemons[index].name ?? "",
            id: provider(context).pokemons[index].id ?? 0,
            onTap: () => provider(context, listen: false).onPokemonTap(index),
          );
        },
        itemCount: provider(context).pokemons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 20.w),
      ),
    );
  }

  PokemonsScreenNotifier provider(BuildContext context, {bool listen = true}) =>
      Provider.of<PokemonsScreenNotifier>(context, listen: listen);
}
