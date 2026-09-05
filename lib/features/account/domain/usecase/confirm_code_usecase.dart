import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/confirm_code_param.dart';
import '../entity/confirm_code_entity.dart';
import '../repository/iaccount_repository.dart';

@injectable
class ConfirmCodeUsecase extends UseCase<ConfirmCodeEntity, ConfirmCodeParam> {
  final IAccountRepository accountRepository;

  ConfirmCodeUsecase(this.accountRepository);

  @override
  Future<Result<AppErrors, ConfirmCodeEntity>> call(
    ConfirmCodeParam params,
  ) async => await accountRepository.confirmCode(params);
}
