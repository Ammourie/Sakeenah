import 'package:injectable/injectable.dart';

import '../../domain/entity/radio_player_entity.dart';
import '../repository/ihome_repository.dart';

@injectable
class WatchQuranRadioUseCase {
  WatchQuranRadioUseCase(this._repository);

  final IHomeRepository _repository;

  Stream<RadioPlayerEntity> call() => _repository.watchQuranRadio();
}
