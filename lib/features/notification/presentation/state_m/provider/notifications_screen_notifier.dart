import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/params/page_param.dart';
import '../../../domain/entity/notification_entity.dart';
import '../../screen/notifications/notifications_screen.dart';
import '../cubit/notification_cubit.dart';

class NotificationsScreenNotifier extends ScreenNotifier {
  /// Constructors
  NotificationsScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final NotificationsScreenParam param;
  final notificationCubit = NotificationCubit();
  final refreshController = RefreshController();

  /// states
  List<NotificationEntity> _notifications = [];

  /// Getters and Setters
  List<NotificationEntity> get notifications => _notifications;
  set notifications(List<NotificationEntity> data) {
    _notifications = data;
    notifyListeners();
  }

  /// Methods
  void getNotifications() {
    notificationCubit.getNotifications(PageParam(page: 0));
  }

  void onNotificationTap(int index){}

  @override
  void closeNotifier() {
    notificationCubit.close();
    refreshController.dispose();
    this.dispose();
  }
}
