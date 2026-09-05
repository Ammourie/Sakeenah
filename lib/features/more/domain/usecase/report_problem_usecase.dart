import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/report_problem_param.dart';
import '../repository/imore_repository.dart';

@injectable
class ReportProblemUsecase extends UseCase<EmptyResponse, ReportProblemParam> {
  final IMoreRepository repository;

  ReportProblemUsecase(this.repository);

  @override
  Future<Result<AppErrors, EmptyResponse>> call(ReportProblemParam params) =>
      repository.reportProblem(params);
}
