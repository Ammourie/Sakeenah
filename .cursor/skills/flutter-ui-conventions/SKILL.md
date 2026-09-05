---
name: flutter-ui-conventions
description: Use whenever writing or editing Flutter UI code — building
  screens, widgets, or notifiers/state, using colors, text styles, sizes,
  constants, or handling loading/loaded states. Triggers on requests like
  "build a screen for X", "add a widget for X", "create a section showing
  X".
---

# Flutter UI Conventions

Follow these conventions for every screen and widget in this project.

## 1. Design tokens — never hardcode

- **Colors**: never write raw hex/`Color(0xFF...)` values inline. Prefer
  `Theme.of(context).colorScheme` and app semantic aliases exposed from
  `CustomThemeColors`. Add to `AppColors` only when the value is truly
  theme-independent artwork or branding, not a normal UI surface/text color.
- **Text styles**: never write inline `TextStyle(...)`. Use the predefined
  styles in `lib/core/theme/text_theme_styles.dart`. If a needed style
  doesn't exist yet, add it there first, then reference it.
- **Constants & asset paths**: any new constant value or asset path
  (images, icons, durations, magic numbers used more than once) goes in
  `lib/core/constants/app/app_constants.dart` — never inline literals
  scattered across widgets.
- **Static/user-facing strings**: always use `S.current` (e.g.
  `S.current.someKey`) — never hardcode a string literal in a widget. Add
  the key to the `.arb` file first if it doesn't exist.

### Material 3 color usage

Default to semantic roles:

- Primary CTA -> `colorScheme.primary` / `onPrimary`
- Tonal emphasis -> `primaryContainer` / `onPrimaryContainer`
- Base page -> `surface`
- Cards, rows, dialogs -> `surfaceContainer`
- Elevated overlays -> `surfaceContainerHigh`
- Primary text -> `onSurface`
- Secondary text -> `onSurfaceVariant`
- Borders -> `outline` or `outlineVariant`

Do not hardcode separate light and dark widget colors. If a reusable semantic
token is missing, add it to `CustomThemeColors` with both theme values.

## 2. Responsive sizing — always ScreenUtil

Never use raw pixel values for sizes, spacing, or radii. Always use the
`flutter_screenutil` extensions:

- Font sizes → `.sp` (e.g. `16.sp`)
- Radii → `.r` (e.g. `12.r`)
- Widths → `.w`
- Heights → `.h`
- Vertical gaps → `SizedBox` replaced with `.verticalSpace` (e.g.
  `16.verticalSpace`)
- Horizontal gaps → `.horizontalSpace` (e.g. `8.horizontalSpace`)

**Design canvas:** all extensions scale from
`AppConfig.screenUtilDesignSize()` in `lib/core/common/app_config.dart`
(currently `390×844` logical). Never hardcode a different `designSize` elsewhere —
see rule `screenutil-design-size`.

Use the app scale consistently: 4, 8, 12, 16, 24, 32, 48 for spacing, and
8.r / 12.r / 20.r-24.r for most radii before inventing a new value.

## 2.1 Dual-theme requirement

Every UI change must support both light and dark themes.

- Do not ship light-only styling
- Do not branch with `isLight ? ... : ...` for widget colors
- Validate contrast on dark surfaces, especially filled buttons, chips, and
  muted text
- Use brightness checks only for non-color asset selection when necessary

## 3. Compose screens as private builder methods

Break every screen/widget body into small private methods instead of one
large nested widget tree. Name them descriptively:
`_buildCreatedAtSection()`, `_buildSourceAndDestinationSection()`,
`_buildContent()`, etc.

- **Always pass the data a method needs as parameters** rather than reading
  it from a wider closure — e.g. `_buildSourceAndDestinationSection(source,
  destination)`, `_buildContent(data)`. This is required so the same method
  can be reused with dummy/placeholder data for skeleton loading (see
  section 5).

## 4. State lives in the Notifier, not the screen

- All state fields live in a `ScreenNotifier` (e.g. `XxxScreenNotifier`),
  never as local widget state or fields on the screen/screen-content
  widget.
- The screen/widget itself stays stateless/dumb — it only reads from the
  notifier and renders.

### Scoped rebuilds with `context.select`

Never wrap the whole screen in a single listener/builder. Only wrap the
**specific section** that actually needs a given piece of state, at the
narrowest possible scope:

```dart
Widget _buildSourceAndDestinationSection() {
  return Builder(
    builder: (context) {
      final SourceDestinationType sourceDestination =
          context.select<ScreenNotifier, SourceDestinationType>(
        (value) => value.sourceDestination,
      );
      return _buildSourceAndDestinationContent(sourceDestination);
    },
  );
}
```

If a section doesn't depend on notifier state, don't wrap it at all — leave
it as a plain method call.

## 5. Loading state via Skeletonizer + dummy data

Because render methods always take their data as parameters (section 3),
loading states reuse the exact same builder method with placeholder data:

```dart
Skeletonizer(
  enabled: isLoading,
  child: _buildContent(isLoading ? dummyData : realData),
)
```

Use `Consumer`/`Selector` (whichever matches what's actually needed) to
decide when to switch between the loading and loaded data — don't
duplicate the UI structure for loading vs loaded states.

- Store the **loaded data itself** in the notifier (not just a loading
  boolean) so `_buildContent(notifier.data)` always has something to render
  — dummy data is only used while `isLoading` is true.

## 6. Notifier field organization

Every field in a notifier must be **private**, exposed via explicit getters
(and setters only where mutation from outside is actually needed). Organize
the notifier file into clearly commented sections, in this order:

```dart
class XxxScreenNotifier extends ChangeNotifier {
  /// fields
  bool _isLoading = false;
  XxxData? _data;

  /// setters
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// getters
  bool get isLoading => _isLoading;
  XxxData? get data => _data;

  /// methods
  Future<void> loadData() async {
    isLoading = true;
    // ... call use case, then:
    _data = result;
    isLoading = false;
  }
}
```

- Never expose a mutable field directly (no public non-final fields).
- Group all fields together, then all setters, then all getters, then all
  methods — don't interleave them.

## 7. Extract reusable UI into the widgets folder

If a piece of UI is (or is likely to be) used in more than one place —
a card, a section, a button variant, a list item — don't leave it as a
private `_buildXxx()` method or inline widget tree. Extract it into its own
widget class under the feature's `widgets/` folder (or a shared/common
`widgets/` folder if it's used across multiple features).

- Give it a clear, descriptive name matching the pattern used elsewhere in
  the project (e.g. `SourceDestinationCard`, `AppEmptyState`).
- It should take its data via constructor parameters — same rule as
  section 3, so it stays testable and reusable with dummy data for
  skeleton loading.
- Prefer this over copy-pasting a builder method into a second screen, and
  over leaving genuinely shared UI as a private method just because it
  currently has one caller — if it's structurally generic (a card, a row,
  a badge), extract it even on first use.

## 8. Modern Material composition

When polishing or building UI, bias toward modern Material structure:

- Group related settings or actions inside `surfaceContainer` cards instead of
  placing loose rows directly on the page background
- Use one clearly dominant primary action per section or screen
- Prefer tonal separation, spacing, and hierarchy over custom decoration
- Keep dialogs, sheets, and banners on semantic container surfaces
- Use Lucide SVG assets for iconography where the project convention expects
  them

## 8.1 App bar — `CurvedAppBar` in a body Stack

Standard screens use [`CurvedAppBar`](lib/core/ui/widgets/curved_app_bar.dart)
inside [`CurvedAppBarLayout`](lib/core/ui/widgets/curved_app_bar.dart) on
`Scaffold.body` — **never** on `Scaffold.appBar`. See rule `curved-app-bar.mdc`.

```dart
Scaffold(
  body: CurvedAppBarLayout(
    appBar: CurvedAppBar(title: S.current.homePage, showDrawerMenu: true),
    body: _Content(),
  ),
)
```

- Body content must start below the bar (`bodyTopGap` default `12`) so the
  curved bottom edge stays visible
- Drawer host: `showDrawerMenu: true`
- Onboarding without a bar (language/theme first start): exception — inline
  back button on wallpaper, no `CurvedAppBar`

### Rendering states — `BlocBuilder` + `maybeWhen`, scoped narrowly

Never drive loading/error/empty/loaded rendering off a `Builder` +
`context.watch<ScreenNotifier>()` wrapping broad UI — that rebuilds more
than necessary and bypasses the cubit's actual state machine. Instead, wrap
**only the section that renders the list** in a `BlocBuilder` on the
relevant cubit, and branch with `maybeWhen`:

```dart
Widget _buildListSection(XxxScreenNotifier sn) {
  return BlocBuilder<XxxCubit, XxxState>(
    bloc: sn.cubit,
    builder: (context, state) {
      return state.maybeWhen(
        xxxInit: () => _buildLoading(),
        xxxLoading: () => _buildLoading(),
        xxxListLoaded: (data) => _buildListWidget(),
        xxxError: (error, callback) =>
            ErrorScreenWidget(error: error, callback: callback),
        orElse: () => const ScreenNotImplementedErrorWidget(),
      );
    },
  );
}
```

- This `BlocBuilder` wraps only the list section — not the whole
  screen/build method. Everything else on the screen that doesn't depend on
  this state stays outside it, same rule as section 4's `context.select`
  scoping.
- Empty-list handling is a state the list-loaded case renders internally
  (for example, renders the empty widget itself when `items` is empty) —
  don't add a separate `hasError`/`isEmpty` boolean pair on the notifier to
  replicate what the cubit state already expresses.

### Empty state

When the list comes back empty, render
`lib/core/ui/screens/empty_screen_wiget.dart` instead of an empty
`ListView`. Always pass:

- A **title** relevant to what the list represents (e.g. "No messages yet"
  via `S.current`, not the widget's generic default).
- **Button text** relevant to the action (e.g. "Retry", "Refresh" via
  `S.current`).
- An **`onPressed`** callback wired to re-trigger the notifier's data-fetch
  method (e.g. `loadData()`), so the user can retry without leaving
  the screen.

## Checklist

- [ ] Standard screens use `CurvedAppBarLayout` + `CurvedAppBar`, not `Scaffold.appBar`
- [ ] No inline colors — used `colorScheme` / `CustomThemeColors`; only used
      `AppColors` for theme-independent assets
- [ ] No inline `TextStyle` — used/added to `text_theme_styles.dart`
- [ ] No inline constants/asset paths — added to `app_constants.dart`
- [ ] No hardcoded strings — used `S.current`
- [ ] No raw pixel sizes — used `.sp`/`.r`/`.w`/`.h`/`.verticalSpace`/
      `.horizontalSpace`
- [ ] UI was checked in both light and dark themes
- [ ] Primary actions use semantic Material roles with readable contrast
- [ ] Surfaces, cards, dialogs, and sheets use `surfaceContainer*` roles
- [ ] Screen body split into descriptive `_buildXxx()` methods
- [ ] Render methods take their data as parameters
- [ ] No local widget state — all state in the notifier
- [ ] Only the specific sections that need notifier state are wrapped with
      `Builder` + `context.select`, not the whole tree
- [ ] Loading state implemented via `Skeletonizer` + the same builder
      method fed dummy data
- [ ] Notifier fields are private with getters/setters, organized in
      `/// fields`, `/// setters`, `/// getters`, `/// methods` sections
- [ ] UI that is (or could be) reused elsewhere is extracted into its own
      widget class in a `widgets/` folder, not left as a private method or
      copy-pasted
- [ ] List loading/error/loaded rendering uses `BlocBuilder` +
      `maybeWhen` on the cubit, scoped to only the list section — not a
      `Builder` + `context.watch()` over broad UI
- [ ] Empty list state uses `empty_screen_wiget.dart` with a relevant
      `S.current` title/button text and an `onPressed` that retries the
      fetch