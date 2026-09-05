import 'package:flutter/material.dart';

import '../../../../core/constants/app/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonCardTablet extends StatelessWidget {
  final String name;
  final int id;
  final VoidCallback onTap;
  const PokemonCardTablet({
    Key? key,
    required this.name,
    required this.id,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPokemonCard(context);
  }

  Widget _buildPokemonCard(
    BuildContext context,
  ) {
    return InkWell(
      onTap: () => this.onTap.call(),
      child: Card(
        margin: EdgeInsets.zero,
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200.w,
              height: 200.w,
              child: FadeInImage(
                placeholder: const AssetImage(AppConstants.APP_LOGO),
                image: NetworkImage(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/${id}.png",
                ),
                fit: BoxFit.contain,
              ),
            ),
            12.horizontalSpace,
            Flexible(
              child: Text(
                "$name",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
