import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/page_param.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/notification_entity.dart';
import '../repository/inotification_repository.dart';

@singleton
class GetNotificationsUsecase
    extends UseCase<List<NotificationEntity>, PageParam> {
  final INotificationRepository repository;

  GetNotificationsUsecase(this.repository);

  @override
  Future<Result<AppErrors, List<NotificationEntity>>> call(
      PageParam param) async {
    return await repository.getNotifications(param);
  }
}
