import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/common/local_storage.dart';
import '../../../../core/common/utils/cubit_utils.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../di/service_locator.dart';
import '../../../account/domain/entity/profile_entity.dart';
import '../../../account/domain/usecase/get_profile_usecase.dart';
import '../../domain/entity/splash_entity.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  void getSplash({CancelToken? cancelToken}) async {
    emit(const SplashState.loading());

    if (!LocalStorage.hasToken) {
      emit(SplashState.loaded(SplashEntity(profile: null)));
      return;
    }

    final List<Result> results = await Future.wait([
      getIt<GetProfileUsecase>()(NoParams()),
    ]);
    final error = CubitUtils.checkError(results);

    if (error != null) {
      emit(SplashState.error(error: error, callback: () => this.getSplash()));
    } else {
      emit(
        SplashState.loaded(
          SplashEntity(profile: results[0].data as ProfileEntity?),
        ),
      );
    }
  }

  // TODO Uncomment this
  // void _handleNotAuthenticatedRequests(
  //     List<Result<AppErrors, Object>> result) async {
  //   if (result[0].hasErrorOnly || result[1].hasErrorOnly) {
  //     emit(SplashState.error(
  //       error: result[0].hasErrorOnly ? result[0].error! : result[1].error!,
  //       callback: () => this.getHomeInitAndProfile(),
  //     ));
  //   } else {
  //     if (int.parse(AppConfig().buildNumber!) <
  //         ((result[1].data as AppUpdateEntity?)?.result?.lastSupportedVersion ??
  //             -1)) {
  //       emit(
  //         SplashState.needUpdateError(
  //           appLink:
  //               (result[1].data as AppUpdateEntity?)?.result?.appLink ?? '',
  //         ),
  //       );
  //     } else {
  //       emit(
  //         SplashState.loaded(
  //           customersTypes: [],
  //           checkAppVersion: int.parse(AppConfig().buildNumber!) <
  //                   ((result[1].data as AppUpdateEntity?)
  //                           ?.result
  //                           ?.lastVersion ??
  //                       -1)
  //               ? result[1].data as AppUpdateEntity?
  //               : null,
  //         ),
  //       );
  //     }
  //   }
  // }
}
