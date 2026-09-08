import 'package:Sakeenah/core/ui/widgets/waiting_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/providers/countries_session_provider.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/screen/app_main_screen/app_main_screen.dart';
import '../../../../core/ui/widgets/app_wallpaper.dart';
import '../../../../core/ui/widgets/themed_system_overlay.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const _typewriterCharDuration = Duration(milliseconds: 60);
  static const _splashMessageHoldDuration = Duration(milliseconds: 1200);

  @override
  void initState() {
    super.initState();
    final splashStayDuration = _calculateSplashStayDuration();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<CountriesSessionProvider>().prefetchCountries();
    });
    Future.delayed(splashStayDuration, _goToMain);
  }

  void _goToMain() {
    if (!mounted) return;
    Nav.off(AppMainScreen.routeName, arguments: AppMainScreenParam());
  }

  Duration _calculateSplashStayDuration() {
    final message = S.current.splashExamMessage.trim();
    final typingDuration = _typewriterCharDuration * message.runes.length;
    return typingDuration + _splashMessageHoldDuration;
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
            const AppWallpaper(),
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
                  16.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          S.current.splashExamMessage,
                          speed: _typewriterCharDuration,
                          textAlign: TextAlign.center,
                          textStyle: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  32.verticalSpace,
                  SizedBox(width: 50.r, height: 28.r, child: const WaitingWidget()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
