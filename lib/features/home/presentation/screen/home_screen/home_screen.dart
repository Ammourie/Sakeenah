import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../../core/providers/internet_provider.dart';
import '../../../../../core/ui/screens/base_screen.dart';
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
  InternetProvider? _internetProvider;
  bool? _lastHasInternet;
  bool _didRequestInitialPrayerTimes = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    provider = HomeScreenNotifier(widget.param);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final internet = context.read<InternetProvider>();
    if (_internetProvider != internet) {
      _internetProvider?.removeListener(_onInternetChanged);
      _internetProvider = internet;
      _lastHasInternet = internet.hasInternet;
      _internetProvider!.addListener(_onInternetChanged);
    }

    if (_didRequestInitialPrayerTimes) return;
    _didRequestInitialPrayerTimes = true;

    provider.getPrayerTimes(
      hasInternet: context.read<InternetProvider>().hasInternet,
    );
  }

  void _onInternetChanged() {
    final hasInternet = _internetProvider?.hasInternet ?? true;
    if (_lastHasInternet == hasInternet) return;

    _lastHasInternet = hasInternet;
    provider.onInternetConnectivityChanged(hasInternet: hasInternet);
  }

  @override
  void dispose() {
    _internetProvider?.removeListener(_onInternetChanged);
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
            prayerTimesLoading: () {
              provider.isLoading = true;
            },
            prayerTimesLoaded: (schedule) {
              provider.isLoading = false;
              provider.cachePrayerTimesAndLocation(schedule);
            },
            prayerTimesError: (_, __) {
              provider.isLoading = false;
            },
          );
        },

        child: const HomeScreenContent(),
      ),
    );
  }
}
