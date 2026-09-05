import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/net/create_model_interceptor/primative_create_model_interceptor.dart';
import '../../../../core/params/page_param.dart';
import '../request/model/notification_model.dart';
import '../request/param/add_or_update_firebase_token_param.dart';
import '../request/param/change_notification_status_param.dart';

part 'notification_remote.dart';

abstract class INotificationRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, List<NotificationModel>>> getNotifications(PageParam param);
	Future<Either<AppErrors, EmptyResponse>> changeNotificationStatus(ChangeNotificationStatusParam param);
	Future<Either<AppErrors, EmptyResponse>> addOrUpdateFirebaseToken(AddOrUpdateFirebaseTokenParam param);
}
