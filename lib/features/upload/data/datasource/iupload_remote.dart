import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/api_url.dart';
import '../model/request/upload_file_param.dart';
import '../model/response/url_model.dart';

part 'upload_remote.dart';

abstract class IUploadRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, UrlModel>> uploadFile(UploadFileParam param);
}
