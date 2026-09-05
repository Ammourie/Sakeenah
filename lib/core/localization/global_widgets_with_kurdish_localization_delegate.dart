// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Localized values for widgets.
///
/// Currently this class just maps [locale] to [textDirection]. All locales
/// are [TextDirection.ltr] except for locales with the following
/// [Locale.languageCode] values, which are [TextDirection.rtl]:
///
///   * ar - Arabic
///   * fa - Farsi
///   * he - Hebrew
///   * ps - Pashto
///   * sd - Sindhi
///   * ur - Urdu
///   * ku - Kurdish
class GlobalWidgetsWithKurdishLocalizations implements WidgetsLocalizations {
  /// Construct an object that defines the localized values for the widgets
  /// library for the given `locale`.
  ///
  /// [LocalizationsDelegate] implementations typically call the static [load]
  /// function, rather than constructing this class directly.
  GlobalWidgetsWithKurdishLocalizations(this.locale) {
    final String language = locale.languageCode.toLowerCase();
    _textDirection = _rtlLanguages.contains(language)
        ? TextDirection.rtl
        : TextDirection.ltr;
  }

  // See http://en.wikipedia.org/wiki/Right-to-left
  static const List<String> _rtlLanguages = <String>[
    'ar', // Arabic
    'fa', // Farsi
    'he', // Hebrew
    'ps', // Pashto
    'ur', // Urdu
    'ku', // Kurdish
  ];

  /// The locale for which the values of this class's localized resources
  /// have been translated.
  final Locale locale;

  @override
  TextDirection get textDirection => _textDirection;
  late TextDirection _textDirection;

  /// Creates an object that provides localized resource values for the
  /// lowest levels of the Flutter framework.
  ///
  /// This method is typically used to create a [LocalizationsDelegate].
  /// The [WidgetsApp] does so by default.
  static Future<WidgetsLocalizations> load(Locale locale) {
    return SynchronousFuture<WidgetsLocalizations>(
      GlobalWidgetsWithKurdishLocalizations(locale),
    );
  }

  /// A [LocalizationsDelegate] that uses [GlobalWidgetsLocalizations.load]
  /// to create an instance of this class.
  ///
  /// [WidgetsApp] automatically adds this value to [WidgetsApp.localizationsDelegates].
  static const LocalizationsDelegate<WidgetsLocalizations> delegate =
      _WidgetsLocalizationsDelegate();

  @override
  String get reorderItemDown => 'بگوازە خوارەوە';

  @override
  String get reorderItemLeft => 'بگوازە بۆ چەپ';

  @override
  String get reorderItemRight => 'بگوازە بۆ راست';

  @override
  String get reorderItemToEnd => 'بگوازە بۆ کۆتایی';

  @override
  String get reorderItemToStart => 'بگوازە بۆ دەستپێک';

  @override
  String get reorderItemUp => 'بگوازە سەرەوە';

  @override
  String get copyButtonLabel => 'کۆپی';

  @override
  String get cutButtonLabel => 'بڕین';

  @override
  String get lookUpButtonLabel => 'گەڕان';

  @override
  String get pasteButtonLabel => 'دانەوە';

  @override
  String get searchWebButtonLabel => 'گەڕان لە وێب';

  @override
  String get selectAllButtonLabel => 'هەموو هەڵبژێرە';

  @override
  String get shareButtonLabel => 'هاوبەشکردن';

  @override
  String get noResultsFound => 'هیچ ئەنجامێک نەدۆزرایەوە';

  @override
  String get searchResultsFound => 'ئەنجامەکانی گەڕان دۆزرایەوە';

  @override
  String get radioButtonUnselectedLabel => 'هەڵنەخراو';
}

class _WidgetsLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const _WidgetsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<WidgetsLocalizations> load(Locale locale) =>
      GlobalWidgetsWithKurdishLocalizations.load(locale);

  @override
  bool shouldReload(_WidgetsLocalizationsDelegate old) => false;

  @override
  String toString() => 'GlobalWidgetsLocalizations.delegate(all locales)';
}
