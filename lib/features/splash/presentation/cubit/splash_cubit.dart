import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/common/app_config.dart';
import '../../../../core/common/local_storage.dart';
import '../../../../core/common/utils/cubit_utils.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../di/service_locator.dart';
import '../../../account/domain/entity/profile_entity.dart';
import '../../../account/domain/usecase/get_profile_usecase.dart';
import '../../../more/data/request/param/check_version_param.dart';
import '../../../more/domain/entity/version_entity.dart';
import '../../../more/domain/usecase/check_update_app_usecase.dart';
import '../../domain/entity/splash_entity.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  void getSplash({CancelToken? cancelToken}) async {
    emit(const SplashState.loading());

    final List<Result> results = await Future.wait([
      // Check Update App.
      getIt<CheckUpdateAppUsecase>()(
        CheckVersionParam(deviceType: AppConfig().os),
      ),

      if (LocalStorage.hasToken) getIt<GetProfileUsecase>()(NoParams()),
    ]);
    final error = CubitUtils.checkError(results);

    if (error != null) {
      emit(SplashState.error(error: error, callback: () => this.getSplash()));
    } else {
      if (LocalStorage.hasToken) {
        emit(
          SplashState.loaded(
            SplashEntity(
              version: results[0].data as VersionEntity,
              profile: results[2].data as ProfileEntity?,
            ),
          ),
        );
      } else {
        emit(
          SplashState.loaded(
            SplashEntity(
              version: results[0].data as VersionEntity,
              profile: null,
            ),
          ),
        );
      }
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
