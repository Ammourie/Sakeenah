import 'package:flutter/material.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../screen/app_main_screen/app_main_screen.dart';

class AppMainScreenNotifier extends ScreenNotifier<AppMainScreenParam> {
  /// Constructors
  AppMainScreenNotifier(super.param);

  /// Fields
  late BuildContext context;
  bool _isLoading = false;

  /// Getters and Setters
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void closeNotifier() {
    dispose();
  }
}
