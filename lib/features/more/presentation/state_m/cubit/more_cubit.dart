import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/request/param/check_version_param.dart';
import '../../../data/request/param/report_problem_param.dart';
import '../../../domain/entity/version_entity.dart';
import '../../../domain/usecase/check_update_app_usecase.dart';
import '../../../domain/usecase/report_problem_usecase.dart';

part 'more_cubit.freezed.dart';
part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(const MoreState.moreInit());

  void checkUpdateApp(CheckVersionParam param) async {
    emit(const MoreState.moreLoading());

    final result = await getIt<CheckUpdateAppUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(MoreState.checkUpdateAppLoaded(data: data));
      },
      onError: (error) {
        emit(MoreState.moreError(error, () => checkUpdateApp(param)));
      },
    );
  }

  void reportProblem(ReportProblemParam params) async {
    emit(const MoreState.moreLoading());
    final result = await getIt<ReportProblemUsecase>()(params);

    result.pick(
      onData: (data) {
        emit(const MoreState.successReportProblem());
      },
      onError: (error) {
        emit(
          MoreState.moreError(
            error,
            () => reportProblem(params),
          ),
        );
      },
    );
  }
}
