import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/account/presentation/state_m/cubit/account_cubit.dart';
import '../localization/localization_provider.dart';
import '../providers/session_data.dart';

/// Centralizing all app providers in one class to be easy to adjust and read
class ApplicationProvider {
  static ApplicationProvider _instance = ApplicationProvider._init();

  factory ApplicationProvider() => _instance;

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];

  List<SingleChildWidget> dependItems = [
    /// Change notifier provider
    ChangeNotifierProvider.value(value: LocalizationProvider()),

    ChangeNotifierProvider(create: (_) => SessionData(), lazy: true),

    BlocProvider(
      create: (context) => AccountCubit(),
      lazy: true,
    ),
  ];

  List<SingleChildWidget> uiChangesItems = [];

  void dispose(BuildContext context) {
    context.read<LocalizationProvider>().dispose();
    context.read<SessionData>().dispose();
    context.read<AccountCubit>().close();
  }
}
