part of 'inotification_repository.dart';

@Singleton(as: INotificationRepository)
class NotificationRepository extends INotificationRepository {
  final INotificationRemoteSource remoteDataSource;

  NotificationRepository(this.remoteDataSource);

	@override
	Future<Result<AppErrors, List<NotificationEntity>>> getNotifications(PageParam param) async {
		return executeForList(
			remoteResult: await remoteDataSource.getNotifications(param),
		);
	}

	@override
	Future<Result<AppErrors, EmptyResponse>> changeNotificationStatus(ChangeNotificationStatusParam param) async {
		return executeForNoEntity(
			remoteResult: await remoteDataSource.changeNotificationStatus(param),
		);
	}

	@override
	Future<Result<AppErrors, EmptyResponse>> addOrUpdateFirebaseToken(AddOrUpdateFirebaseTokenParam param) async {
		return executeForNoEntity(
			remoteResult: await remoteDataSource.addOrUpdateFirebaseToken(param),
		);
	}
}
