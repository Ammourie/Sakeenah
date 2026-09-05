import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../../../../core/ui/widgets/system/double_tap_back_exit_app.dart';
import '../../../../account/presentation/state_m/cubit/account_cubit.dart';
import '../../state_m/provider/app_main_screen_notifier.dart';
import 'app_main_screen_content.dart';

class AppMainScreenParam {}

class AppMainScreen extends BaseScreen<AppMainScreenParam> {
  static const String routeName = "/AppMainScreenScreen";

  const AppMainScreen({Key? key, required AppMainScreenParam param})
    : super(key: key, param: param);

  @override
  _AppMainScreenState createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  late final AppMainScreenNotifier sn;

  @override
  void initState() {
    super.initState();

    sn = AppMainScreenNotifier(widget.param);

    // Handle initial deep link after first frame
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   DeepLinkService().onMainScreenReady();
    // });
  }

  @override
  void dispose() {
    sn.closeNotifier();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppMainScreenNotifier>.value(
      value: sn,
      builder: (context, child) {
        // listen to isLoading state.
        context.select<AppMainScreenNotifier, bool>((p) => p.isLoading);

        return DoubleTapBackExitApp(
          child: ModalProgressHUD(
            inAsyncCall: sn.isLoading,
            child: BlocListener<AccountCubit, AccountState>(
              bloc: sn.logoutCubit,
              listener: (context, state) {
                state.maybeWhen(
                  accountLoading: () => sn.isLoading = true,
                  accountError: (error, callback) {
                    sn.isLoading = false;
                    ErrorViewer.showError(
                      context: context,
                      error: error,
                      callback: callback,
                    );
                  },
                  successLogout: () {
                    // sn.isLoading = false;
                    // RestartWidget.restartApp(context);
                  },
                  orElse: () {},
                );
              },
              child: const AppMainScreenContent(),
            ),
          ),
        );
      },
    );
  }
}
