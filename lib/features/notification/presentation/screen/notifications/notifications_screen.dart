import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/ui/error_ui/errors_screens/error_widget.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../../../../core/ui/widgets/custom_scaffold.dart';
import '../../../../../core/ui/widgets/waiting_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../state_m/cubit/notification_cubit.dart';
import '../../state_m/provider/notifications_screen_notifier.dart';
import 'notifications_screen_content.dart';

class NotificationsScreenParam {}

class NotificationsScreen extends BaseScreen<NotificationsScreenParam> {
  static const String routeName = "/NotificationsScreen";

  const NotificationsScreen({
    Key? key,
    required NotificationsScreenParam param,
  }) : super(key: key, param: param);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late final NotificationsScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = NotificationsScreenNotifier(widget.param);

    sn.getNotifications();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotificationsScreenNotifier>.value(
      value: sn,
      child: CustomScaffold(
        appBar: AppBar(title: Text(S.current.notifications)),
        body: BlocConsumer<NotificationCubit, NotificationState>(
          bloc: sn.notificationCubit,
          listener: (_, state) {
            state.maybeWhen(
              notificationsLoaded: (data) => sn.notifications = data,
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              notificationLoading: () => const WaitingWidget(),
              notificationError: (error, callback) =>
                  ErrorScreenWidget(error: error, callback: callback),
              notificationsLoaded: (_) => const NotificationsScreenContent(),
              orElse: () => const ScreenNotImplementedErrorWidget(),
            );
          },
        ),
      ),
    );
  }
}
