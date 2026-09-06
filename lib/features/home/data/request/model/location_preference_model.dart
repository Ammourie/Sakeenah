import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/location_preference_entity.dart';

class LocationPreferenceModel extends BaseModel<LocationPreferenceEntity> {
  final String source;
  final double? latitude;
  final double? longitude;
  final String? city;
  final String? country;
  final String? address;
  final String displayLabel;
  final String? labelLanguageCode;

  LocationPreferenceModel({
    required this.source,
    this.latitude,
    this.longitude,
    this.city,
    this.country,
    this.address,
    required this.displayLabel,
    this.labelLanguageCode,
  });

  factory LocationPreferenceModel.fromMap(Map<String, dynamic> json) {
    return LocationPreferenceModel(
      source: stringV(json['source']),
      latitude: numV<double>(json['latitude']),
      longitude: numV<double>(json['longitude']),
      city: stringV(json['city']).isEmpty ? null : stringV(json['city']),
      country: stringV(json['country']).isEmpty ? null : stringV(json['country']),
      address: stringV(json['address']).isEmpty ? null : stringV(json['address']),
      displayLabel: stringV(json['displayLabel']),
      labelLanguageCode: _optionalString(json['labelLanguageCode']),
    );
  }

  static String? _optionalString(dynamic value) {
    final parsed = stringV(value);
    return parsed.isEmpty ? null : parsed;
  }

  Map<String, dynamic> toMap() => {
        'source': source,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (city != null) 'city': city,
        if (country != null) 'country': country,
        if (address != null) 'address': address,
        'displayLabel': displayLabel,
        if (labelLanguageCode != null) 'labelLanguageCode': labelLanguageCode,
      };

  @override
  LocationPreferenceEntity toEntity() {
    return LocationPreferenceEntity(
      source: source == 'manual' ? LocationSource.manual : LocationSource.gps,
      latitude: latitude,
      longitude: longitude,
      city: city,
      country: country,
      address: address,
      displayLabel: displayLabel,
      labelLanguageCode: labelLanguageCode,
    );
  }

  factory LocationPreferenceModel.fromEntity(LocationPreferenceEntity entity) {
    return LocationPreferenceModel(
      source: entity.source == LocationSource.manual ? 'manual' : 'gps',
      latitude: entity.latitude,
      longitude: entity.longitude,
      city: entity.city,
      country: entity.country,
      address: entity.address,
      displayLabel: entity.displayLabel,
      labelLanguageCode: entity.labelLanguageCode,
    );
  }
}
