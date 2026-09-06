import '../../../../../core/params/base_params.dart';

class GetCitiesByCountryParams extends BaseParams {
  static const countriesNowCitiesPath = 'countries/cities/q';

  final String country;

  GetCitiesByCountryParams({
    required this.country,
    super.cancelToken,
  });

  Map<String, dynamic> toQueryParameters() => {
        'country': country,
      };

  @override
  Map<String, dynamic> toMap() => toQueryParameters();
}
