import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../common/local_storage.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/enums/languages_enum.dart';
import '../../navigation/nav.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image.dart';
import '../widgets/onboarding_wallpaper.dart';
import '../widgets/animated_wrapper.dart';
import '../widgets/themed_system_overlay.dart';
import 'base_screen.dart';
import 'language_screen_notifier.dart';

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
                const OnboardingWallpaper(),
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
                                          CrossAxisAlignment.center,
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
          width: 72.r,
          height: 72.r,
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

        return LayoutBuilder(
          builder: (context, constraints) {
            final gap = 16.w;
            final maxSide = math.min(
              (constraints.maxWidth - gap) / 2,
              156.r,
            );
            final rowWidth = maxSide * 2 + gap;

            return Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: rowWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: maxSide,
                      height: maxSide,
                      child: _buildLanguageCard(
                        context: context,
                        value: LanguagesEnum.english,
                        label: AppConstants.LANG_EN_OUTPUT,
                        iconAsset: AppConstants.SVG_ICON_CASE_SENSITIVE,
                        selected: selected == LanguagesEnum.english,
                      ),
                    ),
                    gap.horizontalSpace,
                    SizedBox(
                      width: maxSide,
                      height: maxSide,
                      child: _buildLanguageCard(
                        context: context,
                        value: LanguagesEnum.arabic,
                        label: AppConstants.LANG_AR_OUTPUT,
                        iconAsset: AppConstants.SVG_ICON_ALIGN_RIGHT,
                        selected: selected == LanguagesEnum.arabic,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLanguageCard({
    required BuildContext context,
    required LanguagesEnum value,
    required String label,
    required String iconAsset,
    required bool selected,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final cardColor = selected
        ? colorScheme.primaryContainer.withValues(alpha: 0.55)
        : colorScheme.surfaceContainer;
    final borderColor =
        selected ? colorScheme.primary : colorScheme.outlineVariant;
    final iconBackground = selected
        ? colorScheme.primary
        : colorScheme.surfaceContainerHigh;
    final iconColor =
        selected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant;

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: borderColor,
            width: selected ? 2 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.14),
                    blurRadius: 16.r,
                    offset: Offset(0, 6.h),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: () => sn.selectedLanguage = value,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 14.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56.r,
                        height: 56.r,
                        decoration: BoxDecoration(
                          color: iconBackground,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        alignment: Alignment.center,
                        child: CustomImage.asset(
                          iconAsset,
                          width: 28.r,
                          height: 28.r,
                          color: iconColor,
                        ),
                      ),
                      12.verticalSpace,
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          label,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: textTheme.titleSmall?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight:
                                selected ? FontWeight.w700 : FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (selected)
                  PositionedDirectional(
                    top: 10.h,
                    end: 10.w,
                    child: Container(
                      width: 22.r,
                      height: 22.r,
                      decoration: BoxDecoration(
                        color: colorScheme.secondary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colorScheme.surface,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: CustomImage.asset(
                          AppConstants.SVG_ICON_CHECK,
                          width: 12.r,
                          height: 12.r,
                          color: colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ),
              ],
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
      onPressed: () => sn.confirm(context),
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
