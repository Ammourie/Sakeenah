import 'package:dio/dio.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/params/base_params.dart';
import 'get_countries_params.dart';

class GetAdminDivisionsByCountryParams extends BaseParams {
  static const geonamesSearchPath = 'searchJSON';

  final String countryCode;
  final String lang;
  final bool isOffline;

  GetAdminDivisionsByCountryParams({
    required this.countryCode,
    required this.lang,
    required this.isOffline,
    super.cancelToken,
  });

  factory GetAdminDivisionsByCountryParams.fromAppLocale({
    required String countryCode,
    required String lang,
    required bool isOffline,
    CancelToken? cancelToken,
  }) {
    return GetAdminDivisionsByCountryParams(
      countryCode: countryCode,
      lang: GetCountriesParams.fromAppLocale(
        lang: lang,
        isOffline: isOffline,
      ).lang,
      isOffline: isOffline,
      cancelToken: cancelToken,
    );
  }

  Map<String, dynamic> toQueryParameters() => {
        'country': countryCode,
        'featureClass': 'A',
        'featureCode': 'ADM1',
        'maxRows': 1000,
        'lang': lang,
        'username': AppConstants.GEONAMES_USERNAME,
      };

  @override
  Map<String, dynamic> toMap() => {
        'countryCode': countryCode,
        'lang': lang,
        'isOffline': isOffline,
      };
}
