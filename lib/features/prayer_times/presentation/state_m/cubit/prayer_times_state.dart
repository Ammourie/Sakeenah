part of 'prayer_times_cubit.dart';

@freezed
class PrayerTimesState with _$PrayerTimesState {
  const factory PrayerTimesState.initial() = PrayerTimesInitialState;

  const factory PrayerTimesState.loading() = PrayerTimesLoadingState;
  const factory PrayerTimesState.loaded({
    required DailyPrayerScheduleEntity schedule,
    required LocationPreferenceEntity location,
    required bool isCached,
  }) = PrayerTimesLoadedState;

  const factory PrayerTimesState.noLocation() = PrayerTimesNoLocationState;

  const factory PrayerTimesState.error({
    required AppErrors error,
    required VoidCallback callback,
  }) = PrayerTimesErrorState;
}
