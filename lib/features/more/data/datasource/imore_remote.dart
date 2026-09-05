import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/net/api_url.dart';
import '../request/model/version_model.dart';
import '../request/param/check_version_param.dart';
import '../request/param/report_problem_param.dart';

part 'more_remote.dart';

abstract class IMoreRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, VersionModel>> checkUpdateApp(
      CheckVersionParam param);
  Future<Either<AppErrors, EmptyResponse>> reportProblem(
      ReportProblemParam params);
}
