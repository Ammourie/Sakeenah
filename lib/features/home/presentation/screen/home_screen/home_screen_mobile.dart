import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/app_config.dart';
import '../../../../../core/navigation/nav.dart';
import '../../../../../core/theme/custom_theme_colors.dart';
import '../../../../../core/ui/clippers/theme_circle_clipper.dart';
import '../../../../../core/ui/widgets/restart_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../notification/presentation/screen/notifications/notifications_screen.dart';
import '../../state_m/provider/home_screen_notifier.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Theme(
        data: Theme.of(context),
        child: ModalProgressHUD(
          inAsyncCall: provider(context).isLoading,
          child: _buildHomeScreen(context),
        ),
      ),
    );
  }

  Scaffold _buildHomeScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          provider(context).getHomeScreenTitle(context),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Nav.to(
                NotificationsScreen.routeName,
                arguments: NotificationsScreenParam(),
              );
            },
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: _buildHomeScreenBody(context),
      drawer: _drawerList(context),
      bottomNavigationBar: _buildNavBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  int _selectedPage = 0;

  Widget _buildNavBar() {
    return NavigationBar(
      destinations: [
        const NavigationDestination(
          selectedIcon: Icon(Icons.home_outlined),
          icon: Icon(Icons.home),
          label: "Home",
        ),
        const NavigationDestination(
          selectedIcon: Icon(Icons.person_outline),
          icon: Icon(Icons.person),
          label: "Profile",
        ),
        const NavigationDestination(
          selectedIcon: Icon(Icons.headphones_outlined),
          icon: Icon(Icons.headphones),
          label: "Contact us",
        ),
        const NavigationDestination(
          selectedIcon: Icon(Icons.settings_outlined),
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
      onDestinationSelected: (value) {
        setState(() {
          _selectedPage = value;
        });
      },
      selectedIndex: _selectedPage,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    );
  }

  bool valueTrue = true;
  String? selectedValue;

  Padding _buildHomeScreenBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            24.verticalSpace,
            const Text("Translation test"),
            10.verticalSpace,
            Text(S.current.welcome),
            20.verticalSpace,
            const Align(child: CircularProgressIndicator()),
            50.verticalSpace,
            const Align(child: LinearProgressIndicator()),
            50.verticalSpace,
            const Align(child: RefreshProgressIndicator()),
            20.verticalSpace,
            TextButton(
              onPressed: () async {
                RestartWidget.restartApp(AppConfig().appContext!);
                print("j");
                // await showDialog(
                //   context: context,
                //   builder: (context) {
                //     return Dialog.fullscreen(
                //       child: Text("hello"),
                //     );
                //   },
                // );
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text("hello"),
                //     action: SnackBarAction(
                //       label: "close",
                //       onPressed: () {
                //         ScaffoldMessenger.of(context).clearSnackBars();
                //       },
                //     ),
                //   ),
                // );
                // await showDatePicker(
                //   context: context,
                //   initialDate: DateTime.now(),
                //   firstDate: DateTime(1950, 1, 1),
                //   lastDate: DateTime(2050, 1, 1),
                // );
                // await showTimePicker(
                //   context: context,
                //   initialTime: TimeOfDay.now(),
                // );
              },
              child: const Text("Test Custom theme color"),
              style: TextButton.styleFrom(
                backgroundColor:
                    Theme.of(
                      context,
                    ).extension<CustomThemeColors>()!.testButtonColor,
              ),
            ),
            Switch(
              value: valueTrue,
              onChanged: (value) {
                setState(() {
                  valueTrue = !valueTrue;
                });
              },
            ),
            Checkbox(
              value: valueTrue,
              onChanged: (value) {
                setState(() {
                  valueTrue = !valueTrue;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.secondaryContainer,
                filled: true,
                labelText: 'label',
                alignLabelWithHint: true,
                border: border,
                errorBorder: border,
                enabledBorder: border,
                focusedBorder: border,
                disabledBorder: border,
                focusedErrorBorder: border,
              ),
            ),
            60.verticalSpace,
            SizedBox(
              width: 1.sw,
              child: Align(
                child: DropdownMenu<String>(
                  // value: selectedValue,
                  dropdownMenuEntries:
                      ["ali", "elias"]
                          .map(
                            (e) =>
                                DropdownMenuEntry<String>(value: e, label: e),
                          )
                          .toList(),
                  onSelected: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  enableFilter: true,
                ),
              ),
            ),
            MediaQuery.of(context).viewInsets.bottom.verticalSpace,
          ],
        ),
      ),
    );
  }

  UnderlineInputBorder get border => UnderlineInputBorder(
    borderSide: const BorderSide(
      style: BorderStyle.none,
      width: 0,
      strokeAlign: 0,
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(35.r),
  );

  Widget _drawerList(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Theme.of(context).colorScheme.primary,
                child: DrawerHeader(
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: _themeSwitcher(),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  S.current.changeLanguage,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () {
                  provider(
                    context,
                    listen: false,
                  ).onChangeLanguageDialogTap(context);
                },
                trailing: const Icon(Icons.language),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  S.current.justLog,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () {
                  provider(context, listen: false).onJustLogTap();
                },
                trailing: const Icon(Icons.info),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  S.current.testSuccessRequest,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () {
                  provider(context, listen: false).onTestSuccessRequestTap();
                },
                trailing: const Icon(Icons.check),
              ),
              ListTile(
                title: Text(
                  S.current.testFailureRequest,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () {
                  provider(context, listen: false).onTestFailurRequestTap();
                },
                trailing: const Icon(Icons.close),
              ),
              ListTile(
                title: Text(
                  S.current.testValidatorRequest,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () {
                  provider(context, listen: false).onTestValidatorRequestTap();
                },
                trailing: const Icon(Icons.vertical_align_top_rounded),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  S.current.getPeople,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () {
                  provider(context, listen: false).onGetPeopleTap(context);
                },
                trailing: const Icon(Icons.people),
              ),
              ListTile(
                title: Text(
                  "Get Comments",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () {
                  provider(context, listen: false).onGetCommentsTap(context);
                },
                trailing: const Icon(Icons.comment),
              ),
              ListTile(
                title: Text(
                  "Map",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () {
                  provider(context, listen: false).onMapTap();
                },
                trailing: const Icon(Icons.map),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  S.current.getPokemons,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () {
                  provider(context, listen: false).onGetPokemonsTap(context);
                },
                trailing: const Icon(Icons.catching_pokemon),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  S.current.testErrorScreen,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () {
                  Navigator.of(
                    context,
                    // ignore: null_check_always_fails
                  ).push(MaterialPageRoute(builder: (context) => null!));
                },
                trailing: const Icon(Icons.report_gmailerrorred_outlined),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  S.current.chatList,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () => provider(context, listen: false).onChatListTap(),
                trailing: const Icon(Icons.chat),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  S.current.logOut,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap:
                    () => provider(context, listen: false).onLogoutTap(context),
                trailing: const Icon(Icons.logout),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _themeSwitcher() {
    return ThemeSwitcher(
      clipper: const CustomThemeSwitcherCircleClipper(),
      builder: (context) {
        return IconButton(
          icon: Icon(provider(context).getThemeIcon(context)),
          onPressed: () {
            provider(context, listen: false).onThemeSwitcherTap(context);
          },
        );
      },
    );
  }

  /// Logic

  HomeScreenNotifier provider(BuildContext context, {bool listen = true}) =>
      Provider.of<HomeScreenNotifier>(context, listen: listen);
}
