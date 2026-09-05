import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import '../hive_helper.dart';

/// Cached reverse-geocoding result for a coordinate + locale pair.
class GeocodingCacheEntry {
  const GeocodingCacheEntry({
    required this.latitude,
    required this.longitude,
    required this.languageCode,
    required this.city,
    required this.country,
    required this.displayLabel,
    required this.cachedAtMs,
  });

  final double latitude;
  final double longitude;
  final String languageCode;
  final String city;
  final String country;
  final String displayLabel;
  final int cachedAtMs;

  factory GeocodingCacheEntry.fromMap(Map<String, dynamic> map) {
    return GeocodingCacheEntry(
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
      languageCode: map['languageCode'] as String,
      city: map['city'] as String,
      country: map['country'] as String,
      displayLabel: map['displayLabel'] as String,
      cachedAtMs: map['cachedAtMs'] as int,
    );
  }

  Map<String, dynamic> toMap() => {
        'latitude': latitude,
        'longitude': longitude,
        'languageCode': languageCode,
        'city': city,
        'country': country,
        'displayLabel': displayLabel,
        'cachedAtMs': cachedAtMs,
      };
}

/// Persists and serves reverse-geocoding results within [matchRadiusMeters].
class GeocodingCache {
  GeocodingCache._();

  static final GeocodingCache instance = GeocodingCache._();

  static const matchRadiusMeters = 50.0;
  static const _maxEntries = 64;
  static const _logName = 'GeocodingCache';

  void _log(String message) {
    if (!kDebugMode) return;
    developer.log(message, name: _logName);
  }

  Future<GeocodingCacheEntry?> get({
    required double latitude,
    required double longitude,
    required String languageCode,
  }) async {
    final entries = await _loadEntries();
    for (final entry in entries) {
      if (entry.languageCode != languageCode) continue;

      final distance = Geolocator.distanceBetween(
        latitude,
        longitude,
        entry.latitude,
        entry.longitude,
      );
      if (distance <= matchRadiusMeters) {
        _log(
          'hit lat=$latitude lng=$longitude locale=$languageCode '
          'distance=${distance.toStringAsFixed(1)}m '
          'label=${entry.displayLabel}',
        );
        return entry;
      }
    }

    _log(
      'miss lat=$latitude lng=$longitude locale=$languageCode '
      '(entries=${entries.length})',
    );
    return null;
  }

  Future<void> put({
    required double latitude,
    required double longitude,
    required String languageCode,
    required String city,
    required String country,
    required String displayLabel,
  }) async {
    final entries = await _loadEntries();
    final now = DateTime.now().millisecondsSinceEpoch;

    final updated = [
      GeocodingCacheEntry(
        latitude: latitude,
        longitude: longitude,
        languageCode: languageCode,
        city: city,
        country: country,
        displayLabel: displayLabel,
        cachedAtMs: now,
      ),
      ...entries.where(
        (entry) =>
            entry.languageCode != languageCode ||
            Geolocator.distanceBetween(
                  latitude,
                  longitude,
                  entry.latitude,
                  entry.longitude,
                ) >
                matchRadiusMeters,
      ),
    ];

    if (updated.length > _maxEntries) {
      updated.sort((a, b) => b.cachedAtMs.compareTo(a.cachedAtMs));
      updated.removeRange(_maxEntries, updated.length);
    }

    await HiveHelper.putGeocodingCacheEntries(
      updated.map((entry) => entry.toMap()).toList(),
    );

    _log(
      'stored lat=$latitude lng=$longitude locale=$languageCode '
      'label=$displayLabel total=${updated.length}',
    );
  }

  Future<void> clear() async {
    await HiveHelper.putGeocodingCacheEntries([]);
    _log('cleared');
  }

  Future<List<GeocodingCacheEntry>> _loadEntries() async {
    final raw = HiveHelper.getGeocodingCacheEntries();
    return raw.map(GeocodingCacheEntry.fromMap).toList();
  }
}
