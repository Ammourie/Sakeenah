import '../../../../../core/params/base_params.dart';
import '../../../../../core/params/page_param.dart';

class MessageListParam extends BaseParams {
  final int chatId;
  final PageParam pageParam;

  MessageListParam({
    super.cancelToken,
    required this.chatId,
    required this.pageParam,
  });

  @override
  Map<String, dynamic> toMap() => pageParam.toMap()..addAll({'chatId': chatId});
}
