import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../core/params/page_param.dart';
import '../../../../../core/ui/screens/empty_screen_wiget.dart';
import '../../../../../core/ui/widgets/custom_list_tile.dart';
import '../../../../../core/ui/widgets/pagination_widget.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/usecase/get_notifications_usecase.dart';
import '../../state_m/provider/notifications_screen_notifier.dart';

class NotificationsScreenContent extends StatefulWidget {
  const NotificationsScreenContent({Key? key}) : super(key: key);
  @override
  State<NotificationsScreenContent> createState() =>
      _NotificationsScreenContentState();
}

class _NotificationsScreenContentState
    extends State<NotificationsScreenContent> {
  late NotificationsScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.watch<NotificationsScreenNotifier>();
    sn.context = context;

    return sn.notifications.isEmpty
        ? _buildEmptyScreen()
        : _buildPaginationWidget();
  }

  Widget _buildEmptyScreen() {
    return EmptyScreenWidget(
      title: S.current.noNotifications,
      buttonText: S.current.refresh,
      onButtonPressed: () => sn.getNotifications(),
    );
  }

  Widget _buildPaginationWidget() {
    return PaginationWidget(
      refreshController: sn.refreshController,
      initialItems: sn.notifications,
      onDataFetched: (data, _) => sn.notifications = data,
      getItems: (page) {
        return getIt<GetNotificationsUsecase>()(PageParam(page: page));
      },
      child: ListView.separated(
        itemCount: sn.notifications.length,
        itemBuilder: (context, index) {
          return _buildNotificationItem(index);
        },
        separatorBuilder: (_, __) => 10.verticalSpace,
      ),
    );
  }

  CustomListTile _buildNotificationItem(int index) {
    return CustomListTile(
      onTap: () => sn.onNotificationTap(index),
      padding: const EdgeInsets.all(16),
      title: Text(
        sn.notifications[index].title,
      ),
      titleSubtitleSpacing: 8,
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sn.notifications[index].description,
          ),
          8.verticalSpace,
          if (sn.notifications[index].createDate != null)
            Text(
              DateFormat('d EEE').format(sn.notifications[index].createDate!),
              style: const TextStyle(fontSize: 12.0),
            )
        ],
      ),
    );
  }
}
