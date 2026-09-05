import 'dart:async';

import 'package:Sakeenah/core/theme/text_theme_styles.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/app_config.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/localization/localization_provider.dart';
import '../../../../../core/providers/internet_provider.dart';
import '../../../../../core/providers/theme_mode_provider.dart';
import '../../../../../core/theme/theme_extensions.dart';
import '../../../../../core/ui/widgets/curved_app_bar.dart';
import '../../../../../core/ui/widgets/custom_image.dart';
import '../../../../../core/ui/widgets/waiting_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../prayer_times/presentation/state_m/cubit/prayer_times_cubit.dart';
import '../../../../prayer_times/presentation/widgets/prayer_times_section.dart';
import '../../state_m/provider/home_screen_notifier.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          context.select<HomeScreenNotifier, bool>(
            (n) => n.isLoading || n.isLoadingGps,
          );

          final sn = context.read<HomeScreenNotifier>();

          return ModalProgressHUD(
            inAsyncCall: sn.isLoading || sn.isLoadingGps,
            progressIndicator: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const WaitingWidget(),
                if (sn.isLoadingGps) ...[
                  12.verticalSpace,
                  Text(
                    S.current.loadingYourAddress,
                    style: TextThemeStyles.bodyMedium,
                  ),
                ],
              ],
            ),
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              drawer: const _AppDrawer(),
              body: CurvedAppBarLayout(
                appBar: CurvedAppBar(
                  title: sn.getHomeScreenTitle(context),
                  showDrawerMenu: true,
                  automaticallyImplyLeading: false,
                ),
                body: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
                  child: const _HomePrayerTimesSection(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HomePrayerTimesSection extends StatefulWidget {
  const _HomePrayerTimesSection();

  @override
  State<_HomePrayerTimesSection> createState() =>
      _HomePrayerTimesSectionState();
}

class _HomePrayerTimesSectionState extends State<_HomePrayerTimesSection> {
  Timer? _countdownTimer;
  DateTime _clock = DateTime.now();

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _startCountdownTicker() {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() => _clock = DateTime.now());
      }
    });
  }

  bool _hasInternet(BuildContext context) =>
      context.read<InternetProvider>().hasInternet;

  @override
  Widget build(BuildContext context) {
    final sn = context.read<HomeScreenNotifier>();
    final hasInternet = _hasInternet(context);

    return BlocConsumer<PrayerTimesCubit, PrayerTimesState>(
      bloc: sn.prayerTimesCubit,
      listener: (context, state) {
        state.maybeWhen(
          loaded: (_, __, ___) => _startCountdownTicker(),
          orElse: () => _countdownTimer?.cancel(),
        );
      },
      builder: (context, state) {
        return PrayerTimesSection(
          state: state,
          clock: _clock,
          onPickMapLocation: () =>
              sn.pickMapLocation(context, hasInternet: hasInternet),
          onRetryGps: () => sn.retryPrayerGps(hasInternet: hasInternet),
        );
      },
    );
  }
}

class _AppDrawer extends StatelessWidget {
  const _AppDrawer();

  @override
  Widget build(BuildContext context) {
    final sn = Provider.of<HomeScreenNotifier>(context, listen: false);
    final themeMode = context.watch<ThemeModeProvider>().themeMode;
    final drawerTheme = AppConfig().resolveThemeDataForMode(themeMode, context);
    final colorScheme = drawerTheme.colorScheme;
    final locale = context.watch<LocalizationProvider>();

    final languageLabel = locale.currentLanguage == AppConstants.LANG_AR
        ? AppConstants.LANG_AR_OUTPUT
        : AppConstants.LANG_EN_OUTPUT;
    final themeLabel = _themeModeLabel(themeMode);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Theme(
      data: drawerTheme,
      child: Drawer(
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
            _DrawerHeader(colorScheme: colorScheme),
            8.verticalSpace,
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                children: [
                  _DrawerMenuTile(
                    iconAsset: AppConstants.SVG_ICON_LANGUAGES,
                    title: S.current.changeLanguage,
                    subtitle: languageLabel,
                    onTap: () {
                      Navigator.pop(context);
                      sn.onChangeLanguageTap(context);
                    },
                  ),
                  12.verticalSpace,
                  _DrawerMenuTile(
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

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;
    final isLight = brightness == Brightness.light;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isLight ? colorScheme.surfaceContainerHigh : colorScheme.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28.r)),
        border: isLight
            ? Border(bottom: BorderSide(color: colorScheme.outlineVariant))
            : null,
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
                  color: isLight
                      ? colorScheme.primaryContainer.withValues(alpha: 0.65)
                      : colorScheme.onPrimary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.all(10.r),
                child: Image.asset(
                  AppConstants.appLogoForTheme(brightness),
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
                        color: isLight
                            ? colorScheme.onSurface
                            : colorScheme.onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      S.current.drawerPreferences,
                      style: textTheme.bodyMedium?.copyWith(
                        color: isLight
                            ? colorScheme.onSurfaceVariant
                            : colorScheme.onPrimary.withValues(alpha: 0.82),
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

class _DrawerMenuTile extends StatelessWidget {
  const _DrawerMenuTile({
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
