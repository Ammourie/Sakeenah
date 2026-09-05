import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../providers/internet_provider.dart';

class InternetBanner extends StatelessWidget {
  const InternetBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasInternet = context.select<InternetProvider, bool>(
      (provider) => provider.hasInternet,
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: hasInternet
          ? const SizedBox.shrink(key: ValueKey('internetBannerHidden'))
          : _buildBanner(context),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Material(
      key: const ValueKey('internetBannerVisible'),
      color: Theme.of(context).colorScheme.error,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(
            S.current.internetNotAvailable,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onError,
            ),
          ),
        ),
      ),
    );
  }
}
