import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/iupload_remote.dart';
import '../../data/model/request/upload_file_param.dart';
import '../../data/model/response/url_model.dart';
import '../entity/url_entity.dart';

part '../../data/repository/upload_repository.dart';

abstract class IUploadRepository extends Repository {
  Future<Result<AppErrors, UrlEntity>> uploadFile(UploadFileParam param);
}
