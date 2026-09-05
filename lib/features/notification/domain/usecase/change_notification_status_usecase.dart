import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/models/empty_response.dart';
import '../../data/request/param/change_notification_status_param.dart';
import '../repository/inotification_repository.dart';

@singleton
class ChangeNotificationStatusUsecase extends UseCase<EmptyResponse, ChangeNotificationStatusParam> {
	final INotificationRepository repository;

	ChangeNotificationStatusUsecase(this.repository);

	@override
	Future<Result<AppErrors, EmptyResponse>> call(ChangeNotificationStatusParam param) async {
		return await repository.changeNotificationStatus(param);
	}
}
