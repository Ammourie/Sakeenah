import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../common/local_storage.dart';
import '../../common/app_config.dart';
import '../../constants/app/app_constants.dart';
import '../../navigation/nav.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image.dart';
import '../widgets/onboarding_wallpaper.dart';
import '../widgets/animated_wrapper.dart';
import '../widgets/themed_system_overlay.dart';
import '../../../features/splash/presentation/screen/splash_screen.dart';
import 'base_screen.dart';
import 'theme_screen_notifier.dart';

class ThemeScreenParam {
  const ThemeScreenParam();
}

class ThemeScreen extends BaseScreen<ThemeScreenParam> {
  static const String routeName = '/ThemeScreen';

  const ThemeScreen({Key? key, required ThemeScreenParam param})
    : super(key: key, param: param);

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  late final ThemeScreenNotifier sn;
  bool _entranceAnimationDone = false;

  bool get _isFirstStart => !LocalStorage.themeFirstStartSelected;

  @override
  void initState() {
    super.initState();
    sn = ThemeScreenNotifier(widget.param);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeScreenNotifier>.value(
      value: sn,
      builder: (context, _) {
        return ListenableBuilder(
          listenable: sn,
          builder: (context, _) {
            final previewTheme = AppConfig().resolveThemeDataForMode(
              sn.selectedTheme,
              context,
            );

            return Theme(
              data: previewTheme,
              child: ThemedSystemOverlay(
                child: PopScope(
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
                                child: _buildThemeScreenContent(context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildThemeScreenContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AnimatedWrapper.fadeUp(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        interval: const Duration(milliseconds: 80),
                        duration: const Duration(milliseconds: 480),
                        curve: Curves.easeOutCubic,
                        enabled: !_entranceAnimationDone,
                        children: [
                          _buildHeader(context),
                        ],
                      ),
                      32.verticalSpace,
                      AnimatedWrapper.scaleIn(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        delay: const Duration(milliseconds: 120),
                        interval: const Duration(milliseconds: 100),
                        duration: const Duration(milliseconds: 450),
                        scaleBegin: 0.88,
                        curve: Curves.easeOutCubic,
                        enabled: !_entranceAnimationDone,
                        children: [
                          _buildThemeCards(context),
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
          S.current.selectThemeTitle,
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
        12.verticalSpace,
        Text(
          S.current.selectThemeMessage,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildThemeCards(BuildContext context) {
    final selected = context.select<ThemeScreenNotifier, ThemeMode>(
      (n) => n.selectedTheme,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildThemeOptionTile(
          context: context,
          value: ThemeMode.light,
          label: S.current.themeLight,
          iconAsset: AppConstants.SVG_ICON_SUN,
          selected: selected == ThemeMode.light,
        ),
        12.verticalSpace,
        _buildThemeOptionTile(
          context: context,
          value: ThemeMode.dark,
          label: S.current.themeDark,
          iconAsset: AppConstants.SVG_ICON_MOON,
          selected: selected == ThemeMode.dark,
        ),
        12.verticalSpace,
        _buildThemeOptionTile(
          context: context,
          value: ThemeMode.system,
          label: S.current.themeSystem,
          iconAsset: AppConstants.SVG_ICON_SUN_MOON,
          selected: selected == ThemeMode.system,
        ),
      ],
    );
  }

  Widget _buildThemeOptionTile({
    required BuildContext context,
    required ThemeMode value,
    required String label,
    required String iconAsset,
    required bool selected,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final tileColor = selected
        ? colorScheme.primaryContainer.withValues(alpha: 0.45)
        : colorScheme.surfaceContainer;
    final borderColor = selected
        ? colorScheme.primary
        : colorScheme.outlineVariant;

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
            onTap: () => sn.selectTheme(value),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                children: [
                  Container(
                    width: 48.r,
                    height: 48.r,
                    decoration: BoxDecoration(
                      color: selected
                          ? colorScheme.primary
                          : colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    alignment: Alignment.center,
                    child: CustomImage.asset(
                      iconAsset,
                      width: 24.r,
                      height: 24.r,
                      color: selected
                          ? colorScheme.onPrimary
                          : colorScheme.onSurfaceVariant,
                    ),
                  ),
                  14.horizontalSpace,
                  Expanded(
                    child: Text(
                      label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: selected
                            ? FontWeight.w700
                            : FontWeight.w600,
                      ),
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
        final goToSplash = await sn.confirm(context);
        if (goToSplash && context.mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const SplashScreen()),
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
      child: _isFirstStart
          ? SizedBox(width: double.infinity, child: confirmButton)
          : Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => sn.cancel(context),
                    style: TextButton.styleFrom(
                      foregroundColor: colorScheme.onSurfaceVariant,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                    ),
                    child: Text(S.current.cancel),
                  ),
                ),
                12.horizontalSpace,
                Expanded(flex: 2, child: confirmButton),
              ],
            ),
    );
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }
}
