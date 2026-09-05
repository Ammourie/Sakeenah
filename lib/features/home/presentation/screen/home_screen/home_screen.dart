import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import '../../../../../core/providers/internet_provider.dart';

import '../../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
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

  @override
  void initState() {
    super.initState();

    provider = HomeScreenNotifier(widget.param);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    provider.getPrayerTimes(
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
    return ChangeNotifierProvider<HomeScreenNotifier>.value(
      value: provider,
      child: BlocListener<HomeCubit, HomeState>(
        bloc: provider.homeCubit,
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            homeInitState: () {},
            homeLoadingState: () {
              provider.isLoading = true;
            },
            homeLoadedState: (s) {
              provider.isLoading = false;
            },
            homeErrorState: (error, callback) {
              provider.isLoading = false;
              ErrorViewer.showError(
                context: context,
                error: error,
                callback: callback,
              );
            },
          );
        },

        child: const HomeScreenContent(),
      ),
    );
  }
}
