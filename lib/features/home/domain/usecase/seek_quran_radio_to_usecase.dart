import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/quran_radio_params.dart';
import '../entity/radio_player_entity.dart';
import '../repository/ihome_repository.dart';

@injectable
class SeekQuranRadioToUseCase
    extends UseCase<RadioPlayerEntity, SeekQuranRadioToParams> {
  SeekQuranRadioToUseCase(this._repository);

  final IHomeRepository _repository;

  @override
  Future<Result<AppErrors, RadioPlayerEntity>> call(
    SeekQuranRadioToParams params,
  ) =>
      _repository.seekQuranRadioTo(params.positionSeconds);
}
