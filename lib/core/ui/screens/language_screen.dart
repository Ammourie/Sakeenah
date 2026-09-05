import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/enums/languages_enum.dart';
import '../../navigation/nav.dart';
import '../widgets/custom_button.dart';
import 'base_screen.dart';
import 'language_screen_notifier.dart';

class LanguageScreenParam {
  const LanguageScreenParam({this.isFirstStart = false});

  final bool isFirstStart;
}

class LanguageScreen extends BaseScreen<LanguageScreenParam> {
  static const String routeName = "/LanguageScreen";

  const LanguageScreen({Key? key, required LanguageScreenParam param})
    : super(key: key, param: param);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late final LanguageScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = LanguageScreenNotifier(widget.param);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageScreenNotifier>.value(
      value: sn,
      builder: (context, _) {
        return PopScope(
          canPop: !widget.param.isFirstStart,
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: widget.param.isFirstStart
                ? null
                : AppBar(
                    title: Text(
                      S.current.changeLangMessage,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (widget.param.isFirstStart) _buildFirstStartHeader(),
                    Expanded(child: _buildLanguageList()),
                    _buildActions(),
                    24.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFirstStartHeader() {
    return Column(
      children: [
        64.verticalSpace,
        Text(
          S.current.changeLangMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        32.verticalSpace,
      ],
    );
  }

  Widget _buildLanguageList() {
    return Builder(
      builder: (context) {
        final selected = context.select<LanguageScreenNotifier, LanguagesEnum>(
          (n) => n.selectedLanguage,
        );

        return RadioGroup<LanguagesEnum>(
          groupValue: selected,
          onChanged: (value) {
            if (value != null) sn.selectedLanguage = value;
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<LanguagesEnum>(
                value: LanguagesEnum.english,
                activeColor: Theme.of(context).colorScheme.primary,
                title: const Text(AppConstants.LANG_EN_OUTPUT),
              ),
              RadioListTile<LanguagesEnum>(
                value: LanguagesEnum.arabic,
                activeColor: Theme.of(context).colorScheme.primary,
                title: const Text(AppConstants.LANG_AR_OUTPUT),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: widget.param.isFirstStart
          ? MainAxisAlignment.center
          : MainAxisAlignment.end,
      children: [
        if (!widget.param.isFirstStart)
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () => Nav.pop(),
            child: Text(S.current.cancel),
          ),
        12.horizontalSpace,
        CustomButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
          borderRadius: Radius.circular(35.r),
          onPressed: () => sn.confirm(context),
          child: Text(
            S.current.confirm,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }
}
