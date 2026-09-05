import 'dart:developer';

import 'package:geolocator/geolocator.dart';

import '../../../../core/common/app_config.dart';
import '../../../../core/common/utils/location_access_utils.dart';
import '../../domain/entity/location_preference_entity.dart';
import '../../domain/utils/location_label_utils.dart';

class GpsLocationFetcher {
  GpsLocationFetcher._();

  static Future<LocationPreferenceEntity?> fetch() async {
    final ready = await LocationAccessUtils.ensureLocationAccess();
    if (!ready) {
      log('GpsLocationFetcher abort — location access not ready');
      return null;
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
        ),
      );

      final resolved = await LocationLabelUtils.resolveMapPlace(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      log(
        'GpsLocationFetcher coords=(${position.latitude},${position.longitude}) '
        'placeName=${resolved?.displayLabel ?? 'null'}',
      );

      if (resolved == null) {
        return LocationPreferenceEntity(
          source: LocationSource.gps,
          latitude: position.latitude,
          longitude: position.longitude,
          displayLabel: '',
        );
      }

      return LocationPreferenceEntity(
        source: LocationSource.gps,
        latitude: position.latitude,
        longitude: position.longitude,
        city: resolved.city,
        country: resolved.country,
        displayLabel: resolved.displayLabel,
        labelLanguageCode: AppConfig().appLanguage.languageCode,
      );
    } catch (e) {
      log('GpsLocationFetcher failed: $e');
      return null;
    }
  }

  static Future<LocationPreferenceEntity?> fetchFromLatLng({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final resolved = await LocationLabelUtils.resolveMapPlace(
        latitude: latitude,
        longitude: longitude,
        locale: AppConfig().appLanguage,
      );

      if (resolved == null) {
        return LocationPreferenceEntity(
          source: LocationSource.gps,
          latitude: latitude,
          longitude: longitude,
          displayLabel: '',
        );
      }

      return LocationPreferenceEntity(
        source: LocationSource.gps,
        latitude: latitude,
        longitude: longitude,
        city: resolved.city,
        country: resolved.country,
        displayLabel: resolved.displayLabel,
        labelLanguageCode: AppConfig().appLanguage.languageCode,
      );
    } catch (e) {
      log('GpsLocationFetcher fetchFromLatLng failed: $e');

      return null;
    }
  }
}
