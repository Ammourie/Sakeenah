import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../di/service_locator.dart';
import '../../features/account/presentation/screen/login_screen.dart';
import '../../features/account/presentation/screen/register_screen.dart';
import '../../features/chat/presentation/screen/chat_details/chat_details_screen.dart';
import '../../features/chat/presentation/screen/chat_list/chat_list_screen.dart';
import '../../features/home/presentation/screen/app_main_screen/app_main_screen.dart';
import '../../features/home/presentation/screen/comments_screen.dart';
import '../../features/home/presentation/screen/home_screen/home_screen.dart';
import '../../features/home/presentation/screen/map_screen.dart';
import '../../features/home/presentation/screen/people_screen.dart';
import '../../features/notification/presentation/screen/notifications/notifications_screen.dart';
import '../../features/pokemon/presentation/screen/pokemons_screen/pokemns_screen.dart';
import '../constants/enums/route_type.dart';
import '../ui/screens/base_screen.dart';
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
      case LoginScreen.routeName:
        return _getRoute<LoginScreenParam>(
          settings: settings,
          createScreen: (param) => LoginScreen(param: param),
        );
      case RegisterScreen.routeName:
        return _getRoute<RegisterScreenParam>(
          settings: settings,
          createScreen: (param) => RegisterScreen(param: param),
          type: RouteType.ANIMATED,
        );
      case NotificationsScreen.routeName:
        return _getRoute<NotificationsScreenParam>(
          settings: settings,
          createScreen: (param) => NotificationsScreen(param: param),
        );
      case HomeScreen.routeName:
        return _getRoute<HomeScreenParam>(
          settings: settings,
          createScreen: (param) => HomeScreen(param: param),
        );
      case PeopleScreen.routeName:
        return _getRoute<PeopleScreenParam>(
          settings: settings,
          createScreen: (param) => PeopleScreen(param: param),
        );
      case PokemonsScreen.routeName:
        return _getRoute<PokemonsScreenParam>(
          settings: settings,
          createScreen: (param) => PokemonsScreen(param: param),
        );
      case CommentsScreen.routeName:
        return _getRoute<CommentsScreenParam>(
          settings: settings,
          createScreen: (param) => CommentsScreen(param: param),
        );
      case MapScreen.routeName:
        return _getRoute<MapScreenParam>(
          settings: settings,
          createScreen: (param) => MapScreen(param: param),
        );
      case ChatListScreen.routeName:
        return _getRoute<ChatListScreenParam>(
          settings: settings,
          createScreen: (param) => ChatListScreen(param: param),
        );
      case ChatDetailsScreen.routeName:
        return _getRoute<ChatDetailsScreenParam>(
          settings: settings,
          createScreen: (param) => ChatDetailsScreen(param: param),
        );
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

  Route<dynamic> _errorRoute({bool argumentError = false}) {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(
            getIt<NavigationService>().getNavigationKey.currentContext!,
          ).scaffoldBackgroundColor,
          appBar: AppBar(title: const Text('Error')),
          body: Center(
            child: Text(
              argumentError
                  ? 'ROUTE ERROR CHECK ARGUMENT THAT PASSED TO THIS SCREEN.'
                  : 'ROUTE ERROR CHECK THE ROUTE GENERATOR.',
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
