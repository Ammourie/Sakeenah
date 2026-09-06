import 'dart:developer';

import 'package:Sakeenah/features/home/domain/entity/daily_prayer_schedule_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/results/result.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/request/param/get_today_prayer_times_params.dart';
import '../../../domain/usecase/get_today_prayer_times_usecase.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  void safeEmit(HomeState state) {
    try {
      emit(state);
    } catch (e) {
      log(e.toString());
    }
  }

  void getPrayerTimes(GetTodayPrayerTimesParams params) async {
    safeEmit(const HomeState.prayerTimesLoading());
    final res = await getIt<GetTodayPrayerTimesUseCase>().call(params);
    res.pick(
      onData: (data) {
        safeEmit(HomeState.prayerTimesLoaded(schedule: data));
      },
      onError: (error) {
        safeEmit(
          HomeState.prayerTimesError(
            error: error,
            callback: () => getPrayerTimes(params),
          ),
        );
      },
    );
  }
}
