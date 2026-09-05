import 'package:flutter/material.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/navigation/nav.dart';
import '../../screen/chat_details/chat_details_screen.dart';
import '../../screen/chat_list/chat_list_screen.dart';

class ChatListScreenNotifier extends ScreenNotifier {
  /// Constructors
  ChatListScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final ChatListScreenParam param;

  /// Getters and Setters

  /// Methods
  void onChatItemTap(String user, int id) {
    Nav.to(
      ChatDetailsScreen.routeName,
      arguments: ChatDetailsScreenParam(user: user),
    );
  }

  @override
  void closeNotifier() {
    this.dispose();
  }
}
