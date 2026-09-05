import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/models/empty_response.dart';
import '../../data/request/param/add_or_update_firebase_token_param.dart';
import '../repository/inotification_repository.dart';

@singleton
class AddOrUpdateFirebaseTokenUsecase extends UseCase<EmptyResponse, AddOrUpdateFirebaseTokenParam> {
	final INotificationRepository repository;

	AddOrUpdateFirebaseTokenUsecase(this.repository);

	@override
	Future<Result<AppErrors, EmptyResponse>> call(AddOrUpdateFirebaseTokenParam param) async {
		return await repository.addOrUpdateFirebaseToken(param);
	}
}
