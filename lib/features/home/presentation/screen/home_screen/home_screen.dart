import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
  final provider = HomeScreenNotifier();
  @override
  void initState() {
    super.initState();
   
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
          state.when(
            homeInitState: () {},
            homeLoadingState: provider.homeLoadingStateListener,
            homeLoadedState: (s) {
              provider.homeLoadedStateListener(s);
            },
            homeErrorState: (error, callback) {
              provider.homeErrorStateListener(context, error, callback);
            },
            peopleListLoadedState: (data) {},
            commentsLoadedState: (_) {},
          );
        },
        child: const HomeScreenContent(),
      ),
    );
  }

  /// Widget

  /// Logic

}
