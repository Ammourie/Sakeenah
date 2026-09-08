import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/get_admin_divisions_by_country_params.dart';
import '../../data/request/param/get_cities_by_country_params.dart';
import '../../data/request/param/get_countries_params.dart';
import '../entity/country_entity.dart';
import '../repository/ihome_repository.dart';

@singleton
class GetCountriesUseCase extends UseCase<CountryListEntity, GetCountriesParams> {
  GetCountriesUseCase(this._repository);

  final IHomeRepository _repository;

  @override
  Future<Result<AppErrors, CountryListEntity>> call(
    GetCountriesParams params,
  ) =>
      _repository.getCountries(params);
}

@singleton
class GetAdminDivisionsByCountryUseCase
    extends UseCase<AdminDivisionListEntity, GetAdminDivisionsByCountryParams> {
  GetAdminDivisionsByCountryUseCase(this._repository);

  final IHomeRepository _repository;

  @override
  Future<Result<AppErrors, AdminDivisionListEntity>> call(
    GetAdminDivisionsByCountryParams params,
  ) =>
      _repository.getAdminDivisionsByCountry(params);
}

@singleton
class GetCitiesByCountryUseCase
    extends UseCase<CityListEntity, GetCitiesByCountryParams> {
  GetCitiesByCountryUseCase(this._repository);

  final IHomeRepository _repository;

  @override
  Future<Result<AppErrors, CityListEntity>> call(
    GetCitiesByCountryParams params,
  ) =>
      _repository.getCitiesByCountry(params);
}
