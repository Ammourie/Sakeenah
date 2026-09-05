import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../constants/app/app_constants.dart';
import '../../providers/internet_provider.dart';
import 'custom_image.dart';

class InternetBanner extends StatelessWidget {
  const InternetBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasInternet = context.select<InternetProvider, bool>(
      (provider) => provider.hasInternet,
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return SizeTransition(
          sizeFactor: animation,
          axisAlignment: 1,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: hasInternet
          ? const SizedBox.shrink(key: ValueKey('internetBannerHidden'))
          : _buildBanner(context),
    );
  }

  Widget _buildBanner(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      key: const ValueKey('internetBannerVisible'),
      color: colorScheme.error,
      elevation: 0,
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      clipBehavior: Clip.antiAlias,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage.asset(
                AppConstants.SVG_ICON_WIFI_OFF,
                width: 20.r,
                height: 20.r,
                color: colorScheme.onError,
              ),
              8.horizontalSpace,
              Flexible(
                child: Text(
                  S.current.internetNotAvailable,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onError,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
