import 'package:Sakeenah/core/constants/app/app_constants.dart';
import 'package:Sakeenah/core/localization/localization_provider.dart';
import 'package:Sakeenah/core/providers/theme_mode_provider.dart';
import 'package:Sakeenah/features/home/presentation/state_m/provider/home_screen_notifier.dart';
import 'package:Sakeenah/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/theme_extensions.dart';
import '../../../../core/ui/widgets/custom_image.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer();

  @override
  Widget build(BuildContext context) {
    final sn = Provider.of<HomeScreenNotifier>(context, listen: false);
    final themeMode = context.watch<ThemeModeProvider>().themeMode;
    final colorScheme = Theme.of(context).colorScheme;
    final locale = context.watch<LocalizationProvider>();

    final languageLabel = locale.currentLanguage == AppConstants.LANG_AR
        ? AppConstants.LANG_AR_OUTPUT
        : AppConstants.LANG_EN_OUTPUT;
    final themeLabel = _themeModeLabel(themeMode);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Drawer(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: isRtl ? Radius.circular(28.r) : Radius.zero,
          right: isRtl ? Radius.zero : Radius.circular(28.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(colorScheme: colorScheme),
          8.verticalSpace,
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              children: [
                DrawerMenuTile(
                  iconAsset: AppConstants.SVG_ICON_LANGUAGES,
                  title: S.current.changeLanguage,
                  subtitle: languageLabel,
                  onTap: () {
                    Navigator.pop(context);
                    sn.onChangeLanguageTap(context);
                  },
                ),
                12.verticalSpace,
                DrawerMenuTile(
                  iconAsset: AppConstants.SVG_ICON_SUN_MOON,
                  title: S.current.switchTheme,
                  subtitle: themeLabel,
                  onTap: () {
                    Navigator.pop(context);
                    sn.onThemeSwitcherTap(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _themeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return S.current.themeLight;
      case ThemeMode.dark:
        return S.current.themeDark;
      case ThemeMode.system:
        return S.current.themeSystem;
    }
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final onPrimary = colorScheme.onPrimary;
    final logoBrightness = ThemeData.estimateBrightnessForColor(
      colorScheme.primary,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28.r)),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 24.h),
          child: Row(
            children: [
              Container(
                width: 56.r,
                height: 56.r,
                decoration: BoxDecoration(
                  color: onPrimary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.all(10.r),
                child: Image.asset(
                  AppConstants.appLogoForTheme(logoBrightness),
                  fit: BoxFit.contain,
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.TITLE_APP_NAME,
                      style: textTheme.titleLarge?.copyWith(
                        color: onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      S.current.drawerPreferences,
                      style: textTheme.bodyMedium?.copyWith(
                        color: onPrimary.withValues(alpha: 0.82),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerMenuTile extends StatelessWidget {
  const DrawerMenuTile({
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String iconAsset;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final appColors = context.appColors;

    return Semantics(
      button: true,
      label: title,
      child: Material(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              child: Row(
                children: [
                  Container(
                    width: 48.r,
                    height: 48.r,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    alignment: Alignment.center,
                    child: CustomImage.asset(
                      iconAsset,
                      width: 24.r,
                      height: 24.r,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  14.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleSmall?.copyWith(
                            color: appColors.ink,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(
                            color: appColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.horizontalSpace,
                  Icon(
                    Icons.chevron_right_rounded,
                    color: appColors.muted,
                    size: 24.r,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
