import 'package:flutter/cupertino.dart';

abstract class ScreenNotifier<T> extends ChangeNotifier {
  ScreenNotifier(this.param);
  final T param;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  /// Use this function to dispose the notifier and any other streams
  void closeNotifier();
}
