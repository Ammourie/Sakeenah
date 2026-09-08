import 'package:dio/dio.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/params/base_params.dart';

class GetCountriesParams extends BaseParams {
  static const geonamesCountryInfoPath = 'countryInfoJSON';

  final String lang;
  final bool isOffline;

  GetCountriesParams({
    required this.lang,
    required this.isOffline,
    super.cancelToken,
  });

  factory GetCountriesParams.fromAppLocale({
    required String lang,
    required bool isOffline,
    CancelToken? cancelToken,
  }) {
    return GetCountriesParams(
      lang: _normalizeLang(lang),
      isOffline: isOffline,
      cancelToken: cancelToken,
    );
  }

  Map<String, dynamic> toQueryParameters() => {
        'lang': lang,
        'username': AppConstants.GEONAMES_USERNAME,
      };

  static String _normalizeLang(String lang) {
    if (lang == AppConstants.LANG_AR) return AppConstants.LANG_AR;
    return AppConstants.LANG_EN;
  }

  @override
  Map<String, dynamic> toMap() => {
        'lang': lang,
        'isOffline': isOffline,
      };
}
