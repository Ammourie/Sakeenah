import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/upload_file_param.dart';
import '../entity/url_entity.dart';
import '../repository/iupload_repository.dart';

@singleton
class UploadFileUsecase extends UseCase<UrlEntity, UploadFileParam> {
  final IUploadRepository iUploadRepository;

  UploadFileUsecase(this.iUploadRepository);

  @override
  Future<Result<AppErrors, UrlEntity>> call(UploadFileParam params) async {
    return await iUploadRepository.uploadFile(params);
  }
}
