import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/ui/widgets/pagination_widget.dart';
import '../../../domain/entity/pokemon_entity/pokemon_entity.dart';
import '../../state_m/provider/pokemons_screen_notifier.dart';
import '../../widget/pokemon_card_mobile.dart';

class PokemonsScreenContentMobile extends StatefulWidget {
  @override
  State<PokemonsScreenContentMobile> createState() => _PokemonsScreenContentMobileState();
}

class _PokemonsScreenContentMobileState extends State<PokemonsScreenContentMobile> {
  late PokemonsScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = context.watch<PokemonsScreenNotifier>();
    return PaginationWidget<PokemonEntity>(
      refreshController: sn.refreshController,
      getItems: sn.loadPokemons,
      initialItems: sn.pokemons,
      onDataFetched: sn.onPokemonsListLoaded,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: 100.h,
            horizontal: 25.w,
          ),
          itemBuilder: (context, index) {
            return PokemonCardMobile(
              id: sn.pokemons[index].id ?? 0,
              name: sn.pokemons[index].name ?? "",
              onTap: () => sn.onPokemonTap(index),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: sn.pokemons.length),
    );
  }
}
