import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/net.dart';
import '../request/model/message_list_model.dart';
import '../request/param/message_list_param.dart';

part 'chat_remote.dart';

abstract class IChatRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, MessageListModel>> messageList(
    MessageListParam param,
  );
}
