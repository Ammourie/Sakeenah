import '../../../../core/models/empty_response.dart';
import '../../data/request/param/add_or_update_firebase_token_param.dart';
import '../../data/request/param/change_notification_status_param.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/page_param.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/inotification_remote.dart';
import '../entity/notification_entity.dart';

part 'notification_repository.dart';

abstract class INotificationRepository extends Repository {
	Future<Result<AppErrors, List<NotificationEntity>>> getNotifications(PageParam param);
	Future<Result<AppErrors, EmptyResponse>> changeNotificationStatus(ChangeNotificationStatusParam param);
	Future<Result<AppErrors, EmptyResponse>> addOrUpdateFirebaseToken(AddOrUpdateFirebaseTokenParam param);
}
