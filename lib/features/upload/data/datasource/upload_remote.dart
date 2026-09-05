part of 'iupload_remote.dart';

@Singleton(as: IUploadRemoteSource)
class UploadRemoteSource extends IUploadRemoteSource {
  @override
  Future<Either<AppErrors, UrlModel>> uploadFile(UploadFileParam param) async {
    return requestUploadFile(
      converter: (json) => UrlModel.fromMap(json),
      url: APIUrls.API_CREATE_ATTACHMENT,
      fileKey: 'file',
      filePath: param.imageUrl,
      onReceiveProgress: param.onReceiveProgress,
      onSendProgress: param.onSendProgress,
      data: param.toMap(),
    );
  }
}
