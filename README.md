# Sakeenah | سكينة

Flutter app for daily prayer times and Quran radio — built with Material 3, Arabic/English support, and a calm emerald & gold visual identity.

تطبيق Flutter لمواقيت الصلاة والراديو القرآني — بتصميم Material 3، دعم العربية والإنجليزية، وهوية بصرية هادئة بالزمردي والذهبي.

---

## English

### About the app

**Sakeenah** (سكينة — *tranquility*) opens with a short setup, then lands on a home screen ready for prayer times and Quran radio. The features below are **live in the app today**.

---

### Features

#### 1. First launch journey

On the very first open, the app guides the user through:

**Language** → **Appearance** → **Splash** → **Home**

After that, every launch goes **Splash** → **Home**.

- **How it works:** `lib/app.dart` checks `LocalStorage` flags (`languageFirstStartSelected`, `themeFirstStartSelected`) and picks the first screen. Navigation uses named routes in `lib/core/navigation/route_generator.dart`.

---

#### 2. Language selection

Choose **English** or **Arabic (العربية)** with a centered card layout on a soft wallpaper background.

- **First launch:** full-screen onboarding; user must confirm to continue.
- **From the drawer:** same screen with a back button; the app restarts to apply the new locale.
- **How it works:**
  - UI: `lib/core/ui/screens/language_screen.dart`
  - State: `LanguageScreenNotifier` + `LocalizationProvider`
  - Strings: `lib/l10n/intl_en.arb`, `lib/l10n/intl_ar.arb` → `S.current.*`
  - Arabic enables **RTL** automatically via `flutter_localizations`.

---

#### 3. Appearance (light / dark / system)

Pick **Light**, **Dark**, or **System** with a live preview — the screen updates instantly as you tap an option.

- **First launch:** confirm to save and continue to splash.
- **From the drawer:** back button returns to home; confirm saves without restarting the app.
- **How it works:**
  - UI: `lib/core/ui/screens/theme_screen.dart`
  - State: `ThemeScreenNotifier` + `ThemeModeProvider`
  - Persistence: `LocalStorage.persistThemeMode`
  - `MaterialApp.themeMode` updates immediately; optional smooth transition via `animated_theme_switcher`.

---

#### 4. Splash screen

A short branded screen (~2.2s) with the app illustration, name, and loading indicator, then navigation to home. While visible, the app **prefetches the country list** for the manual location picker so the picker opens faster.

- **How it works:** `lib/features/splash/presentation/screen/splash_screen.dart` — uses `AppWallpaper`, theme-aware logo, and `WaitingWidget`; calls `CountriesSessionProvider.prefetchCountries()` on first frame.

---

#### 5. Home, prayer times & navigation drawer

The main screen has a **curved emerald app bar**, a **prayer times card**, a **Quran radio player**, and a **drawer** for settings.

**Prayer times**
- Loads today's salah times from the **AlAdhan API** using GPS coordinates, a map-picked location, or a **manual country/city** selection.
- Highlights the next prayer and shows a countdown banner.
- Supports **offline mode** by reading the cached daily schedule from Hive.
- Shows a skeleton prayer card while loading and an inline error card with **Retry** and **Change location**.
- Caches successful loaded schedules from the home screen listener.

**Change location**
- Tapping **Change location** (on the prayer card or error state) opens a bottom sheet:
  - **Pick from map** — Google Maps pin picker with theme-aware dark map style.
  - **Country / city picker** — searchable dropdowns backed by **CountriesNow** (English names; used directly for AlAdhan `timingsByCity`).
- Selected location is stored in `HomeScreenNotifier` as `_selectedLocation` and reused until the user changes it again.
- If GPS is denied, the user can still set location manually without the app closing.

**Location data & caching**
- Countries prefetched on splash into `CountriesSessionProvider` (in-memory session cache).
- Countries and per-country cities cached in **Hive** after first successful fetch.
- Remote datasource is **cache-first**: if Hive has data, the network is skipped (online or offline).
- Cities endpoint: `GET /countries/cities/q?country={name}` (CountriesNow v0.1).

**App bar**
- Title bar with rounded bottom curve, stacked over the body so the curve stays visible.
- Menu icon opens the drawer.

**Drawer**
- Header with app name and logo (styled for light and dark).
- **Change language** — shows current language (English / العربية).
- **Switch theme** — shows current mode (Light / Dark / System).

- **How it works:**
  - `lib/features/home/presentation/screen/home_screen/home_screen_content.dart`
  - Prayer card: `lib/features/home/presentation/widgets/prayer_times_card.dart`
  - Error card: `lib/features/home/presentation/widgets/prayer_times_error_widget.dart`
  - Location chooser: `lib/features/home/presentation/widgets/location_source_chooser_sheet.dart`
  - Map picker: `lib/features/home/presentation/screen/map_location_picker_screen.dart`
  - Manual picker: `lib/features/home/presentation/screen/manual_location_picker_screen.dart`
  - State: `HomeCubit` + `HomeScreenNotifier` (prayer times); `QuranRadioCubit` (radio) — both created in `home_screen_notifier.dart`
  - Prayer + location repository: `lib/features/home/domain/repository/home_repository.dart`
  - Remote/local datasources: `lib/features/home/data/datasource/ihome_remote_datasource.dart`
  - Session cache: `lib/core/providers/countries_session_provider.dart`
  - Searchable dropdown UI: `lib/core/ui/widgets/dropdown/search_dropdown/custom_search_dropdown.dart`
  - Bar: `CurvedAppBar` inside `CurvedAppBarLayout` (body `Stack`, not `Scaffold.appBar`)
  - Drawer theme resolved via `AppConfig().resolveThemeDataForMode` so light/dark colors apply correctly.

**Quran radio**
- Live stream from RadioJar (`AppConstants.QURAN_RADIO_STREAM_URL`).
- **Play / pause**, **volume slider** (0–1, SoLoud engine max), and **mute toggle** (restores last volume).
- **Stop** — tears down HTTP stream, clears buffer, returns to idle (play starts fresh).
- **Skip back / forward** (±10 seconds) within audio already buffered in memory — not a full broadcast rewind.
- **Seekable playback slider** — scrub within the buffered window; label shows `{position} / {buffered}` (e.g. `1:23 / 4:56`).
- Connecting spinner, inline error overlay on the player card, and **Retry** when the stream fails.
- **Full-section error card** (`QuranRadioErrorWidget`) for action/bootstrap failures — handled in `home_screen_content.dart` via `QuranRadioState.error`.
- **Auto-restart:** if playback was active when the network dropped (or the buffer ran out offline), the stream **retries automatically** when connectivity returns (`InternetProvider` in foreground; `QuranRadioAudioHandler` in background).
- **Background playback:** `audio_service` + `audio_session` — media notification and lock-screen play/pause/stop/skip; audio-focus pause on calls; handler-level reconnect with backoff.
- **Home init:** opening home stops/resets any prior radio session before subscribing to player updates; cubit `close()` no longer stops active playback.
- **Engine:** [`flutter_soloud`](https://pub.dev/packages/flutter_soloud) `^4.1.7` with `BufferingType.preserved` (~10 min RAM cap) + Dio HTTP ingest (Icecast MP3, `Icy-MetaData` header).
- **Architecture:** single repository/datasource stack — `HomeCubit` (prayer) + `QuranRadioCubit` (radio) → use cases → `HomeRepository` → `QuranRadioPlayer` (`@lazySingleton` in `data/datasource/`). Background layer: `QuranRadioAudioHandler` wraps the same player. No separate radio feature module (see `.cursor/rules/home-single-layers.mdc`).

- **How it works:**
  - UI: `lib/features/home/presentation/widgets/quran_radio_section.dart`
  - Error card: `lib/features/home/presentation/widgets/quran_radio_error_widget.dart`
  - Player: `lib/features/home/data/datasource/quran_radio_player.dart`
  - Background handler: `lib/features/home/data/datasource/quran_radio_audio_handler.dart`
  - Bootstrap: `lib/core/audio/quran_radio_audio_service.dart` (called from `main.dart`)
  - State: flat Freezed unions — `HomeState` (`initial`, `prayerTimesLoading`, `prayerTimesLoaded`, `prayerTimesError`) and `QuranRadioState` (`initial`, `loaded`, `error`); entity payload in `RadioPlayerEntity`
  - Use cases (one file each under `domain/usecase/`): `PlayQuranRadioUseCase`, `PauseQuranRadioUseCase`, `StopQuranRadioUseCase`, `SetQuranRadioVolumeUseCase`, `SeekQuranRadioUseCase`, `SeekQuranRadioToUseCase`, `RetryQuranRadioUseCase`, `WatchQuranRadioUseCase`
  - Connectivity: `HomeScreen` → `InternetProvider` → `QuranRadioCubit`; background reconnect in `QuranRadioAudioHandler`

**Note:** After native changes, do a **full app restart** (not hot reload). iOS requires deployment target **13.0+** for `flutter_soloud`. Android requires foreground service permissions (see `AndroidManifest.xml`).

---

#### 6. Visual design & themes

Calm, warm palette across the whole app:

| Role | Light | Dark |
|------|-------|------|
| Primary | Deep emerald `#0F4C3A` | Same emerald on dark surfaces |
| Accent | Warm gold `#C9A24B` | Same gold |
| Background | Warm cream `#FAF6EE` | Deep charcoal green `#0B1512` |
| Text | Charcoal `#1F2622` | Light gray-green |

- **Typography:** Plus Jakarta Sans (English), Tajawal (Arabic) — `lib/core/theme/text_theme_styles.dart`
- **Semantic colors:** `context.appColors` (gold, ink, muted, card) from `CustomThemeColors`
- **How it works:** `lib/core/theme/app_color_schemes.dart`, `themes_data.dart`, Material 3 `ColorScheme`

---

#### 7. Onboarding wallpaper

Shared background for language, theme, and splash screens — cream/dark surface with a subtle grid and soft emerald/gold shapes.

- **How it works:** `lib/core/ui/widgets/app_wallpaper.dart` — `CustomPaint` using `colorScheme` roles so it adapts to light and dark.

---

#### 8. Prayer times data flow

The prayer-times feature uses a thin repository and keeps detailed behavior in datasources and presentation.

- `GetTodayPrayerTimesUseCase` is the only prayer-times use case.
- `HomeRepository` only chooses **local** when `isOffline == true`, otherwise **remote**.
- `HomeRemoteSource` calls AlAdhan by **coordinates** (`/timings`) or **city/country** (`/timingsByCity`) based on `LocationPreferenceEntity.source`.
- `HomeLocalSource` validates cached `locationKey` and cached day before returning data.
- `HomeScreen` writes the loaded schedule to Hive when `HomeState.prayerTimesLoaded` is emitted.
- Prayer-times request constants live in `get_today_prayer_times_params.dart`.
- Manual picker uses `GetCountriesUseCase` / `GetCitiesByCountryUseCase` → `HomeRepository` / `HomeRemoteSource` → CountriesNow → Hive + session cache.

---

#### 9. Internet connection banner

When the device goes offline, a bottom banner appears; it hides again when connection returns. While on home, **Quran radio** that was playing before disconnect auto-retries when connectivity is restored (manual pause/stop cancels auto-retry).

- **How it works:** `InternetProvider` listens for connectivity changes; `InternetBanner` is overlaid in `MaterialApp.builder` (`lib/app.dart`). `HomeScreen` forwards connectivity changes to `QuranRadioCubit`.

---

#### 10. Responsive layout

UI scales from a **390×844** design canvas on all phone sizes.

- **How it works:** global `ScreenUtilInit` in `lib/app.dart` with `AppConfig.screenUtilDesignSize()`; widgets use `.w`, `.h`, `.sp`, `.r`.

---

### Localization — architecture & workflow

Sakeenah ships in **English** and **Arabic**. All user-facing copy lives in `.arb` files and is consumed through the generated `S` class — never hardcoded in widgets.

#### Stack

| Piece | Role |
|-------|------|
| **`flutter_intl`** (`pubspec.yaml`) | IDE plugin config; generates `lib/generated/l10n.dart` |
| **`lib/l10n/intl_en.arb`** | English source strings |
| **`lib/l10n/intl_ar.arb`** | Arabic translations (same keys) |
| **`lib/generated/l10n.dart`** | Generated `S` class — `S.current.myKey`, `S.current.myKey(arg)` |
| **`LocalizationProvider`** | Singleton `ChangeNotifier`; holds active `Locale`, persists choice |
| **`flutter_localizations`** | Material/Cupertino delegates for built-in widget strings + **RTL** |

#### Wiring in `MaterialApp` (`lib/app.dart`)

```dart
Consumer2<LocalizationProvider, ThemeModeProvider>(
  builder: (_, locProvider, themeProvider, __) {
    return MaterialApp(
      locale: locProvider.appLocal,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsWithKurdishLocalizations.delegate, // LTR/RTL direction
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) { /* first-start device locale */ },
      // ...
    );
  },
)
```

- **`locale`** comes from `LocalizationProvider.appLocal` (defaults to `en`, restored from disk on launch).
- **Arabic (`ar`)** automatically flips layout to **RTL** via `GlobalWidgetsLocalizations` — no manual `Directionality` needed in most screens.
- **`localeResolutionCallback`** runs only on **first install**: if the device language is supported, it is applied once; otherwise English is used.

#### Persistence

| Key | Storage | Purpose |
|-----|---------|---------|
| `SharedPreferenceKeys.KEY_LANGUAGE` | `SharedPreferences` | `'en'` or `'ar'` |
| `KEY_LANGUAGE_FIRST_START_SELECTED` | `SharedPreferences` | User completed onboarding language step |
| `KEY_FIRST_START` | `SharedPreferences` | Legacy first-run flag used by `fetchLocale()` |

`LocalizationProvider.fetchLocale()` is called from `main()` before `runApp`.  
`changeLanguage(Locale, context)` updates memory + prefs and calls `notifyListeners()` so `MaterialApp` rebuilds with the new locale.

#### First launch vs. change later

| Context | Screen | On confirm |
|---------|--------|------------|
| **First launch** | `LanguageScreen` (no back button) | Save language → set `languageFirstStartSelected` → **`RestartWidget.restartApp`** → theme onboarding |
| **Drawer → Change language** | `LanguageScreen` (with back) | If language changed and `AppSettings.changeLangRestart` → **restart**; else `Nav.pop()` |

Language changes use **`RestartWidget`** (`lib/core/ui/widgets/restart_widget.dart`) because a full rebuild resets navigation, `Intl.defaultLocale`, and font resolution cleanly. Theme changes do **not** require a restart.

#### Adding a new string

1. Add the key to **`lib/l10n/intl_en.arb`** (English value).
2. Add the **same key** to **`lib/l10n/intl_ar.arb`** (Arabic value).
3. Save — the Flutter Intl plugin regenerates `lib/generated/l10n.dart`.
4. Use in code: `S.current.myKey` or `S.current.myKey(param)` for placeholders.

```dart
// ❌ Bad
Text('Save')

// ✅ Good
Text(S.current.saveButton)
```

Placeholders in `.arb`:

```json
"nextPrayerIn": "Next is {prayer} after {time}",
"@nextPrayerIn": {
  "placeholders": {
    "prayer": {"type": "String"},
    "time": {"type": "String"}
  }
}
```

Run codegen after editing `.arb` if your IDE does not auto-generate:

```bash
fvm dart run build_runner build --delete-conflicting-outputs
# or use the Flutter Intl plugin “Generate” action
```

#### Locale-aware formatting

Not all text comes from `.arb` — **dates, times, and numbers** use `intl` with the active locale:

| Utility | File | Example |
|---------|------|---------|
| **`DateUtility.formatLocalTime`** | `lib/core/common/utils/date_utils.dart` | Prayer row times (12h/24h from `MediaQuery.alwaysUse24HourFormatOf`) |
| **`DateUtility.formatLocalFullDate`** | same | Schedule date line |
| **`DateUtility.formatLocalDuration`** | same | Countdown text (`2 hours 20 minutes`) with localized unit words from `S.current.durationHourUnitOne`, etc. |
| **Reverse geocoding** | `LocationLabelUtils` | Passes `AppConfig().appLanguage.languageCode` to `placemarkFromCoordinates` |

In widgets, pass `Localizations.localeOf(context).languageCode` into these helpers.

#### Typography per language

`TextThemeStyles` (`lib/core/theme/text_theme_styles.dart`) picks the font from the active locale:

| Language | Font | Package |
|----------|------|---------|
| English (LTR) | Plus Jakarta Sans | `google_fonts` |
| Arabic (RTL) | Tajawal | `google_fonts` |

`ThemesData` sets `fontFamily` and `textTheme` once; when locale changes and the app restarts, the correct family is applied.

#### Accessing locale outside `BuildContext`

```dart
AppConfig().appLanguage          // Locale
LocalizationProvider().currentLanguage  // 'en' | 'ar'
```

---

### Theming — architecture & workflow

The app uses **Material 3** with a fixed **emerald + gold** brand. Every screen must work in **light and dark** — colors come from `ColorScheme` roles or `context.appColors`, not hardcoded hex in widgets.

#### Stack

| Layer | File(s) | Purpose |
|-------|---------|---------|
| **Brand constants** | `lib/core/common/app_colors.dart` | Fixed hex (primary emerald, accent gold) — seed only |
| **Color schemes** | `lib/core/theme/app_color_schemes.dart` | Full M3 `ColorScheme` for light & dark |
| **Theme assembly** | `lib/core/theme/themes_data.dart` + `light/` / `dark/` parts | `ThemeData` (AppBar, buttons, cards, snackbar, …) |
| **Semantic aliases** | `lib/core/theme/custom_theme_colors.dart` | `gold`, `ink`, `muted`, `card` mapped from `ColorScheme` |
| **Context extension** | `lib/core/theme/theme_extensions.dart` | `context.appColors` |
| **Mode state** | `lib/core/providers/theme_mode_provider.dart` | `ThemeMode` + persistence + system brightness observer |
| **Global sync** | `lib/core/common/app_config.dart` | `resolveThemeData()`, `resolveThemeDataForMode()`, `themeMode` |

#### Light vs. dark `ColorScheme`

Both schemes are hand-tuned in `AppColorSchemes` (not only `ColorScheme.fromSeed`) so contrast stays readable:

| Role | Light | Dark |
|------|-------|------|
| `primary` | Deep emerald | Same emerald on dark surfaces |
| `secondary` | Warm gold | Same gold |
| `surface` | Warm cream | Deep charcoal green |
| `onSurface` | Charcoal | Light gray-green |
| `surfaceContainer*` | Layered cream tones | Layered dark green tones |

Widgets should prefer **`Theme.of(context).colorScheme`** (`primary`, `onPrimary`, `surfaceContainer`, `outline`, …) or **`context.appColors`** for named tokens.

```dart
// ❌ Bad — light-only or brightness branching
color: AppColors.jade;
color: isLight ? AppColors.ink : AppColors.darkText;

// ✅ Good
final s = Theme.of(context).colorScheme;
final c = context.appColors;
backgroundColor: s.primary;
color: c.ink; // == onSurface
```

#### `ThemeMode`: Light / Dark / System

| Mode | Behaviour |
|------|-----------|
| **Light** | Always `ThemesData.lightTheme` |
| **Dark** | Always `ThemesData.darkTheme` |
| **System** | Follows `MediaQuery.platformBrightnessOf(context)`; `ThemeModeProvider` implements `WidgetsBindingObserver` and calls `notifyListeners()` on `didChangePlatformBrightness()` so the UI updates when the user toggles OS dark mode |

Persistence: `LocalStorage.persistThemeMode` / `getThemeMode` → `SharedPreferenceKeys.KEY_APP_THEME` (stores `ThemeMode.index`). Default is **`ThemeMode.system`**.

#### Wiring in `MaterialApp` (`lib/app.dart`)

```dart
theme: ThemesData.lightTheme,
darkTheme: ThemesData.darkTheme,
themeMode: themeProvider.themeMode,
```

`Consumer2<LocalizationProvider, ThemeModeProvider>` rebuilds `MaterialApp` when either locale or theme mode changes.

**`animated_theme_switcher`** wraps the tree for an optional smooth transition when the user picks a theme from settings (`ThemeModeProvider.setThemeMode(..., animate: true)`).

#### First launch vs. change later

| Context | Screen | On confirm |
|---------|--------|------------|
| **First launch** | `ThemeScreen` (after language) | Save `themeFirstStartSelected` → persist mode → navigate to **Splash** |
| **Drawer → Switch theme** | `ThemeScreen` (with back) | Persist mode → `Nav.pop()` — **no app restart** |

The theme picker wraps its content in `Theme(data: previewTheme, …)` so the **live preview** uses the selected mode before confirm (`AppConfig().resolveThemeDataForMode`).

#### Building UI for both themes

Project conventions (see `.cursor/rules/dual-theme-ui.mdc`):

1. Use **Material 3 roles** — surfaces stack as `surface` → `surfaceContainerLow` → `surfaceContainer` → `surfaceContainerHigh`.
2. Text: `onSurface` / `onSurfaceVariant` (via `appColors.ink` / `muted`).
3. Primary actions: `primary` / `onPrimary`; accents/highlights: `secondary` / `onSecondary`.
4. Borders: `outline` / `outlineVariant`.
5. Shared screen background **`AppWallpaper`** reads from `colorScheme` so language/theme/splash and `CurvedAppBarLayout` screens adapt automatically.
6. **`CurvedAppBar`** reads `colorScheme.primary` / `onPrimary` internally — do not duplicate status-bar styling on body screens.

#### Resolving theme outside a themed subtree

For previews (theme picker, drawer header) when you need explicit light/dark:

```dart
AppConfig().resolveThemeDataForMode(ThemeMode.dark, context);
AppConfig().resolveThemeData(platformBrightness);
```

#### Onboarding gate (`lib/app.dart`)

```dart
Widget _resolveInitialScreen() {
  if (!LocalStorage.languageFirstStartSelected) return LanguageScreen(...);
  if (!LocalStorage.themeFirstStartSelected) return ThemeScreen(...);
  return SplashScreen();
}
```

After both flags are set, every cold start goes **Splash → Home**.

---

### Build & run

Requires **Flutter 3.44.0** ([FVM](https://fvm.app/) recommended).

```bash
fvm flutter pub get
fvm flutter run
```

Release APK:

```bash
fvm flutter build apk --release
```

Run your usual local codegen when generated files need refreshing after editing `@freezed`, `@injectable`, or `.arb` source files (e.g. `StopQuranRadioUseCase`, `SeekQuranRadioToUseCase`). After adding `flutter_soloud` or changing iOS deployment target, **fully restart** the app (not hot reload).

---

### Project layout

```
lib/
├── app.dart, main.dart
├── core/
│   ├── theme/           # ColorScheme, ThemeData, CustomThemeColors
│   ├── localization/    # LocalizationProvider
│   ├── providers/       # ThemeModeProvider, InternetProvider, CountriesSessionProvider
│   └── common/utils/    # DateUtility (locale-aware dates/times)
├── features/
│   ├── splash/
│   └── home/            # prayer times + Quran radio (shared repo; HomeCubit + QuranRadioCubit)
├── l10n/                # intl_en.arb, intl_ar.arb
├── generated/           # l10n.dart (auto-generated — do not edit)
└── di/
```

**Related docs & rules**

| Resource | Topic |
|----------|--------|
| `.cursor/rules/dual-theme-ui.mdc` | Light/dark color rules for agents |
| `.cursor/skills/dart-localized-strings/SKILL.md` | Never hardcode user-facing strings |
| `lib/core/theme/app_color_schemes.dart` | Full palette reference |
| `lib/app.dart` | MaterialApp locale + theme wiring |

Further planning: [`docs/implementation_plan.md`](docs/implementation_plan.md)  
Full product spec: [`docs/prayer_quran_app_requirements.md`](docs/prayer_quran_app_requirements.md)

---

## العربية

### عن التطبيق

**سكينة** — تطبيق يبدأ بإعداد قصير (اللغة والمظهر) ثم ينتقل إلى الشاشة الرئيسية. الميزات أدناه **موجودة وتعمل في التطبيق حالياً**.

---

### الميزات

#### 1. مسار أول تشغيل

عند فتح التطبيق لأول مرة:

**اللغة** ← **المظهر** ← **الافتتاح** ← **الرئيسية**

بعد ذلك، كل تشغيل: **الافتتاح** ← **الرئيسية**.

- **كيف يعمل:** `lib/app.dart` يتحقق من علامات `LocalStorage` ويختار الشاشة الأولى. التنقل عبر `route_generator.dart`.

---

#### 2. اختيار اللغة

اختيار **English** أو **العربية** عبر بطاقات على خلفية wallpaper ناعمة.

- **أول تشغيل:** شاشة كاملة؛ يجب التأكيد للمتابعة.
- **من القائمة الجانبية:** نفس التصميم مع زر رجوع؛ إعادة تشغيل التطبيق لتطبيق اللغة.
- **كيف يعمل:**
  - الواجهة: `language_screen.dart`
  - الحالة: `LocalizationProvider`
  - النصوص: `intl_en.arb`, `intl_ar.arb`
  - العربية تفعّل **RTL** تلقائياً.

---

#### 3. المظهر (فاتح / داكن / النظام)

اختيار **فاتح**، **داكن**، أو **النظام** مع **معاينة فورية** عند اللمس.

- **أول تشغيل:** التأكيد يحفظ الاختيار وينتقل للافتتاح.
- **من القائمة:** زر رجوع للرئيسية؛ التأكيد يحفظ بدون إعادة تشغيل.
- **كيف يعمل:**
  - الواجهة: `theme_screen.dart`
  - الحالة: `ThemeModeProvider` + حفظ في `shared_preferences`
  - تحديث `MaterialApp.themeMode` مباشرة.

---

#### 4. شاشة الافتتاح (Splash)

شاشة قصيرة (~2.2 ثانية) بالشعار والاسم ومؤشر تحميل، ثم الانتقال للرئيسية. أثناء عرضها يُحمَّل **قائمة الدول** مسبقاً لتسريع اختيار الموقع اليدوي.

- **كيف يعمل:** `splash_screen.dart` — يستدعي `CountriesSessionProvider.prefetchCountries()` في الإطار الأول.

---

#### 5. الرئيسية ومواقيت الصلاة

**شريط علوي منحنٍ** + **بطاقة مواقيت الصلاة** + **مشغّل راديو القرآن** + **قائمة جانبية**.

**مواقيت الصلاة**
- جلب الأوقات من **AlAdhan** عبر GPS أو الخريطة أو **اختيار البلد/المدينة يدوياً**.
- تمييز الصلاة التالية وعدّ تنازلي.
- **وضع offline** من Hive.
- بطاقة skeleton أثناء التحميل؛ بطاقة خطأ مع **إعادة المحاولة** و**تغيير الموقع**.

**تغيير الموقع**
- **من الخريطة** — Google Maps مع نمط داكن متوافق مع السمة.
- **البلد / المدينة** — قوائم قابلة للبحث عبر **CountriesNow** (أسماء إنجليزية لـ AlAdhan).
- تخزين مؤقت: Hive + `CountriesSessionProvider` (تحميل الدول في Splash).

**راديو القرآن**
- بث مباشر من RadioJar.
- **تشغيل / إيقاف مؤقت**، **شريط الصوت** (0–1)، **كتم** (يستعيد آخر مستوى).
- **إيقاف** — يوقف البث ويمسح المخزن المؤقت ويعيد الحالة إلى idle.
- **رجوع / تقديم 10 ثوانٍ** ضمن الصوت المخزّن في الذاكرة — وليس إعادة بث كاملة.
- **شريط تمرير قابل للسحب** — للانتقال داخل نافذة المخزن؛ النص `{position} / {buffered}` (مثل `1:23 / 4:56`).
- حالة اتصال، خطأ داخل البطاقة، **بطاقة خطأ كاملة** (`QuranRadioErrorWidget`)، و**إعادة المحاولة**.
- **إعادة تشغيل تلقائية** عند عودة الإنترنت إذا كان البث يعمل قبل الانقطاع (الإيقاف/الإيقاف المؤقت اليدوي يلغي ذلك).
- **عند فتح الرئيسية:** إعادة تعيين أي جلسة رادio سابقة.
- المحرك: `flutter_soloud` `^4.1.7` مع `BufferingType.preserved` + Dio.
- البنية: `HomeCubit` (مواقيت) + `QuranRadioCubit` (رادio) → use cases → `HomeRepository` → `QuranRadioPlayer`.

**ملاحظة:** التشغيل في الخلفية وعناصر التحكم من شاشة القفل **لم تُنفَّذ بعد** (المرحلة 5). iOS يتطلب **13.0+**.

**القائمة الجانبية**
- رأس: اسم التطبيق والشعار (متكيف مع الفاتح والداكن).
- **تغيير اللغة** — يعرض اللغة الحالية.
- **تغيير المظهر** — يعرض الوضع الحالي.

- **كيف يعمل:**
  - `home_screen_content.dart`
  - `CurvedAppBarLayout` + `CurvedAppBar` داخل `Stack` في جسم الشاشة
  - ألوان الدرج تتبع السمة النشطة عبر `AppConfig().resolveThemeDataForMode`

---

#### 6. التصميم والسمات

| العنصر | فاتح | داكن |
|--------|------|------|
| الأساسي | زمردي `#0F4C3A` | زمردي على خلفيات داكنة |
| التمييز | ذهبي `#C9A24B` | نفس الذهبي |
| الخلفية | كريمي `#FAF6EE` | أخضر فحمي `#0B1512` |
| النص | فحمي `#1F2622` | رمادي-أخضر فاتح |

- **الخطوط:** Plus Jakarta Sans (EN)، Tajawal (AR)
- **ألوان دلالية:** `context.appColors`
- **الملفات:** `app_color_schemes.dart`, `themes_data.dart`

---

#### 7. خلفية الإعداد (Wallpaper)

خلفية مشتركة لشاشات اللغة والمظهر والافتتاح — شبكة خفيفة وأشكال زمردية/ذهبية.

- **كيف يعمل:** `app_wallpaper.dart` — يرسم من ألوان `ColorScheme` الحالية.

---

#### 8. تنبيه انقطاع الإنترنت

بانر في الأسفل عند فقدان الاتصال؛ يختفي عند عودته. على الشاشة الرئيسية، يُعاد تشغيل الرادio تلقائياً عند عودة الشبكة إذا كان يعمل قبل الانقطاع.

- **كيف يعمل:** `InternetProvider` + `InternetBanner` في `app.dart`؛ `HomeScreen` → `QuranRadioCubit`.

---

#### 9. واجهة متجاوبة

المقاسات تُحسب من لوحة تصميم **390×844**.

- **كيف يعمل:** `ScreenUtilInit` + `.w`, `.h`, `.sp`, `.r` في الواجهات.

---

### الترجمة (Localization) — البنية والاستخدام

التطبيق يدعم **الإنجليزية** و**العربية**. كل النصوص الظاهرة للمستخدم في ملفات `.arb` وتُستخدم عبر الصنف المُولَّد `S` — **لا تُكتب نصوص ثابتة داخل الواجهات**.

#### المكدس التقني

| المكوّن | الدور |
|---------|--------|
| **`flutter_intl`** | إعداد المولّد في `pubspec.yaml` |
| **`intl_en.arb` / `intl_ar.arb`** | مصدر EN + ترجمة AR (نفس المفاتيح) |
| **`lib/generated/l10n.dart`** | `S.current.*` |
| **`LocalizationProvider`** | `ChangeNotifier` وحيد — يحفظ `Locale` النشط |
| **`flutter_localizations`** | ترجمة Material/Cupertino + **RTL** تلقائياً للعربية |

#### التوصيل في `MaterialApp`

- `locale: locProvider.appLocal`
- `localizationsDelegates`: `S.delegate` + delegates الرسمية
- **`localeResolutionCallback`**: عند **أول تشغيل** فقط — يطابق لغة الجهاز إن وُجدت، وإلا الإنجليزية
- العربية تفعّل **RTL** دون `Directionality` يدوي في أغلب الشاشات

#### الحفظ

- `KEY_LANGUAGE` في `SharedPreferences` → `'en'` أو `'ar'`
- `fetchLocale()` من `main()` قبل `runApp`
- `changeLanguage()` يحدّث الذاكرة + التخزين + `notifyListeners()`

#### أول تشغيل مقابل التغيير لاحقاً

| السياق | السلوك عند التأكيد |
|--------|---------------------|
| **أول تشغيل** | حفظ اللغة → `RestartWidget.restartApp` → شاشة المظهر |
| **من القائمة الجانبية** | إن تغيّرت اللغة → إعادة تشغيل التطبيق (إن `changeLangRestart`)؛ وإلا رجوع |

#### إضافة نص جديد

1. أضف المفتاح في `intl_en.arb`
2. أضف **نفس المفتاح** في `intl_ar.arb`
3. احفظ ليُولَّد `l10n.dart`
4. استخدم `S.current.myKey` في الكود

```dart
Text(S.current.saveButton)  // ✅
Text('Save')                // ❌
```

#### تنسيق حسب اللغة

- **`DateUtility`** — أوقات الصلاة، التاريخ، العدّ التنازلي (`formatLocalTime`, `formatLocalFullDate`, `formatLocalDuration`)
- **`LocationLabelUtils`** — geocoding بلغة `AppConfig().appLanguage`
- مرّر `Localizations.localeOf(context).languageCode` من الواجهات

#### الخطوط

| اللغة | الخط |
|-------|------|
| EN | Plus Jakarta Sans |
| AR | Tajawal |

يُختار عبر `TextThemeStyles` عند بناء `ThemeData`.

---

### السمات (Theming) — البنية والاستخدام

**Material 3** بهوية **زمردي + ذهبي**. كل شاشة يجب أن تعمل في **الفاتح والداكن** — الألوان من `ColorScheme` أو `context.appColors`.

#### طبقات السمة

| الطبقة | الملف | الغرض |
|--------|-------|--------|
| **`AppColorSchemes`** | `app_color_schemes.dart` | `ColorScheme` كامل للفاتح والداكن |
| **`ThemesData`** | `themes_data.dart` | `ThemeData` (AppBar، أزرار، بطاقات…) |
| **`CustomThemeColors`** | `custom_theme_colors.dart` | أسماء دلالية: `gold`, `ink`, `muted`, `card` |
| **`context.appColors`** | `theme_extensions.dart` | وصول سريع من الواجهة |
| **`ThemeModeProvider`** | `theme_mode_provider.dart` | Light / Dark / System + مراقبة سطوع النظام |

#### أوضاع المظهر

| الوضع | السلوك |
|-------|--------|
| **فاتح / داكن** | `ThemesData.lightTheme` أو `darkTheme` |
| **النظام** | يتبع إعدادات الجهاز؛ `didChangePlatformBrightness` يحدّث الواجهة |

الحفظ: `KEY_APP_THEME` في `SharedPreferences`. الافتراضي: **System**.

#### التوصيل

```dart
theme: ThemesData.lightTheme,
darkTheme: ThemesData.darkTheme,
themeMode: themeProvider.themeMode,
```

`Consumer2` يعيد بناء `MaterialApp` عند تغيير اللغة أو المظهر.

#### قواعد الواجهة

1. استخدم أدوار M3: `primary`, `surfaceContainer`, `onSurface`, `outline`…
2. **`context.appColors`** للأسماء الدلالية
3. لا تفرّع على `isLight` للألوان في الواجهات
4. **`AppWallpaper`** و **`CurvedAppBar`** يقرآن من `colorScheme` تلقائياً

#### أول تشغيل

`LanguageScreen` → `ThemeScreen` → `Splash` → `Home` (يُتحقق عبر `LocalStorage.languageFirstStartSelected` و `themeFirstStartSelected` في `app.dart`).

تغيير المظهر من القائمة **لا يحتاج** إعادة تشغيل — يُطبَّق فوراً عبر `ThemeModeProvider.setThemeMode`.

---

### البناء والتشغيل

يتطلب **Flutter 3.44.0** (يُفضّل FVM).

```bash
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
fvm flutter run
fvm flutter build apk --release
```

شغّل codegen بعد تعديل `@freezed` أو `@injectable` أو ملفات `.arb`. بعد إضافة `flutter_soloud` أو تغيير iOS deployment target، **أعد تشغيل التطبيق بالكامل**.

---

### هيكل المشروع

```
lib/
├── app.dart, main.dart
├── core/
│   ├── theme/
│   ├── localization/
│   ├── providers/
│   └── common/utils/
├── features/
├── l10n/
├── generated/
└── di/
```

| مرجع | الموضوع |
|------|---------|
| `.cursor/rules/dual-theme-ui.mdc` | قواعد الفاتح/الداكن |
| `.cursor/skills/dart-localized-strings/SKILL.md` | عدم تثبيت النصوص في الكود |
| `lib/app.dart` | توصيل اللغة والسمة |

التخطيط الكامل: [`docs/implementation_plan.md`](docs/implementation_plan.md)

---

**Package:** `com.ammourie.sakeenah` · Flutter **3.44.0** (FVM)

*Last updated: September 2026*
