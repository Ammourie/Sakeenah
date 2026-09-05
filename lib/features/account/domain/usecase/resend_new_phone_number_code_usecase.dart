import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/iaccount_repository.dart';

@injectable
class ResendNewPhoneNumberCodeUsecase extends UseCase<EmptyResponse, NoParams> {
  final IAccountRepository accountRepository;

  ResendNewPhoneNumberCodeUsecase(this.accountRepository);

  @override
  Future<Result<AppErrors, EmptyResponse>> call(NoParams params) async =>
      await accountRepository.resendNewPhoneNumberCode(params);
}
