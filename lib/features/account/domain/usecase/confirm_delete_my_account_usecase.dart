import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/confirm_delete_my_account_param.dart';
import '../repository/iaccount_repository.dart';

@injectable
class ConfirmDeleteMyAccountUsecase
    extends UseCase<EmptyResponse, ConfirmDeleteMyAccountParam> {
  final IAccountRepository accountRepository;

  ConfirmDeleteMyAccountUsecase(this.accountRepository);

  @override
  Future<Result<AppErrors, EmptyResponse>> call(
    ConfirmDeleteMyAccountParam params,
  ) async => await accountRepository.confirmDeleteMyAccount(params);
}
