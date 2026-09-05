import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/error_ui/errors_screens/error_widget.dart';
import '../../../../core/ui/screens/base_screen.dart';
import '../../../../core/ui/widgets/waiting_widget.dart';
import '../state_m/cubit/home_cubit.dart';
import 'comments_screen_content.dart';

class CommentsScreenParam {}

class CommentsScreen extends BaseScreen<CommentsScreenParam> {
  static const String routeName = "CommentsScreen/";

  const CommentsScreen({Key? key, required CommentsScreenParam param})
      : super(key: key, param: param);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final _homeCubit = HomeCubit();

  @override
  void initState() {
    _homeCubit.getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit,
        builder: (context, state) {
          return state.map(
            homeInitState: buildHomeInitState,
            homeLoadingState: buildHomeLoadingState,
            homeLoadedState: buildHomeLoadedState,
            homeErrorState: buildHomeErrorState,
            peopleListLoadedState: (_) =>
                const ScreenNotImplementedErrorWidget(),
            commentsLoadedState: _buildComments,
          );
        },
      ),
    );
  }

  Widget buildHomeInitState(HomeInitState state) {
    return const WaitingWidget();
  }

  Widget buildHomeLoadedState(HomeLoadedState state) {
    return const ScreenNotImplementedErrorWidget();
  }

  Widget buildHomeLoadingState(HomeLoadingState state) {
    return const WaitingWidget();
  }

  Widget buildHomeErrorState(HomeErrorInitState state) {
    return ErrorScreenWidget(error: state.error, callback: state.callback);
  }

  Widget _buildComments(CommentsLoadedState value) {
    return CommentsScreenContent(
      comments: value.comments,
    );
  }

  @override
  void dispose() {
    _homeCubit.close();
    super.dispose();
  }
}
