import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../common/local_storage.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/enums/languages_enum.dart';
import '../../navigation/nav.dart';
import '../../theme/text_theme_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image.dart';
import '../widgets/app_wallpaper.dart';
import '../widgets/animated_wrapper.dart';
import '../widgets/themed_system_overlay.dart';
import 'base_screen.dart';
import 'language_screen_notifier.dart';
import 'theme_screen.dart';

class LanguageScreenParam {
  const LanguageScreenParam();
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
  bool _entranceAnimationDone = false;

  bool get _isFirstStart => !LocalStorage.languageFirstStartSelected;

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
        final screen = PopScope(
          canPop: !_isFirstStart,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: Stack(
              fit: StackFit.expand,
              children: [
                const AppWallpaper(),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (!_isFirstStart) _buildBackButton(context),
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SingleChildScrollView(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    AnimatedWrapper.fadeUp(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      interval: const Duration(
                                        milliseconds: 80,
                                      ),
                                      duration: const Duration(
                                        milliseconds: 480,
                                      ),
                                      curve: Curves.easeOutCubic,
                                      enabled: !_entranceAnimationDone,
                                      children: [
                                        _buildHeader(context),
                                      ],
                                    ),
                                    32.verticalSpace,
                                    AnimatedWrapper.scaleIn(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      delay: const Duration(milliseconds: 120),
                                      interval: const Duration(
                                        milliseconds: 100,
                                      ),
                                      duration: const Duration(
                                        milliseconds: 450,
                                      ),
                                      scaleBegin: 0.88,
                                      curve: Curves.easeOutCubic,
                                      enabled: !_entranceAnimationDone,
                                      children: [
                                        _buildLanguageCards(context),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      AnimatedWrapper.fadeUp(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        delay: const Duration(milliseconds: 280),
                        interval: Duration.zero,
                        duration: const Duration(milliseconds: 420),
                        curve: Curves.easeOutCubic,
                        enabled: !_entranceAnimationDone,
                        onComplete: () {
                          if (mounted && !_entranceAnimationDone) {
                            setState(() => _entranceAnimationDone = true);
                          }
                        },
                        children: [_buildBottomActions(context)],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

        return ThemedSystemOverlay(child: screen);
      },
    );
  }

  Widget _buildBackButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 4.h, 24.w, 0),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: IconButton(
          onPressed: () => Nav.pop(),
          icon: Icon(Icons.arrow_back_rounded, size: 24.r),
          color: colorScheme.onSurface,
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppConstants.mainImageForTheme(Theme.of(context).brightness),
          width: 150.r,
          height: 150.r,
          fit: BoxFit.contain,
        ),
        20.verticalSpace,
        Text(
          S.current.selectLanguageTitle,
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
        12.verticalSpace,
        Text(
          S.current.changeLangMessage,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageCards(BuildContext context) {
    return Builder(
      builder: (context) {
        final selected = context.select<LanguageScreenNotifier, LanguagesEnum>(
          (n) => n.selectedLanguage,
        );

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLanguageTile(
              context: context,
              value: LanguagesEnum.english,
              label: AppConstants.LANG_EN_OUTPUT,
              code: AppConstants.LANG_EN_CODE,
              languageCode: AppConstants.LANG_EN,
              selected: selected == LanguagesEnum.english,
            ),
            12.verticalSpace,
            _buildLanguageTile(
              context: context,
              value: LanguagesEnum.arabic,
              label: AppConstants.LANG_AR_OUTPUT,
              code: AppConstants.LANG_AR_CODE,
              languageCode: AppConstants.LANG_AR,
              selected: selected == LanguagesEnum.arabic,
            ),
          ],
        );
      },
    );
  }

  Widget _buildLanguageTile({
    required BuildContext context,
    required LanguagesEnum value,
    required String label,
    required String code,
    required String languageCode,
    required bool selected,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isArabic = languageCode == AppConstants.LANG_AR;

    final tileColor = selected
        ? colorScheme.primaryContainer.withValues(alpha: 0.45)
        : colorScheme.surfaceContainer;
    final borderColor =
        selected ? colorScheme.primary : colorScheme.outlineVariant;

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: borderColor, width: selected ? 2 : 1),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16.r),
            onTap: () => sn.selectedLanguage = value,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textDirection: isArabic
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          locale: Locale(languageCode),
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: selected
                                ? FontWeight.w700
                                : FontWeight.w600,
                            fontFamily: TextThemeStyles.fontFamily(
                              languageCode: languageCode,
                            ),
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          code,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.horizontalSpace,
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 24.r,
                    height: 24.r,
                    decoration: BoxDecoration(
                      color: selected
                          ? colorScheme.secondary
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected
                            ? colorScheme.secondary
                            : colorScheme.outline,
                        width: selected ? 0 : 1.5,
                      ),
                    ),
                    child: selected
                        ? Center(
                            child: CustomImage.asset(
                              AppConstants.SVG_ICON_CHECK,
                              width: 13.r,
                              height: 13.r,
                              color: colorScheme.onSecondary,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final confirmButton = CustomButton(
      backgroundColor: colorScheme.primary,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      borderRadius: Radius.circular(16.r),
      onPressed: () async {
        final goToTheme = await sn.confirm(context);
        if (goToTheme && context.mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const ThemeScreen(param: ThemeScreenParam()),
            ),
          );
        }
      },
      child: Text(
        S.current.confirm,
        style: textTheme.titleSmall?.copyWith(
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
      child: SizedBox(width: double.infinity, child: confirmButton),
    );
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }
}
