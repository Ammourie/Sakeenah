import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/text_theme_styles.dart';
import '../../../../../core/ui/widgets/custom_list_tile.dart';
import '../../../../../generated/l10n.dart';
import '../../state_m/provider/chat_list_screen_notifier.dart';

class ChatListScreenContent extends StatefulWidget {
  const ChatListScreenContent({Key? key}) : super(key: key);
  @override
  State<ChatListScreenContent> createState() => _ChatListScreenContentState();
}

class _ChatListScreenContentState extends State<ChatListScreenContent> {
  late ChatListScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.read<ChatListScreenNotifier>();
    sn.context = context;
    return Column(
      children: [
        50.verticalSpace,
        CustomListTile(
          onTap: () => sn.onChatItemTap(S.current.customerSupport, 1),
          padding: const EdgeInsets.symmetric(vertical: 10),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              S.current.customerSupport.split(' ').first[0],
              style: TextThemeStyles.labelSmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          title: Text(
            S.current.customerSupport,
            style: TextThemeStyles.labelLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
