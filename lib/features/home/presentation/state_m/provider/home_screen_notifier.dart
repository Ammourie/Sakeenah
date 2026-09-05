import 'package:Sakeenah/features/home/presentation/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/models/empty_response.dart';
import '../../../../../core/navigation/nav.dart';
import '../../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../../core/ui/error_ui/error_viewer/snack_bar/errv_snack_bar_options.dart';
import '../../../../../core/ui/show_toast.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/ui/screens/language_screen.dart';
import '../../../../../core/ui/screens/theme_screen.dart';
import '../cubit/home_cubit.dart';

class HomeScreenNotifier extends ScreenNotifier<HomeScreenParam> {
  HomeScreenNotifier(super.param);

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

  void onChangeLanguageTap(BuildContext context) {
    Nav.to(LanguageScreen.routeName, arguments: const LanguageScreenParam());
  }

  void onThemeSwitcherTap(BuildContext context) {
    Nav.to(ThemeScreen.routeName, arguments: const ThemeScreenParam());
  }

  String getHomeScreenTitle(BuildContext context) {
    return S.current.homePage;
  }

  @override
  void closeNotifier() {
    homeCubit.close();
    dispose();
  }

  bool get isLoading => _isLoading;
}
