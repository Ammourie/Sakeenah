import 'package:dio/dio.dart';

import '../../../../../core/constants/enums/attachment_type.dart';
import '../../../../../core/constants/enums/create_attachment_type.dart';
import '../../../../../core/params/base_params.dart';

class UploadFileParam extends BaseParams {
  final String imageUrl;
  final String name;
  final ProgressCallback onSendProgress;
  final ProgressCallback onReceiveProgress;
  final CreateAttachmentType attachmentType;
  final AttachmentType fileType;

  UploadFileParam({
    required this.imageUrl,
    required this.name,
    required this.onSendProgress,
    required this.onReceiveProgress,
    required this.attachmentType,
    required this.fileType,
  });

  @override
  Map<String, dynamic> toMap() => {
    'name': name,
    'attachmentType': attachmentType.mapToInt,
    'fileType': fileType.mapToInt,
  };
}
