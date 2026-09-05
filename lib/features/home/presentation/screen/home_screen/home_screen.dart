import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import '../../../../../core/providers/internet_provider.dart';

import '../../../../../core/localization/localization_provider.dart';

import '../../../../../core/ui/screens/base_screen.dart';

import '../../state_m/cubit/home_cubit.dart';

import '../../state_m/provider/home_screen_notifier.dart';

import 'home_screen_content.dart';

class HomeScreenParam {}

class HomeScreen extends BaseScreen<HomeScreenParam> {
  static const routeName = "/HomeScreen";

  HomeScreen({required HomeScreenParam param, Key? key})
    : super(param: param, key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenNotifier provider;
  String? _trackedLanguageCode;

  @override
  void initState() {
    super.initState();

    provider = HomeScreenNotifier(widget.param);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    provider.initializePrayerTimes(
      hasInternet: context.read<InternetProvider>().hasInternet,
    );
  }

  @override
  void dispose() {
    provider.closeNotifier();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = context.watch<LocalizationProvider>().currentLanguage;
    if (_trackedLanguageCode != null &&
        _trackedLanguageCode != languageCode) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        provider.refreshPlaceLabelForCurrentLocale();
      });
    }
    _trackedLanguageCode = languageCode;

    return ChangeNotifierProvider<HomeScreenNotifier>.value(
      value: provider,

      child: BlocListener<HomeCubit, HomeState>(
        bloc: provider.homeCubit,

        listener: (context, state) {
          state.when(
            homeInitState: () {},

            homeLoadingState: provider.homeLoadingStateListener,

            homeLoadedState: (s) {
              provider.homeLoadedStateListener(s);
            },

            homeErrorState: (error, callback) {
              provider.homeErrorStateListener(context, error, callback);
            },
          );
        },

        child: const HomeScreenContent(),
      ),
    );
  }
}
