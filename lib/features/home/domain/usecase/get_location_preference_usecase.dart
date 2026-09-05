import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/location_preference_entity.dart';
import '../repository/iprayer_times_repository.dart';

@injectable
class GetLocationPreferenceUseCase
    extends UseCase<LocationPreferenceEntity?, NoParams> {
  GetLocationPreferenceUseCase(this._repository);

  final IPrayerTimesRepository _repository;

  @override
  Future<Result<AppErrors, LocationPreferenceEntity?>> call(NoParams params) =>
      _repository.getLocationPreference(params);
}
