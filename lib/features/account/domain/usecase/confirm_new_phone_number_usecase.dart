import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/confirm_new_phone_number_param.dart';
import '../repository/iaccount_repository.dart';

@injectable
class ConfirmNewPhoneNumberUsecase
    extends UseCase<EmptyResponse, ConfirmNewPhoneNumberParam> {
  final IAccountRepository accountRepository;

  ConfirmNewPhoneNumberUsecase(this.accountRepository);

  @override
  Future<Result<AppErrors, EmptyResponse>> call(
    ConfirmNewPhoneNumberParam params,
  ) async => await accountRepository.confirmNewPhoneNumber(params);
}
