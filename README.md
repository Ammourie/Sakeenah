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

A short branded screen (~2.2s) with the app illustration, name, and loading indicator, then navigation to home.

- **How it works:** `lib/features/splash/presentation/screen/splash_screen.dart` — uses `OnboardingWallpaper`, theme-aware logo, and `WaitingWidget`; no network calls.

---

#### 5. Home & navigation drawer

The main screen has a **curved emerald app bar** and a **drawer** for settings.

**App bar**
- Title bar with rounded bottom curve, stacked over the body so the curve stays visible.
- Menu icon opens the drawer.

**Drawer**
- Header with app name and logo (styled for light and dark).
- **Change language** — shows current language (English / العربية).
- **Switch theme** — shows current mode (Light / Dark / System).

- **How it works:**
  - `lib/features/home/presentation/screen/home_screen/home_screen_content.dart`
  - Bar: `CurvedAppBar` inside `CurvedAppBarLayout` (body `Stack`, not `Scaffold.appBar`)
  - Drawer theme resolved via `AppConfig().resolveThemeDataForMode` so light/dark colors apply correctly.

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

- **How it works:** `lib/core/ui/widgets/onboarding_wallpaper.dart` — `CustomPaint` using `colorScheme` roles so it adapts to light and dark.

---

#### 8. Internet connection banner

When the device goes offline, a bottom banner appears; it hides again when connection returns.

- **How it works:** `InternetProvider` listens for connectivity changes; `InternetBanner` is overlaid in `MaterialApp.builder` (`lib/app.dart`).

---

#### 9. Responsive layout

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
5. Shared onboarding background **`OnboardingWallpaper`** reads from `colorScheme` so language/theme/splash screens adapt automatically.
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
fvm dart run build_runner build --delete-conflicting-outputs
fvm flutter run
```

Release APK:

```bash
fvm flutter build apk --release
```

Run code generation after editing `@freezed`, `@injectable`, or `.arb` files. After native config changes (Android/iOS), **fully restart** the app.

---

### Project layout

```
lib/
├── app.dart, main.dart
├── core/
│   ├── theme/           # ColorScheme, ThemeData, CustomThemeColors
│   ├── localization/    # LocalizationProvider
│   ├── providers/       # ThemeModeProvider, InternetProvider
│   └── common/utils/    # DateUtility (locale-aware dates/times)
├── features/
│   ├── splash/
│   └── home/
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

شاشة قصيرة (~2.2 ثانية) بالشعار والاسم ومؤشر تحميل، ثم الانتقال للرئيسية.

- **كيف يعمل:** `splash_screen.dart` — خلفية wallpaper، بدون اتصال بالشبكة.

---

#### 5. الرئيسية والقائمة الجانبية

**شريط علوي منحنٍ** بلون الزمرد + **قائمة جانبية** للإعدادات.

**الشريط العلوي**
- منحنى سفلي واضح فوق المحتوى.
- أيقونة القائمة تفتح الدرج.

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

- **كيف يعمل:** `onboarding_wallpaper.dart` — يرسم من ألوان `ColorScheme` الحالية.

---

#### 8. تنبيه انقطاع الإنترنت

بانر في الأسفل عند فقدان الاتصال؛ يختفي عند عودته.

- **كيف يعمل:** `InternetProvider` + `InternetBanner` في `app.dart`.

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
4. **`OnboardingWallpaper`** و **`CurvedAppBar`** يقرآن من `colorScheme` تلقائياً

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

شغّل codegen بعد تعديل `@freezed` أو `@injectable` أو ملفات `.arb`. بعد تغيير إعدادات Android/iOS، **أعد تشغيل التطبيق بالكامل**.

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
