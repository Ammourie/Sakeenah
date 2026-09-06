import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/providers/internet_provider.dart';
import '../../../../../core/ui/error_ui/errors_screens/error_widget.dart';
import '../../../../../core/ui/widgets/curved_app_bar.dart';
import '../../../../../core/ui/widgets/waiting_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/utils/location_label_utils.dart';
import '../../state_m/cubit/home_cubit.dart';
import '../../state_m/cubit/quran_radio_cubit.dart';
import '../../state_m/provider/home_screen_notifier.dart';
import '../../widgets/home_drawer.dart';
import '../../widgets/prayer_times_card.dart';
import '../../widgets/prayer_times_error_widget.dart';
import '../../widgets/quran_radio_error_widget.dart';
import '../../widgets/quran_radio_section.dart';

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
    final hasInternet = context.read<InternetProvider>().hasInternet;

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
        backgroundColor: Colors.transparent,
        drawer: const HomeDrawer(),
        body: CurvedAppBarLayout(
          appBar: CurvedAppBar(
            title: sn.getHomeScreenTitle(context),
            showDrawerMenu: true,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: sn.homeCubit,
                  builder: (context, state) {
                    return _buildPrayerSection(
                      context: context,
                      state: state,
                      sn: sn,
                      hasInternet: hasInternet,
                    );
                  },
                ),
                24.verticalSpace,
                BlocBuilder<QuranRadioCubit, QuranRadioState>(
                  bloc: sn.quranRadioCubit,
                  builder: (context, state) {
                    return _buildRadioSection(
                      context: context,
                      state: state,
                      sn: sn,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrayerSection({
    required BuildContext context,
    required HomeState state,
    required HomeScreenNotifier sn,
    required bool hasInternet,
  }) {
    return state.maybeWhen(
      initial: () => const SizedBox.shrink(),
      prayerTimesLoading: () => PrayerTimesCard.dummy(),
      prayerTimesLoaded: (schedule) {
        final location = sn.selectedLocation;
        final label = location != null
            ? LocationLabelUtils.readableLabel(
                location,
                fallback: S.current.locationAreaFallback,
              )
            : S.current.locationAreaFallback;

        return PrayerTimesCard(
          schedule: schedule,
          clock: DateTime.now(),
          label: label,
          onChangeLocation: () => sn.changeLocation(
            context: context,
            hasInternet: context.read<InternetProvider>().hasInternet,
          ),
        );
      },
      prayerTimesError: (_, __) => PrayerTimesErrorWidget(
        onRefresh: () {
          sn.getPrayerTimes(hasInternet: hasInternet);
        },
        onChangeLocation: () => sn.changeLocation(
          context: context,
          hasInternet: hasInternet,
        ),
      ),
      orElse: () => const ScreenNotImplementedErrorWidget(),
    );
  }

  Widget _buildRadioSection({
    required BuildContext context,
    required QuranRadioState state,
    required HomeScreenNotifier sn,
  }) {
    return state.maybeWhen(
      initial: () => const SizedBox.shrink(),
      loaded: (player) => QuranRadioSection(
        radio: player,
        onPlay: sn.onPlayRadio,
        onPause: sn.onPauseRadio,
        onVolumeChanged: sn.onRadioVolumeChanged,
        onToggleMute: sn.onToggleRadioMute,
        onSeekBackward: sn.onSeekRadioBackward,
        onSeekForward: sn.onSeekRadioForward,
        onSeekToProgress: sn.onSeekRadioToProgress,
        onStop: sn.onStopRadio,
        onRetry: sn.onRetryRadio,
      ),
      error: (error, callback) => QuranRadioErrorWidget(
        error: error,
        onRetry: callback,
      ),
      orElse: () => const ScreenNotImplementedErrorWidget(),
    );
  }
}
