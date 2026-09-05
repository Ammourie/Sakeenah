import '../../../../core/entities/base_entity.dart';
import 'message_entity.dart';

class MessageListEntity extends BaseEntity {
  final int? totalCount;
  final List<MessageEntity> items;

  MessageListEntity({required this.totalCount, required this.items});

  @override
  List<Object?> get props => [this.totalCount, this.items];
}
