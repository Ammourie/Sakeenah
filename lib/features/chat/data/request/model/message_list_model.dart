import '../../../../../core/common/extensions/base_model_list_extension.dart';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/message_list_entity.dart';
import 'message_model.dart';

class MessageListModel extends BaseModel<MessageListEntity> {
  final int? totalCount;
  final List<MessageModel> items;

  MessageListModel({required this.totalCount, required this.items});

  factory MessageListModel.fromMap(Map<String, dynamic> json) =>
      MessageListModel(
        totalCount: numV(json["totalCount"]),
        items:
            json["items"] == null
                ? []
                : List<MessageModel>.from(
                  json["items"].map((x) => MessageModel.fromMap(x)),
                ),
      );

  @override
  MessageListEntity toEntity() {
    return MessageListEntity(
      totalCount: totalCount,
      items: items.toListEntity(),
    );
  }
}
