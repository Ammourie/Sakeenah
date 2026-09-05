import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/utils/utils.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/models/empty_response.dart';
import '../../../../../core/navigation/nav.dart';
import '../../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../../core/ui/error_ui/error_viewer/snack_bar/errv_snack_bar_options.dart';
import '../../../../../core/ui/show_toast.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/ui/screens/language_screen.dart';
import '../../screen/comments_screen.dart';
import '../../screen/map_screen.dart';
import '../../screen/people_screen.dart';
import '../cubit/home_cubit.dart';
import 'app_main_screen_notifier.dart';

class HomeScreenNotifier extends ScreenNotifier {
  /// Fields

  final HomeCubit homeCubit = HomeCubit();

  bool _isLoading = false;

  /// Methods

  void homeLoadingStateListener() {
    _isLoading = true;
    notifyListeners();
  }

  void homeLoadedStateListener(EmptyResponse s) {
    "Response Succeeded".logI;
    _isLoading = false;
    CustomToast.show(s.message);
    notifyListeners();
  }

  void homeErrorStateListener(
    BuildContext context,
    AppErrors error,
    VoidCallback callback,
  ) {
    "Response Failed".logI;
    _isLoading = false;

    ErrorViewer.showError(
      context: context,
      error: error,
      callback: callback,
      errorViewerOptions: const ErrVSnackBarOptions(),
    );

    notifyListeners();
  }

  void onLogoutTap(BuildContext context) {
    context.read<AppMainScreenNotifier>().logout();
  }

  void onGetPeopleTap(BuildContext context) {
    Nav.to(PeopleScreen.routeName, arguments: PeopleScreenParam());
  }

  void onGetCommentsTap(BuildContext context) {
    Nav.to(CommentsScreen.routeName, arguments: CommentsScreenParam());
  }

  void onMapTap() {
    Nav.to(MapScreen.routeName, arguments: MapScreenParam());
  }

  void onTestValidatorRequestTap() {
    homeCubit.testValidator();
  }

  void onTestFailurRequestTap() {
    homeCubit.testFailure();
  }

  void onTestSuccessRequestTap() {
    homeCubit.testSuccess();
  }

  void onJustLogTap() {
    "Error message".logE;
    "Debug message".logD;
    "Info message".logI;
    "Warning message".logW;
    CustomToast.show("Look at console");
  }

  void onChangeLanguageTap(BuildContext context) {
    Nav.to(LanguageScreen.routeName, arguments: const LanguageScreenParam());
  }

  void onThemeSwitcherTap(BuildContext context) {
    Utils.changeTheme(context);
  }

  String getHomeScreenTitle(BuildContext context) {
    return S.current.homePage;
  }

  IconData getThemeIcon(BuildContext context) {
    return (Theme.of(context).brightness) == Brightness.light
        ? Icons.nightlight_round_outlined
        : Icons.wb_sunny_outlined;
  }

  @override
  void closeNotifier() {
    homeCubit.close();
    this.dispose();
  }

  /// Getters and Setters

  get isLoading => this._isLoading;
}
