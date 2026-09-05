import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/models/empty_response.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.homeInitState());

void safeEmit(HomeState state) {
  try {
    emit(state);
  } catch (e) {
    log(e.toString());
  }
}
}
