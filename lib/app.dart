import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:statusbarz/statusbarz.dart';

import 'core/providers/theme_mode_provider.dart';
import 'core/theme/themes_data.dart';
import 'core/common/app_config.dart';
import 'core/common/local_storage.dart';
import 'core/common/provider_list.dart';
import 'core/constants/app/app_constants.dart';
import 'core/localization/flutter_localization.dart';
import 'core/localization/global_widgets_with_kurdish_localization_delegate.dart';
import 'core/navigation/navigation_service.dart';
import 'core/navigation/route_generator.dart';
import 'core/ui/error_ui/error_widgets/global_error_widget.dart';
import 'core/ui/screens/language_screen.dart';
import 'core/ui/screens/theme_screen.dart';
import 'core/ui/widgets/internet_banner.dart';
import 'core/ui/widgets/restart_widget.dart';
import 'di/service_locator.dart';
import 'features/splash/presentation/screen/splash_screen.dart';
import 'generated/l10n.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RestartWidget(
      child: ScreenUtilInit(
        designSize: AppConfig.screenUtilDesignSize(),
        builder: (context, _) {
          return MultiProvider(
            providers: [...ApplicationProvider().dependItems],
            child: Consumer2<LocalizationProvider, ThemeModeProvider>(
              builder: (_, locProvider, themeProvider, __) {
                return ThemeProvider(
                  initTheme: AppConfig().resolveThemeDataForMode(
                    themeProvider.themeMode,
                  ),
                  builder: (_, theme) {
                    return RefreshConfiguration(
                      headerBuilder: () => WaterDropMaterialHeader(
                        backgroundColor:
                            ThemesData.lightTheme.colorScheme.primary,
                        distance: 40,
                      ),
                      child: StatusbarzCapturer(
                        child: MaterialApp(
                          debugShowCheckedModeBanner: false,
                          title: AppConstants.TITLE_APP_NAME,

                          /// Routing
                          navigatorKey:
                              getIt<NavigationService>().getNavigationKey,
                          onGenerateRoute:
                              getIt<NavigationRoute>().generateRoute,
                          initialRoute: "/",

                          navigatorObservers: [Statusbarz.instance.observer],

                          /// Setup app localization
                          supportedLocales: S.delegate.supportedLocales,
                          locale: locProvider.appLocal,

                          localizationsDelegates: [
                            S.delegate,

                            // Built-in localization of basic text for Material widgets
                            GlobalMaterialLocalizations.delegate,
                            // Built-in localization for text direction LTR/RTL
                            GlobalWidgetsWithKurdishLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                            DefaultCupertinoLocalizations.delegate,
                          ],

                          /// Run app at first time on device language
                          localeResolutionCallback: (locale, supportedLocales) {
                            if (locProvider.firstStart) {
                              /// Check if the current device locale is supported
                              for (var supportedLocale in supportedLocales) {
                                if (supportedLocale.languageCode ==
                                    locale!.languageCode) {
                                  /// Set _firstStart false
                                  locProvider.firstStartOff();

                                  /// Change language
                                  locProvider.changeLanguage(
                                    Locale(locale.languageCode),
                                    context,
                                  );
                                  return supportedLocale;
                                }
                              }

                              /// If the locale of the device is not supported, use the first one
                              /// from the list (English, in this case).
                              locProvider.changeLanguage(
                                supportedLocales.first,
                                context,
                              );
                              return supportedLocales.first;
                            } else
                              return null;
                          },

                          /// Theming — follow system by default (see LocalStorage.getThemeMode)
                          theme: ThemesData.lightTheme,
                          darkTheme: ThemesData.darkTheme,
                          themeMode: themeProvider.themeMode,

                          /// Init screen — language → theme → splash on first start
                          home: _resolveInitialScreen(),

                          // builder: DevicePreview.appBuilder,
                          builder: (context, widget) {
                            // return DevicePreview.appBuilder(context, widget!);
                            _handleGlobalError(widget);

                            return MediaQuery(
                              //Setting font does not change with system font size
                              data: MediaQuery.of(
                                context,
                              ).copyWith(textScaler: TextScaler.noScaling),
                              child: Stack(
                                children: [
                                  Positioned.fill(child: widget!),
                                  const Align(
                                    alignment: Alignment.bottomCenter,
                                    child: InternetBanner(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _resolveInitialScreen() {
    if (!LocalStorage.languageFirstStartSelected) {
      return const LanguageScreen(param: LanguageScreenParam());
    }
    if (!LocalStorage.themeFirstStartSelected) {
      return const ThemeScreen(param: ThemeScreenParam());
    }
    return const SplashScreen();
  }

  void _handleGlobalError(Widget? widget) {
    ErrorWidget.builder = (errorDetails) {
      return (widget is Scaffold || widget is Navigator)
          ? Scaffold(
              body: Center(
                child: GlobalErrorWidget(flutterErrorDetails: errorDetails),
              ),
            )
          : GlobalErrorWidget(flutterErrorDetails: errorDetails);
    };
  }

  @override
  void dispose() {
    ApplicationProvider().dispose(context);
    super.dispose();
  }
}
