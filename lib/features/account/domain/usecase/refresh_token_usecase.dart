import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/refresh_token_param.dart';
import '../entity/refresh_token_entity.dart';
import '../repository/iaccount_repository.dart';

@singleton
class RefreshTokenUsecase
    extends UseCase<RefreshTokenEntity, RefreshTokenParam> {
  final IAccountRepository iAccountRepository;
  RefreshTokenUsecase(this.iAccountRepository);
  @override
  Future<Result<AppErrors, RefreshTokenEntity>> call(
    RefreshTokenParam params,
  ) => iAccountRepository.refreshToken(params);
}
