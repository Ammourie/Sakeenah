import 'dart:convert';

import '../common/type_validators.dart';
import '../constants/enums/user_type_enum.dart';
import 'user_info_model.dart';

class ChatReadyInfo {
  ChatReadyInfo({
    required this.id,
    required this.participants,
    required this.groupName,
    required this.isGroup,
    required this.myParticipant,
  });

  final int? id;
  final String groupName;
  final bool isGroup;
  final List<UserInfoModel> participants;
  final UserInfoModel? myParticipant;

  factory ChatReadyInfo.fromJson(String str) =>
      ChatReadyInfo.fromMap(json.decode(str));

  factory ChatReadyInfo.fromMap(Map<String, dynamic> json) {
    List<UserInfoModel> participants =
        json["participants"] == null
            ? []
            : List<UserInfoModel>.from(
              json["participants"].map((x) => UserInfoModel.fromMap(x)),
            );
    final index = participants.indexWhere(
      (e) => e.userType == UserType.customers.mapToInt,
    );
    return ChatReadyInfo(
      id: numV(json["id"]),
      participants: participants,
      myParticipant: index != -1 ? participants[index] : null,
      groupName: stringV(json["groupName"]),
      isGroup: boolV(json["isGroup"]),
    );
  }
}
