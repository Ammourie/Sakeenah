part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.notificationInit() = NotificationInitState;

  const factory NotificationState.notificationLoading() =
      NotificationLoadingState;

  const factory NotificationState.notificationError(
    AppErrors error,
    VoidCallback callback,
  ) = NotificationErrorState;

  const factory NotificationState.notificationsLoaded(
    List<NotificationEntity> notificationEntity,
  ) = NotificationsLoadedState;

  const factory NotificationState.successChangeNotificationStatus() =
      SuccessChangeNotificationStatusState;
}
