import '../../../domain/usecase/change_notification_status_usecase.dart';
import '../../../data/request/param/change_notification_status_param.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/params/page_param.dart';
import '../../../../../di/service_locator.dart';
import '../../../domain/entity/notification_entity.dart';
import '../../../domain/usecase/get_notifications_usecase.dart';

part 'notification_cubit.freezed.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState.notificationInit());

  void getNotifications(PageParam param) async {
    emit(const NotificationState.notificationLoading());

    final result = await getIt<GetNotificationsUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(NotificationState.notificationsLoaded(data));
      },
      onError: (error) {
        emit(NotificationState.notificationError(
            error, () => getNotifications(param)));
      },
    );
  }

	void changeNotificationStatus(ChangeNotificationStatusParam param) async {
		emit(const NotificationState.notificationLoading());

		final result = await getIt<ChangeNotificationStatusUsecase>()(param);

		result.pick(
			onData: (data) {
				emit(const NotificationState.successChangeNotificationStatus());
			},
			onError: (error) {
				emit(NotificationState.notificationError(error, () => changeNotificationStatus(param)));
			},
		);
	}
}
