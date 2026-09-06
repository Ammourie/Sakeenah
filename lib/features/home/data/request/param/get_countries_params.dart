import '../../../../../core/params/base_params.dart';

class GetCountriesParams extends BaseParams {
  static const countriesNowCountriesPath = 'countries';

  GetCountriesParams({super.cancelToken});

  @override
  Map<String, dynamic> toMap() => {};
}
