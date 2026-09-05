import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/param/message_list_param.dart';
import '../entity/message_list_entity.dart';
import '../repository/ichat_repository.dart';

@singleton
class GetMessageListUsecase
    extends UseCase<MessageListEntity, MessageListParam> {
  final IChatRepository repository;

  GetMessageListUsecase({required this.repository});

  @override
  Future<Result<AppErrors, MessageListEntity>> call(MessageListParam param) {
    return repository.messageList(param);
  }
}
