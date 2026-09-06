import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../common/custom_modules/screen_notifier.dart';
import '../../common/local_storage.dart';
import '../../constants/app/app_settings.dart';
import '../../constants/enums/languages_enum.dart';
import '../../localization/flutter_localization.dart';
import '../../navigation/nav.dart';
import '../widgets/restart_widget.dart';
import 'language_screen.dart';

class LanguageScreenNotifier extends ScreenNotifier<LanguageScreenParam> {
  LanguageScreenNotifier(super.param)
    : _selectedLanguage = mapStringToLanguagesEnum(
        intl.Intl.getCurrentLocale(),
      ) {
    _initialLanguage = _selectedLanguage;
  }

  /// fields

  late final LanguagesEnum _initialLanguage;
  LanguagesEnum _selectedLanguage;

  /// setters
  set selectedLanguage(LanguagesEnum value) {
    _selectedLanguage = value;
    notifyListeners();
  }

  /// getters
  LanguagesEnum get selectedLanguage => _selectedLanguage;

  bool get hasChanges => _selectedLanguage != _initialLanguage;

  /// Applies the selected language. Returns `true` when first-start onboarding
  /// should navigate to [ThemeScreen].
  Future<bool> confirm(BuildContext context) async {
    if (hasChanges) {
      await Provider.of<LocalizationProvider>(
        context,
        listen: false,
      ).changeLanguage(
        Locale(mapLanguageEnumToString(_selectedLanguage)),
        context,
      );
    }

    if (!LocalStorage.languageFirstStartSelected) {
      await LocalStorage.persistLanguageFirstStartSelected(true);
      return true;
    }

    if (hasChanges && AppSettings.changeLangRestart) {
      RestartWidget.restartApp(context);
    } else {
      Nav.pop();
    }
    return false;
  }

  @override
  void closeNotifier() {
    this.dispose();
  }
}
