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
├── core/          # theme, UI widgets, navigation, network, providers
├── features/
│   ├── splash/
│   └── home/
├── l10n/          # English & Arabic strings
└── di/            # dependency injection
```

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
├── core/          # السمات، الواجهات، التنقل، الشبكة
├── features/
│   ├── splash/
│   └── home/
├── l10n/          # الترجمة
└── di/
```

التخطيط الكامل: [`docs/implementation_plan.md`](docs/implementation_plan.md)

---

**Package:** `com.ammourie.sakeenah` · Flutter **3.44.0** (FVM)

*Last updated: September 2026*
