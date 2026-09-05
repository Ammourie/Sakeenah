import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/screen/map_screen.dart';
import '../../features/notification/presentation/screen/notifications/notifications_screen.dart';
import '../../features/pokemon/presentation/screen/pokemons_screen/pokemns_screen.dart';
import '../navigation/nav.dart';
import 'deep_links_test_page.dart';

class AppLinksManager {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  AppLinksManager() {
    _appLinks = AppLinks();
  }
  Future<void> handleAppLinks() async {
    /// this two lines nedded in case the app was teminated
    Uri? uri = await _appLinks.getInitialLink();
    if (uri != null) _openAppLink(uri);

    // Handle links
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      _openAppLink(uri);
    });
  }

  String getRouteNameFromHost(String route) {
    return route.substring(1).toLowerCase();
  }

  /// here you navigate into new screen depending on uri
  void _openAppLink(Uri uri) {
    debugPrint('deep link uri: $uri');
    debugPrint('deep link uri host: ${uri.host}');

    final routeHost = uri.host.toLowerCase();

    if (routeHost == getRouteNameFromHost(NotificationsScreen.routeName)) {
      Nav.to(
        NotificationsScreen.routeName,
        arguments: NotificationsScreenParam(),
      );
    } else if (routeHost == getRouteNameFromHost(MapScreen.routeName)) {
      Nav.to(MapScreen.routeName, arguments: MapScreenParam());
    } else if (routeHost == getRouteNameFromHost(PokemonsScreen.routeName)) {
      Nav.to(PokemonsScreen.routeName, arguments: PokemonsScreenParam());
    } else {
      Nav.to(
        DeepLinksTestPage.routeName,
        arguments: DeepLinksTestPageParam(
          deepLink: uri.toString(),
          arguments: uri.queryParameters,
        ),
      );
    }
  }

  void close() {
    _linkSubscription?.cancel();
  }
}
