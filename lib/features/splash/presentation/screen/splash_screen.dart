import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/local_storage.dart';
import '../../../../core/constants/app/app_settings.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/providers/session_data.dart';
import '../../../../core/ui/custom_map/logic/location_wrapper.dart';
import '../../../../core/ui/dialogs/update_app_dialog.dart';
import '../../../../core/ui/error_ui/error_viewer/dialog/errv_dialog_options.dart';
import '../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../generated/l10n.dart';
import '../../../account/presentation/screen/login_screen.dart';
import '../../../home/presentation/screen/app_main_screen/app_main_screen.dart';
import '../../../more/domain/entity/version_entity.dart';
import '../cubit/splash_cubit.dart';
import 'splash_screen_content.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashCubit = SplashCubit();
  bool canGo = false;
  VersionEntity? versionInfo;

  @override
  void initState() {
    super.initState();
    splashCubit.getSplash();
    print('LocalStorage.authToken: ${LocalStorage.authToken}');
    print('LocalStorage.refreshToken: ${LocalStorage.refreshToken}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        bloc: splashCubit,
        listener: (context, state) {
          state.map(
            initial: (e) {},
            loading: (e) {},
            loaded: (s) => _splashScreenLoaded(context, s),
            error: (e) => _handleSplashError(context, e),
          );
        },
        child: SplashScreenContent(
          onAnimationFinished: () {
            if (canGo)
              outFromSplash();
            else
              canGo = true;
          },
        ),
      ),
    );
  }

  void _handleSplashError(BuildContext context, ErrorState errorState) {
    ErrorViewer.showError(
      context: context,
      error: errorState.error,
      callback: errorState.callback,
      errorViewerOptions: ErrVDialogOptions(
        isDismissible: false,
        cancelOptions: ErrVButtonOptions(
          buttonText: S.current.closeApp,
          onBtnPressed: (context) {
            SystemNavigator.pop();
          },
        ),
      ),
    );
  }

  void _splashScreenLoaded(BuildContext context, LoadedState state) async {
    versionInfo = state.splashEntity.version;
    context.read<SessionData>().profile = state.splashEntity.profile;

    if (canGo) {
      outFromSplash();
    } else {
      canGo = true;
    }
  }

  void outFromSplash() async {
    final isForce = AppSettings.forceLocationPermission;
    if (isForce) {
      await LocationWrapper.singleton().checkLocationPermissions(
        isForce: isForce,
      );
    }

    handleNavigation();
  }

  void handleNavigation() async {
    if (LocalStorage.hasToken)
      Nav.off(AppMainScreen.routeName, arguments: AppMainScreenParam());
    else
      Nav.off(LoginScreen.routeName, arguments: LoginScreenParam());

    // Check if there is a new version.
    if (versionInfo?.needUpdate ?? false)
      showUpdateAppDialog(versionInfo!.forceUpdate, versionInfo!.appLink);
  }

  @override
  void dispose() {
    splashCubit.close();
    super.dispose();
  }
}
