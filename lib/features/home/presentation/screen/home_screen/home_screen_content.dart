import 'package:Sakeenah/features/home/presentation/widgets/home_drawer.dart';
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
import '../../state_m/provider/home_screen_notifier.dart';
import '../../widgets/prayer_times_card.dart';
import '../../widgets/prayer_times_error_widget.dart';

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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        drawer: const HomeDrawer(),
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
                  homeInitState: () => const SizedBox.shrink(),
                  homeLoadingState: () => PrayerTimesCard.dummy(),
                  prayerTimesLoadedState: (schedule) {
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
                        hasInternet: context
                            .read<InternetProvider>()
                            .hasInternet,
                      ),
                    );
                  },
                  homeErrorState: (_, __) => PrayerTimesErrorWidget(
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
