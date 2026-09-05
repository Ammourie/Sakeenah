import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/ichat_remote.dart';
import '../../data/request/param/message_list_param.dart';
import '../entity/message_list_entity.dart';

part 'chat_repository.dart';

abstract class IChatRepository extends Repository {
  Future<Result<AppErrors, MessageListEntity>> messageList(
    MessageListParam param,
  );
}
