import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/model/request/upload_file_param.dart';
import '../../../domain/entity/url_entity.dart';
import '../../../domain/usecase/upload_file_usecase.dart';

part 'upload_cubit.freezed.dart';
part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(const UploadState.uploadInitState());

  void uploadFile(UploadFileParam param) async {
    emit(const UploadState.uploadLoadingState());

    final result = await getIt<UploadFileUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(UploadState.uploadSuccessState(data));
      },
      onError: (error) {
        emit(UploadState.uploadErrorState(error, () {
          uploadFile(param);
        }));
      },
    );
  }
}
