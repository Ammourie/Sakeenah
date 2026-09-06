import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import '../../../../../core/common/hive_helper.dart';
import '../../../../../core/providers/internet_provider.dart';
import '../../../../../core/ui/screens/base_screen.dart';

import '../../../data/request/model/daily_prayer_schedule_model.dart';
import '../../../domain/entity/daily_prayer_schedule_entity.dart';
import '../../state_m/cubit/home_cubit.dart';

import '../../state_m/provider/home_screen_notifier.dart';

import 'home_screen_content.dart';

class HomeScreenParam {}

class HomeScreen extends BaseScreen<HomeScreenParam> {
  static const routeName = "/HomeScreen";

  HomeScreen({required HomeScreenParam param, Key? key})
    : super(param: param, key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late final HomeScreenNotifier provider;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    provider = HomeScreenNotifier(widget.param);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    provider.getPrayerTimes(
      hasInternet: context.read<InternetProvider>().hasInternet,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    provider.closeNotifier();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state != AppLifecycleState.resumed) return;
    if (provider.selectedLocation != null) return;

    provider.getPrayerTimes(
      hasInternet: context.read<InternetProvider>().hasInternet,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenNotifier>.value(
      value: provider,
      child: BlocListener<HomeCubit, HomeState>(
        bloc: provider.homeCubit,
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            homeInitState: () {},
            homeLoadingState: () {
              provider.isLoading = true;
            },
            homeLoadedState: (s) {
              provider.isLoading = false;
            },
            homeErrorState: (error, callback) {
              provider.isLoading = false;
            },
            prayerTimesLoadedState: (schedule) {
              provider.isLoading = false;
              _cachePrayerTimes(schedule);
            },
          );
        },

        child: const HomeScreenContent(),
      ),
    );
  }

  Future<void> _cachePrayerTimes(DailyPrayerScheduleEntity schedule) async {
    final model = DailyPrayerScheduleModel.fromEntity(schedule);
    final date = schedule.date ?? DateTime.now();
    final scheduleDate =
        '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';

    await HiveHelper.putPrayerSchedule(
      schedule: model.toMap(),
      scheduleDate: scheduleDate,
    );
  }
}
