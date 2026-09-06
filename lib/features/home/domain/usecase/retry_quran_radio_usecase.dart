import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/quran_radio_params.dart';
import '../entity/radio_player_entity.dart';
import '../repository/ihome_repository.dart';

@injectable
class RetryQuranRadioUseCase
    extends UseCase<RadioPlayerEntity, EmptyQuranRadioParams> {
  RetryQuranRadioUseCase(this._repository);

  final IHomeRepository _repository;

  @override
  Future<Result<AppErrors, RadioPlayerEntity>> call(
    EmptyQuranRadioParams params,
  ) =>
      _repository.retryQuranRadio();
}
