import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/save_location_preference_params.dart';
import '../repository/iprayer_times_repository.dart';

@injectable
class SaveLocationPreferenceUseCase
    extends UseCase<void, SaveLocationPreferenceParams> {
  SaveLocationPreferenceUseCase(this._repository);

  final IPrayerTimesRepository _repository;

  @override
  Future<Result<AppErrors, void>> call(SaveLocationPreferenceParams params) =>
      _repository.saveLocationPreference(params);
}
