import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../core/common/app_config.dart';
import '../../../../core/common/cache/geocoding_cache.dart';
import '../entity/location_preference_entity.dart';

class ResolvedMapPlace {
  const ResolvedMapPlace({
    required this.city,
    required this.country,
    required this.displayLabel,
  });

  final String city;
  final String country;
  final String displayLabel;
}

abstract final class LocationLabelUtils {
  static const _logName = 'Geocoding';

  /// Single long-lived instance — geocoding 5.x uses Pigeon; short-lived
  /// [Geocoding] objects can trigger channel errors when garbage-collected.
  static final Geocoding _geocoder = Geocoding();

  static final Map<String, Future<ResolvedMapPlace?>> _inFlightRequests = {};

  static final RegExp _coordinateLabelPattern = RegExp(
    r'^-?\d+\.\d+,\s*-?\d+\.\d+$',
  );

  static void _log(String message) {
    if (!kDebugMode) return;
    developer.log(message, name: _logName);
  }

  static bool isCoordinateLabel(String label) =>
      _coordinateLabelPattern.hasMatch(label.trim());

  /// Reverse-geocodes GPS coordinates into a single locality name
  /// (village, neighborhood, or city) using the app locale when [locale] is null.
  static Future<String?> fromCoordinates({
    required double latitude,
    required double longitude,
    Locale? locale,
  }) async {
    _log('fromCoordinates start lat=$latitude lng=$longitude');
    final resolved = await resolveMapPlace(
      latitude: latitude,
      longitude: longitude,
      locale: locale,
    );
    _log(
      'fromCoordinates result displayLabel=${resolved?.displayLabel ?? 'null'}',
    );
    return resolved?.displayLabel;
  }

  static Future<ResolvedMapPlace?> resolveMapPlace({
    required double latitude,
    required double longitude,
    Locale? locale,
  }) async {
    final resolvedLocale = locale ?? AppConfig().appLanguage;
    final languageCode = resolvedLocale.languageCode;

    final cached = await GeocodingCache.instance.get(
      latitude: latitude,
      longitude: longitude,
      languageCode: languageCode,
    );
    if (cached != null) {
      return ResolvedMapPlace(
        city: cached.city,
        country: cached.country,
        displayLabel: cached.displayLabel,
      );
    }

    final requestKey =
        '${languageCode}_${latitude.toStringAsFixed(5)}_${longitude.toStringAsFixed(5)}';
    final inFlight = _inFlightRequests[requestKey];
    if (inFlight != null) {
      _log('resolveMapPlace awaiting in-flight request key=$requestKey');
      return inFlight;
    }

    final future = _resolveMapPlaceFromPlatform(
      latitude: latitude,
      longitude: longitude,
      locale: resolvedLocale,
      languageCode: languageCode,
    );
    _inFlightRequests[requestKey] = future;

    try {
      return await future;
    } finally {
      _inFlightRequests.remove(requestKey);
    }
  }

  static Future<ResolvedMapPlace?> _resolveMapPlaceFromPlatform({
    required double latitude,
    required double longitude,
    required Locale locale,
    required String languageCode,
  }) async {
    _log(
      'resolveMapPlace start lat=$latitude lng=$longitude '
      'locale=$languageCode',
    );
    try {
      final isPresent = await _geocoder.isPresent();
      _log('geocoder.isPresent=$isPresent');

      final placemarks = await _geocoder.placemarkFromCoordinates(
        latitude,
        longitude,
        locale: locale,
      );
      _log('placemarks count=${placemarks.length}');

      if (placemarks.isEmpty) {
        _log('resolveMapPlace failed: empty placemarks list');
        return null;
      }

      for (var i = 0; i < placemarks.length; i++) {
        _log('placemark[$i]=${_describePlacemark(placemarks[i])}');
      }

      final place = placemarks.first;
      final city = _pickPlaceName(place);
      final country = place.country?.trim();
      _log('picked city=$city country=$country');

      if (city == null || country == null || country.isEmpty) {
        _log(
          'resolveMapPlace failed: missing city or country '
          '(city=$city country=$country)',
        );
        return null;
      }

      final resolved = ResolvedMapPlace(
        city: city,
        country: country,
        displayLabel: city,
      );
      _log(
        'resolveMapPlace success city=${resolved.city} '
        'country=${resolved.country}',
      );

      await GeocodingCache.instance.put(
        latitude: latitude,
        longitude: longitude,
        languageCode: languageCode,
        city: resolved.city,
        country: resolved.country,
        displayLabel: resolved.displayLabel,
      );

      return resolved;
    } on PlatformException catch (e, stackTrace) {
      _log(
        'resolveMapPlace PlatformException code=${e.code} '
        'message=${e.message} details=${e.details}',
      );
      _log('stackTrace=$stackTrace');
      return null;
    } catch (e, stackTrace) {
      _log('resolveMapPlace error=$e');
      _log('stackTrace=$stackTrace');
      return null;
    }
  }

  static String _describePlacemark(Placemark place) {
    return '{'
        'name=${place.name}, '
        'subLocality=${place.subLocality}, '
        'locality=${place.locality}, '
        'subAdministrativeArea=${place.subAdministrativeArea}, '
        'administrativeArea=${place.administrativeArea}, '
        'country=${place.country}, '
        'isoCountryCode=${place.isoCountryCode}, '
        'postalCode=${place.postalCode}, '
        'street=${place.street}, '
        'thoroughfare=${place.thoroughfare}'
        '}';
  }

  static String? _pickPlaceName(Placemark place) {
    for (final candidate in [
      place.subLocality,
      place.locality,
      place.subAdministrativeArea,
      place.administrativeArea,
      place.name,
    ]) {
      final value = candidate?.trim();
      if (value != null && value.isNotEmpty) {
        _log('pickPlaceName selected=$value');
        return value;
      }
    }
    _log('pickPlaceName found no candidate');
    return null;
  }

  static String readableLabel(
    LocationPreferenceEntity location, {
    required String fallback,
  }) {
    if (location.source == LocationSource.manual) {
      final address = location.address?.trim();
      if (address != null && address.isNotEmpty) {
        return location.displayLabel.trim().isNotEmpty
            ? location.displayLabel.trim()
            : address;
      }
      final city = location.city?.trim();
      if (city != null && city.isNotEmpty) {
        return city;
      }
    }

    final label = location.displayLabel.trim();
    if (label.isNotEmpty && !isCoordinateLabel(label)) {
      return label;
    }

    final city = location.city?.trim();
    if (city != null && city.isNotEmpty) {
      return city;
    }

    return fallback;
  }
}
