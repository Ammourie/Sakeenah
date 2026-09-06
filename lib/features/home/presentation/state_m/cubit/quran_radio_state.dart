part of 'quran_radio_cubit.dart';

@freezed
class QuranRadioState with _$QuranRadioState {
  const factory QuranRadioState.initial() = QuranRadioInitialState;

  const factory QuranRadioState.loaded({
    required RadioPlayerEntity player,
  }) = QuranRadioLoadedState;

  const factory QuranRadioState.error({
    required AppErrors error,
    required VoidCallback callback,
  }) = QuranRadioErrorState;
}
