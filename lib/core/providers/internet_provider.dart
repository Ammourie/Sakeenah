import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetProvider extends ChangeNotifier {
  InternetProvider() {
    _subscription = InternetConnection().onStatusChange.listen(
      _onStatusChange,
    );
  }

  /// fields
  bool _hasInternet = true;
  late final StreamSubscription<InternetStatus> _subscription;

  /// getters
  bool get hasInternet => _hasInternet;

  /// methods
  void _onStatusChange(InternetStatus status) {
    final hasInternet = status == InternetStatus.connected;
    if (hasInternet == _hasInternet) return;

    _hasInternet = hasInternet;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
