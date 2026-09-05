import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/profile_entity.dart';
import '../repository/iaccount_repository.dart';

@injectable
class GetProfileUsecase extends UseCase<ProfileEntity, NoParams> {
  final IAccountRepository accountRepository;

  GetProfileUsecase(this.accountRepository);

  @override
  Future<Result<AppErrors, ProfileEntity>> call(NoParams params) async =>
      await accountRepository.profile(params);
}
