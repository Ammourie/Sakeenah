import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/responsive/responsive_utils.dart';
import '../../../../core/ui/widgets/custom_image.dart';

class PokemonCardMobile extends StatelessWidget {
  final String name;
  final int id;
  final VoidCallback onTap;
  const PokemonCardMobile({
    Key? key,
    required this.name,
    required this.id,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPokemonCard(
      context,
    );
  }

  Widget _buildPokemonCard(
    BuildContext context,
  ) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: () => this.onTap.call(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getValueForOrientation(context,
                  portrait: 250.w, landscape: 150.w),
              height: getValueForOrientation(context,
                  portrait: 250.w, landscape: 150.w),
              padding: const EdgeInsets.all(20),
              child: CustomImage.network(
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/${id}.png",
                shimmerBaseColor: Colors.grey,
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
