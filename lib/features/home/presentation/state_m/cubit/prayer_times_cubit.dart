import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';

import '../../../../../core/common/app_config.dart';

import '../../../../../core/params/no_params.dart';

import '../../../../../di/service_locator.dart';

import '../../../domain/utils/location_label_utils.dart';

import '../../../data/request/param/get_today_prayer_times_params.dart';

import '../../../data/request/param/save_location_preference_params.dart';

import '../../../domain/entity/daily_prayer_schedule_entity.dart';

import '../../../domain/entity/location_preference_entity.dart';

import '../../../domain/usecase/get_location_preference_usecase.dart';

import '../../../domain/usecase/get_today_prayer_times_usecase.dart';

import '../../../domain/usecase/save_location_preference_usecase.dart';

part 'prayer_times_cubit.freezed.dart';

part 'prayer_times_state.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit() : super(const PrayerTimesState.initial());

  final GetTodayPrayerTimesUseCase _getTodayPrayerTimes =
      getIt<GetTodayPrayerTimesUseCase>();

  final GetLocationPreferenceUseCase _getLocationPreference =
      getIt<GetLocationPreferenceUseCase>();

  final SaveLocationPreferenceUseCase _saveLocationPreference =
      getIt<SaveLocationPreferenceUseCase>();

  LocationPreferenceEntity? _currentLocation;

  void safeEmit(PrayerTimesState state) {
    try {
      emit(state);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> initialize({
    required bool hasInternet,

    LocationPreferenceEntity? prefetchedGps,
  }) async {
    safeEmit(const PrayerTimesState.loading());

    final locationResult = await _getLocationPreference(NoParams());

    if (locationResult.hasErrorOnly) {
      _emitError(
        locationResult.error!,

        () =>
            initialize(hasInternet: hasInternet, prefetchedGps: prefetchedGps),
      );

      return;
    }

    _currentLocation = locationResult.data;

    if (_currentLocation == null || !_currentLocation!.isValid) {
      final applied = await _applyPrefetchedGps(prefetchedGps);

      if (!applied) {
        safeEmit(const PrayerTimesState.noLocation());

        return;
      }
    }

    await _fetchPrayerTimes(hasInternet: hasInternet);
  }

  Future<void> refresh({required bool hasInternet, bool showLoading = true}) async {
    if (_currentLocation == null || !_currentLocation!.isValid) {
      safeEmit(const PrayerTimesState.noLocation());

      return;
    }

    if (showLoading) {
      safeEmit(const PrayerTimesState.loading());
    }

    await _fetchPrayerTimes(hasInternet: hasInternet);
  }

  Future<void> retryGps({
    required bool hasInternet,

    LocationPreferenceEntity? prefetchedGps,
  }) async {
    safeEmit(const PrayerTimesState.loading());

    final applied = await _applyPrefetchedGps(prefetchedGps);

    if (!applied) {
      safeEmit(const PrayerTimesState.noLocation());

      return;
    }

    await _fetchPrayerTimes(hasInternet: hasInternet);
  }

  Future<void> saveMapLocation({
    required double latitude,

    required double longitude,

    required bool hasInternet,

    String? city,

    String? country,

    String? displayLabel,
  }) async {
    safeEmit(const PrayerTimesState.loading());

    ResolvedMapPlace? resolved;

    final trimmedCity = city?.trim();

    final trimmedCountry = country?.trim();

    final trimmedLabel = displayLabel?.trim();

    if (trimmedCity != null &&
        trimmedCity.isNotEmpty &&
        trimmedCountry != null &&
        trimmedCountry.isNotEmpty &&
        trimmedLabel != null &&
        trimmedLabel.isNotEmpty) {
      resolved = ResolvedMapPlace(
        city: trimmedCity,

        country: trimmedCountry,

        displayLabel: trimmedLabel,
      );

      log('saveMapLocation using pre-geocoded label=$trimmedLabel');
    } else {
      resolved = await LocationLabelUtils.resolveMapPlace(
        latitude: latitude,

        longitude: longitude,
      );
    }

    log(
      'saveMapLocation coords=($latitude,$longitude) '
      'resolved=${resolved?.displayLabel ?? 'null'}',
    );

    final LocationPreferenceEntity location;

    if (resolved != null) {
      location = LocationPreferenceEntity(
        source: LocationSource.manual,

        latitude: latitude,

        longitude: longitude,

        city: resolved.city,

        country: resolved.country,

        displayLabel: resolved.displayLabel,

        labelLanguageCode: AppConfig().appLanguage.languageCode,
      );
    } else {
      log('saveMapLocation geocode failed — saving GPS coords without label');

      location = LocationPreferenceEntity(
        source: LocationSource.gps,

        latitude: latitude,

        longitude: longitude,

        displayLabel: '',
      );
    }

    final saveResult = await _saveLocationPreference(
      SaveLocationPreferenceParams(location: location),
    );

    if (saveResult.hasErrorOnly) {
      _emitError(
        saveResult.error!,

        () => saveMapLocation(
          latitude: latitude,

          longitude: longitude,

          hasInternet: hasInternet,

          city: city,

          country: country,

          displayLabel: displayLabel,
        ),
      );

      return;
    }

    _currentLocation = location;

    await _fetchPrayerTimes(hasInternet: hasInternet);
  }

  Future<void> saveManualLocation({
    required String city,

    required String country,

    required bool hasInternet,
  }) async {
    final trimmedCity = city.trim();

    final trimmedCountry = country.trim();

    if (trimmedCity.isEmpty || trimmedCountry.isEmpty) return;

    safeEmit(const PrayerTimesState.loading());

    final location = LocationPreferenceEntity(
      source: LocationSource.manual,

      city: trimmedCity,

      country: trimmedCountry,

      displayLabel: trimmedCity,
    );

    final saveResult = await _saveLocationPreference(
      SaveLocationPreferenceParams(location: location),
    );

    if (saveResult.hasErrorOnly) {
      _emitError(
        saveResult.error!,

        () => saveManualLocation(
          city: city,

          country: country,

          hasInternet: hasInternet,
        ),
      );

      return;
    }

    _currentLocation = location;

    await _fetchPrayerTimes(hasInternet: hasInternet);
  }

  Future<bool> _applyPrefetchedGps(
    LocationPreferenceEntity? prefetchedGps,
  ) async {
    if (prefetchedGps == null || !prefetchedGps.isValid) return false;

    final saveResult = await _saveLocationPreference(
      SaveLocationPreferenceParams(location: prefetchedGps),
    );

    if (saveResult.hasErrorOnly) return false;

    _currentLocation = prefetchedGps;

    return true;
  }

  Future<void> _fetchPrayerTimes({required bool hasInternet}) async {
    final location = _currentLocation;

    if (location == null || !location.isValid) {
      safeEmit(const PrayerTimesState.noLocation());

      return;
    }

    final result = await _getTodayPrayerTimes(
      GetTodayPrayerTimesParams(location: location, isOffline: !hasInternet),
    );

    result.pick(
      onData: (schedule) {
        safeEmit(
          PrayerTimesState.loaded(
            schedule: schedule,

            location: location,

            isCached: schedule.isFromCache || result.hasDataAndError,
          ),
        );
      },

      onError: (error) {
        _emitError(error, () => refresh(hasInternet: hasInternet));
      },

      onErrorWithData: (schedule, error) {
        safeEmit(
          PrayerTimesState.loaded(
            schedule: schedule,

            location: location,

            isCached: true,
          ),
        );
      },
    );
  }

  void _emitError(AppErrors error, VoidCallback callback) {
    safeEmit(PrayerTimesState.error(error: error, callback: callback));
  }
}
