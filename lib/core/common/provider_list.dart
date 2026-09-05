import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../localization/localization_provider.dart';
import '../providers/internet_provider.dart';
import '../providers/theme_mode_provider.dart';

/// Centralizing all app providers in one class to be easy to adjust and read
class ApplicationProvider {
  static ApplicationProvider _instance = ApplicationProvider._init();

  factory ApplicationProvider() => _instance;

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];

  List<SingleChildWidget> dependItems = [
    /// Change notifier provider
    ChangeNotifierProvider.value(value: LocalizationProvider()),

    ChangeNotifierProvider(create: (_) => ThemeModeProvider()..load()),

    ChangeNotifierProvider(create: (_) => InternetProvider(), lazy: false),
  ];

  List<SingleChildWidget> uiChangesItems = [];

  void dispose(BuildContext context) {
    context.read<LocalizationProvider>().dispose();
    context.read<ThemeModeProvider>().dispose();
    context.read<InternetProvider>().dispose();
  }
}
