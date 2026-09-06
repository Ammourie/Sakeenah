import 'package:Sakeenah/core/ui/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/providers/countries_session_provider.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/screen/app_main_screen/app_main_screen.dart';
import '../../../../core/ui/widgets/onboarding_wallpaper.dart';
import '../../../../core/ui/widgets/themed_system_overlay.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<CountriesSessionProvider>().prefetchCountries();
    });
    Future.delayed(const Duration(milliseconds: 2200), _goToMain);
  }

  void _goToMain() {
    if (!mounted) return;
    Nav.off(AppMainScreen.routeName, arguments: AppMainScreenParam());
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ThemedSystemOverlay(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const OnboardingWallpaper(),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppConstants.mainImageForTheme(Theme.of(context).brightness),
                    width: 150.r,
                    height: 150.r,
                    fit: BoxFit.contain,
                  ),
                  24.verticalSpace,
                  Text(
                    S.current.appName,
                    style: textTheme.headlineSmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  32.verticalSpace,
                  SizedBox(width: 50.r, height: 28.r, child: WaitingWidget()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
