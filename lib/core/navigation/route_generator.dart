import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../di/service_locator.dart';
import '../../features/home/presentation/screen/app_main_screen/app_main_screen.dart';
import '../../features/home/presentation/screen/home_screen/home_screen.dart';
import '../../features/prayer_times/presentation/screen/map_location_picker_screen.dart';
import '../constants/enums/route_type.dart';
import '../ui/screens/base_screen.dart';
import '../ui/screens/language_screen.dart';
import '../ui/screens/theme_screen.dart';
import '../ui/widgets/curved_app_bar.dart';
import 'animations/animated_route.dart';
import 'animations/fade_route.dart';
import 'animations/swipeable_page_route.dart';
import 'navigation_service.dart';

@lazySingleton
class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case AppMainScreen.routeName:
        return _getRoute<AppMainScreenParam>(
          settings: settings,
          createScreen: (param) => AppMainScreen(param: param),
        );
      case HomeScreen.routeName:
        return _getRoute<HomeScreenParam>(
          settings: settings,
          createScreen: (param) => HomeScreen(param: param),
        );
      
      case LanguageScreen.routeName:
        return _getRoute<LanguageScreenParam>(
          settings: settings,
          createScreen: (param) => LanguageScreen(param: param),
        );
      case ThemeScreen.routeName:
        return _getRoute<ThemeScreenParam>(
          settings: settings,
          createScreen: (param) => ThemeScreen(param: param),
        );
      case MapLocationPickerScreen.routeName:
        return _getMapLocationPickerRoute(settings);
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  Route _getRoute<ParamType>({
    required RouteSettings settings,
    required BaseScreen createScreen(ParamType param),
    RouteType type = RouteType.FADE,
  }) {
    try {
      final args = settings.arguments;
      if (args != null && args is ParamType) {
        switch (type) {
          case RouteType.FADE:
            return FadeRoute(
              page: createScreen(args as ParamType),
              settings: settings,
            );
          case RouteType.ANIMATED:
            return AnimatedRoute(
              page: createScreen(args as ParamType),
              settings: settings,
            );
          case RouteType.SWIPABLE:
            return SwipeablePageRoute(
              canOnlySwipeFromEdge: true,
              builder: (context) {
                return createScreen(args as ParamType);
              },
              settings: settings,
            );
        }
      }
    } catch (e) {
      return _errorRoute();
    }

    return _errorRoute(argumentError: true);
  }

  Route<MapPickResult> _getMapLocationPickerRoute(RouteSettings settings) {
    final args = settings.arguments;
    if (args is MapLocationPickerScreenParam) {
      return SwipeablePageRoute<MapPickResult>(
        canOnlySwipeFromEdge: true,
        builder: (context) => MapLocationPickerScreen(param: args),
        settings: settings,
      );
    }

    return _errorRoute(argumentError: true) as Route<MapPickResult>;
  }

  Route<dynamic> _errorRoute({bool argumentError = false}) {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(
            getIt<NavigationService>().getNavigationKey.currentContext!,
          ).scaffoldBackgroundColor,
          body: CurvedAppBarLayout(
            appBar: const CurvedAppBar(title: 'Error'),
            body: Center(
              child: Text(
                argumentError
                    ? 'ROUTE ERROR CHECK ARGUMENT THAT PASSED TO THIS SCREEN.'
                    : 'ROUTE ERROR CHECK THE ROUTE GENERATOR.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
