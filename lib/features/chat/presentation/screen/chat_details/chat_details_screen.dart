import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/text_theme_styles.dart';
import '../../../../../core/ui/error_ui/errors_screens/error_widget.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../../../../core/ui/widgets/custom_scaffold.dart';
import '../../../../../core/ui/widgets/waiting_widget.dart';
import '../../state_m/cubit/chat_cubit.dart';
import '../../state_m/provider/chat_details_screen_notifier.dart';
import 'chat_details_screen_content.dart';

class ChatDetailsScreenParam {
  final String user;

  ChatDetailsScreenParam({required this.user});
}

class ChatDetailsScreen extends BaseScreen<ChatDetailsScreenParam> {
  static const String routeName = "/ChatDetailsScreen";

  const ChatDetailsScreen({Key? key, required ChatDetailsScreenParam param})
    : super(key: key, param: param);

  @override
  _ChatDetailsScreenState createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  late final ChatDetailsScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = ChatDetailsScreenNotifier(widget.param);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sn.connectToChatSocket();
    });
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatDetailsScreenNotifier>.value(
      value: sn,
      child: CustomScaffold(
        appBar: AppBar(
          title: Text(sn.param.user),
          surfaceTintColor: Colors.white,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocConsumer<ChatCubit, ChatState>(
          bloc: sn.chatCubit,
          listener: (context, state) {
            state.maybeWhen(
              successCreateChatSocket: (data) => sn.chatSocket = data,
              messageListLoaded: (data, chatInfo) {
                sn.messages = data.items;
                sn.chatInfo = chatInfo;
                sn.chatSocket.clearListeners();
                sn.chatSocket.onReceiveMessage(sn.onReceiveMessage);
                sn.chatSocket.onMessageSent(sn.onSuccessSentMessage);
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              chatInit: () => const WaitingWidget(),
              chatLoading:
                  (message) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const WaitingWidget(),
                      if (message != null) ...[
                        50.verticalSpace,
                        Text(
                          message,
                          style: TextThemeStyles.titleSmall.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
              successCreateChatSocket: (_) => const WaitingWidget(),
              chatError: (error, callback) {
                return ErrorScreenWidget(error: error, callback: callback);
              },
              messageListLoaded: (_, _) => const ChatDetailsScreenContent(),
              orElse: () => const ScreenNotImplementedErrorWidget(),
            );
          },
        ),
      ),
    );
  }
}
