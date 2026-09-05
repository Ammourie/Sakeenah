import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/resend_code_param.dart';
import '../repository/iaccount_repository.dart';

@injectable
class ResendCodeUsecase extends UseCase<EmptyResponse, ResendCodeParam> {
  final IAccountRepository accountRepository;

  ResendCodeUsecase(this.accountRepository);

  @override
  Future<Result<AppErrors, EmptyResponse>> call(ResendCodeParam params) async =>
      await accountRepository.resendCode(params);
}
