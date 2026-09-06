import '../../../../core/entities/base_entity.dart';

enum LocationSource { gps, manual }

class LocationPreferenceEntity extends BaseEntity {
  final LocationSource source;
  final double? latitude;
  final double? longitude;
  final String? city;
  final String? country;
  final String? address;
  final String displayLabel;
  final String? labelLanguageCode;

  LocationPreferenceEntity({
    required this.source,
    this.latitude,
    this.longitude,
    this.city,
    this.country,
    this.address,
    required this.displayLabel,
    this.labelLanguageCode,
  });

  bool get usesAddressLookup => (address ?? '').trim().isNotEmpty;

  String get locationKey {
    if (source == LocationSource.gps &&
        latitude != null &&
        longitude != null) {
      return '${latitude!.toStringAsFixed(4)}|${longitude!.toStringAsFixed(4)}';
    }
    if (usesAddressLookup) {
      return 'addr|${address!.trim().toLowerCase()}';
    }
    return '${city ?? ''}|${country ?? ''}'.toLowerCase();
  }

  bool get isValid {
    if (source == LocationSource.gps) {
      return latitude != null && longitude != null;
    }
    if (usesAddressLookup) {
      return address!.trim().isNotEmpty;
    }
    return (city ?? '').isNotEmpty && (country ?? '').isNotEmpty;
  }

  @override
  List<Object?> get props => [
        source,
        latitude,
        longitude,
        city,
        country,
        address,
        displayLabel,
        labelLanguageCode,
      ];
}
