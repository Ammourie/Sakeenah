import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/ui/screens/base_screen.dart';
import '../../../../../generated/l10n.dart';
import '../../state_m/provider/chat_list_screen_notifier.dart';
import 'chat_list_screen_content.dart';

class ChatListScreenParam {}

class ChatListScreen extends BaseScreen<ChatListScreenParam> {
  static const String routeName = "/ChatListScreen";

  const ChatListScreen({Key? key, required ChatListScreenParam param})
    : super(key: key, param: param);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  late final ChatListScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = ChatListScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatListScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: AppBar(title: Text(S.current.chatList)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const ChatListScreenContent(),
      ),
    );
  }
}
