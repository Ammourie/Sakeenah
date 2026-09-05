import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/localization/localization_provider.dart';
import '../../../../../core/providers/theme_mode_provider.dart';
import '../../../../../core/theme/theme_extensions.dart';
import '../../../../../core/ui/widgets/curved_app_bar.dart';
import '../../../../../core/ui/widgets/custom_image.dart';
import '../../../../../core/ui/widgets/waiting_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../state_m/cubit/home_cubit.dart';
import '../../state_m/provider/home_screen_notifier.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isBusy = context.select<HomeScreenNotifier, bool>(
      (n) => n.isLoading || n.isLoadingGps,
    );
    final isLoadingGps = context.select<HomeScreenNotifier, bool>(
      (n) => n.isLoadingGps,
    );

    final sn = context.read<HomeScreenNotifier>();
    final textTheme = Theme.of(context).textTheme;

    return ModalProgressHUD(
      inAsyncCall: isBusy,
      progressIndicator: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const WaitingWidget(),
          if (isLoadingGps) ...[
            12.verticalSpace,
            Text(S.current.loadingYourAddress, style: textTheme.bodyMedium),
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
            child: BlocBuilder<HomeCubit, HomeState>(
              bloc: sn.homeCubit,
              builder: (context, state) {
                return state.maybeWhen(
                  prayerTimesLoadedState: (schedule) => Text(
                    'Prayer Times Loaded ${schedule.prayers.map((e) => e.name).join(', ')}',
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
            // child: const _HomePrayerTimesCard(),
          ),
        ),
      ),
    );
  }
}

// class _HomePrayerTimesCard extends StatefulWidget {
//   const _HomePrayerTimesCard();

//   @override
//   State<_HomePrayerTimesCard> createState() => _HomePrayerTimesCardState();
// }

// class _HomePrayerTimesCardState extends State<_HomePrayerTimesCard> {
//   Timer? _countdownTimer;
//   DateTime _clock = DateTime.now();
//   bool _countdownRefreshInFlight = false;

//   @override
//   void dispose() {
//     _countdownTimer?.cancel();
//     super.dispose();
//   }

//   void _startCountdownTicker() {
//     _countdownTimer?.cancel();
//     _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
//       _handleCountdownTick();
//     });
//   }

//   void _handleCountdownTick() {
//     if (!mounted) return;

//     final previousClock = _clock;
//     final now = DateTime.now();
//     final sn = context.read<HomeScreenNotifier>();
//     final hasInternet = context.read<InternetProvider>().hasInternet;

//     sn.prayerTimesCubit.state.maybeWhen(
//       loaded: (schedule, _, __) {
//         final nextInfo = PrayerTimesUtils.nextPrayerInfo(
//           schedule,
//           previousClock,
//         );
//         if (nextInfo == null) return;

//         final target = nextInfo.prayer.time;
//         if (target != null &&
//             previousClock.isBefore(target) &&
//             !now.isBefore(target)) {
//           _refreshPrayerTimesAfterCountdown(sn, hasInternet);
//         }
//       },
//       orElse: () {},
//     );

//     setState(() => _clock = now);
//   }

//   Future<void> _refreshPrayerTimesAfterCountdown(
//     HomeScreenNotifier sn,
//     bool hasInternet,
//   ) async {
//     if (_countdownRefreshInFlight) return;
//     _countdownRefreshInFlight = true;
//     try {
//       // await sn.refreshPrayerTimesOnCountdownEnd(hasInternet: hasInternet);
//     } finally {
//       _countdownRefreshInFlight = false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sn = context.read<HomeScreenNotifier>();
//     final hasInternet = context.read<InternetProvider>().hasInternet;

//     return BlocConsumer<PrayerTimesCubit, PrayerTimesState>(
//       bloc: sn.prayerTimesCubit,
//       listener: (context, state) {
//         state.maybeWhen(
//           loaded: (_, __, ___) => _startCountdownTicker(),
//           orElse: () => _countdownTimer?.cancel(),
//         );
//       },
//       builder: (context, state) {
//         return _buildPrayerTimesCard(
//           context,
//           state: state,
//           clock: _clock,
//           onPickMapLocation: () =>
//               sn.pickMapLocation(context, hasInternet: hasInternet),
//           // onRetryGps: () => sn.retryPrayerGps(hasInternet: hasInternet),
//           onRetryGps: () {},
//         );
//       },
//     );
//   }

//   Widget _buildPrayerTimesCard(
//     BuildContext context, {
//     required PrayerTimesState state,
//     required DateTime clock,
//     required VoidCallback onPickMapLocation,
//     required VoidCallback onRetryGps,
//   }) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;

//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: colorScheme.surfaceContainer,
//         borderRadius: BorderRadius.circular(20.r),
//         border: Border.all(color: colorScheme.outlineVariant),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   S.current.prayerTimesTitle,
//                   style: textTheme.titleLarge?.copyWith(
//                     color: colorScheme.onSurface,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//               TextButton(
//                 onPressed: onPickMapLocation,
//                 child: Text(S.current.pickLocationOnMapTitle),
//               ),
//             ],
//           ),
//           state.maybeWhen(
//             initial: () => const SizedBox.shrink(),
//             loading: () => Padding(
//               padding: EdgeInsets.symmetric(vertical: 32.h),
//               child: const WaitingWidget(),
//             ),
//             noLocation: () => _buildNoLocation(
//               context,
//               onPickMapLocation: onPickMapLocation,
//               onRetryGps: onRetryGps,
//             ),
//             error: (error, callback) => _buildError(context, callback),
//             loaded: (schedule, location, isCached) => _buildLoadedPrayerTimes(
//               context,
//               schedule: schedule,
//               location: location,
//               isCached: isCached,
//               clock: clock,
//             ),
//             orElse: () => const SizedBox.shrink(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNoLocation(
//     BuildContext context, {
//     required VoidCallback onPickMapLocation,
//     required VoidCallback onRetryGps,
//   }) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         8.verticalSpace,
//         Text(
//           S.current.noLocationMessage,
//           style: textTheme.bodyMedium?.copyWith(
//             color: colorScheme.onSurfaceVariant,
//           ),
//         ),
//         16.verticalSpace,
//         FilledButton(
//           onPressed: onPickMapLocation,
//           child: Text(S.current.pickLocationOnMapTitle),
//         ),
//         8.verticalSpace,
//         OutlinedButton(
//           onPressed: onRetryGps,
//           child: Text(S.current.useGpsLocation),
//         ),
//       ],
//     );
//   }

//   Widget _buildError(BuildContext context, VoidCallback callback) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         8.verticalSpace,
//         Text(
//           S.current.faildToFetchData,
//           style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
//         ),
//         16.verticalSpace,
//         FilledButton(onPressed: callback, child: Text(S.current.retry)),
//       ],
//     );
//   }

//   Widget _buildLoadedPrayerTimes(
//     BuildContext context, {
//     required DailyPrayerScheduleEntity schedule,
//     required LocationPreferenceEntity location,
//     required bool isCached,
//     required DateTime clock,
//   }) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;
//     final locale = Localizations.localeOf(context).languageCode;
//     final use24Hour = MediaQuery.alwaysUse24HourFormatOf(context);
//     final nextInfo = PrayerTimesUtils.nextPrayerInfo(schedule, clock);
//     final nextName = nextInfo?.prayer.name;

//     final sortedPrayers = List.from(schedule.prayers)
//       ..sort((a, b) => a.time.compareTo(b.time));

//     return AnimatedWrapper(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         4.verticalSpace,
//         Text(
//           DateUtility.formatLocalFullDate(schedule.date, locale: locale),
//           style: textTheme.labelLarge?.copyWith(
//             color: colorScheme.onSurfaceVariant,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         4.verticalSpace,
//         Text(
//           S.current.prayerLocationLabel(
//             LocationLabelUtils.readableLabel(
//               location,
//               fallback: S.current.locationAreaFallback,
//             ),
//           ),
//           style: textTheme.bodySmall?.copyWith(
//             color: colorScheme.onSurfaceVariant,
//           ),
//         ),
//         if (isCached) ...[
//           4.verticalSpace,
//           Text(
//             S.current.cachedPrayerTimes,
//             style: textTheme.labelMedium?.copyWith(
//               color: colorScheme.secondary,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//         if (nextInfo != null) ...[
//           16.verticalSpace,
//           NextPrayerBanner(
//             countdownLabel: S.current.nextPrayerIn(
//               nextInfo.prayer.name?.localized() ?? '',
//               DateUtility.formatLocalDuration(
//                 nextInfo.remaining,
//                 locale: locale,
//                 hourUnitOne: S.current.durationHourUnitOne,
//                 hourUnitOther: S.current.durationHourUnitOther,
//                 minuteUnitOne: S.current.durationMinuteUnitOne,
//                 minuteUnitOther: S.current.durationMinuteUnitOther,
//               ),
//             ),
//           ),
//         ],
//         16.verticalSpace,
//         ...sortedPrayers.map((prayer) {
//           return Padding(
//             padding: EdgeInsets.only(bottom: 8.h),
//             child: PrayerRow(
//               name: prayer.name,
//               timeLabel: DateUtility.formatLocalTime(
//                 prayer.time,
//                 locale: locale,
//                 use24HourFormat: use24Hour,
//               ),
//               isNext: prayer.name == nextName,
//             ),
//           );
//         }),
//       ],
//     );
//   }
// }

class _AppDrawer extends StatelessWidget {
  const _AppDrawer();

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
