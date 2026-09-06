part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitialState;

  const factory HomeState.prayerTimesLoading() = HomePrayerTimesLoadingState;

  const factory HomeState.prayerTimesLoaded({
    required DailyPrayerScheduleEntity schedule,
  }) = HomePrayerTimesLoadedState;

  const factory HomeState.prayerTimesError({
    required AppErrors error,
    required VoidCallback callback,
  }) = HomePrayerTimesErrorState;
}
