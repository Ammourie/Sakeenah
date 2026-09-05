import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/check_version_param.dart';
import '../entity/version_entity.dart';
import '../repository/imore_repository.dart';

@singleton
class CheckUpdateAppUsecase extends UseCase<VersionEntity, CheckVersionParam> {
  final IMoreRepository repository;

  CheckUpdateAppUsecase(this.repository);

  @override
  Future<Result<AppErrors, VersionEntity>> call(CheckVersionParam params) {
    return repository.checkUpdateApp(params);
  }
}
