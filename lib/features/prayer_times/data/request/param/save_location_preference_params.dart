import '../../../../../core/params/base_params.dart';
import '../../../domain/entity/location_preference_entity.dart';

class SaveLocationPreferenceParams extends BaseParams {
  final LocationPreferenceEntity location;

  SaveLocationPreferenceParams({
    required this.location,
    super.cancelToken,
  });

  @override
  Map<String, dynamic> toMap() => {
        'source': location.source.name,
        if (location.latitude != null) 'latitude': location.latitude,
        if (location.longitude != null) 'longitude': location.longitude,
        if (location.city != null) 'city': location.city,
        if (location.country != null) 'country': location.country,
        'displayLabel': location.displayLabel,
      };
}
