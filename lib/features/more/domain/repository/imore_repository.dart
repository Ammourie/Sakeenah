import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/imore_remote.dart';
import '../../data/request/param/check_version_param.dart';
import '../../data/request/param/report_problem_param.dart';
import '../entity/version_entity.dart';

part 'more_repository.dart';

abstract class IMoreRepository extends Repository {
  Future<Result<AppErrors, VersionEntity>> checkUpdateApp(
      CheckVersionParam param);
  Future<Result<AppErrors, EmptyResponse>> reportProblem(
      ReportProblemParam params);
}
