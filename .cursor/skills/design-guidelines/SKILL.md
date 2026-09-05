---
name: design-guidelines
description: Use whenever designing or redesigning a screen, component, dialog, or visual treatment that needs modern Material 3 styling, semantic color roles, surface layering, Lucide icon usage, and explicit light and dark theme support.
---

# Design Guidelines

This skill defines the app's visual language: the concrete Material 3 roles,
scale values, and component recipes to use when polishing or designing UI.
Use it with `flutter-ui-conventions` for code-shape rules; this skill answers
what the UI should look and feel like.

## 1. Design direction

Design for a modern Material 3 app:

- Clean surfaces, clear hierarchy, and generous spacing
- Primary actions emphasized with semantic theme roles, not brand hex values
- Cards, sheets, and dialogs separated by container roles rather than heavy
  shadows
- Visual choices that work in both light and dark themes from the start

If a design only looks good in light mode, it is incomplete.

## 2. Color system

Prefer semantic Material 3 roles from `Theme.of(context).colorScheme`. The
repo still contains some older theme wiring, but new design decisions should
target the modern path: a seeded `ColorScheme` plus app-specific aliases on
`CustomThemeColors` for tokens that are not direct Material roles.

Never design around raw `AppColors` for normal UI surfaces or text. Keep
`AppColors` only for truly theme-independent brand assets such as overlays or
special-case graphics.

### Role usage

| Role | Use for |
|---|---|
| `primary` / `onPrimary` | Filled buttons, selected chips, active tabs, key CTAs |
| `primaryContainer` / `onPrimaryContainer` | FABs, emphasized cards, positive emphasis without full brand fill |
| `secondary` / `onSecondary` | Secondary accents, alternate highlighted actions |
| `surface` | Scaffold background, root canvas |
| `surfaceContainerLow` | Insets, bottom sheets, recessed panels |
| `surfaceContainer` | Cards, grouped settings rows, list items, dialogs |
| `surfaceContainerHigh` | Elevated app bars, popovers, stronger overlays |
| `onSurface` / `onSurfaceVariant` | Primary text and supporting text |
| `outline` / `outlineVariant` | Borders, strokes, dividers |
| `error` / `onError` | Destructive actions and blocking error banners |

### App aliases

If the design needs semantic tokens like `ink`, `muted`, `success`, `warning`,
or `card`, expose them through `CustomThemeColors` with both light and dark
values. Do not introduce widget-level `Color(0xFF...)` literals.

## 3. Light and dark themes

Every visual decision must be dual-theme by design, not patched later.

- Text contrast must come from `onSurface` and `onSurfaceVariant`
- Primary actions must stay readable in dark mode via `primary`/`onPrimary`
- Borders and separators should use `outline` or `outlineVariant`
- Dialogs, sheets, drawers, and cards should use container roles rather than
  a light-only fill
- Do not branch with `isLight ? colorA : colorB` for widget colors unless the
  choice is non-color content such as an asset variant

Use brightness checks for icons or illustrations only when selecting different
artwork, not for bypassing the theme system.

## 4. Typography scale

Use `Theme.of(context).textTheme.*` and choose roles by hierarchy, not by
eyeballing a size. Fonts are already theme-level: Poppins for LTR and Cairo /
Arabic alternatives for RTL locales.

| Role | When to use |
|---|---|
| `display*` | Rare hero or onboarding moments |
| `headlineMedium` / `headlineSmall` | Screen titles and empty-state headings |
| `titleLarge` / `titleMedium` / `titleSmall` | App bar titles, dialog titles, section headings |
| `bodyLarge` / `bodyMedium` | Main content, settings rows, card bodies |
| `bodySmall` / `labelLarge` / `labelSmall` | Captions, helpers, chips, button labels |

Keep typography calm and consistent; prefer weight, spacing, and surface
contrast over oversized text.

## 5. Spacing and radius

Use the shared responsive scale from `flutter_screenutil`:

- **Spacing:** 4, 8, 12, 16, 24, 32, 48
- **Radius:** 8.r for compact controls, 12.r for cards and tiles, 20.r-24.r
  for dialogs and sheets, 999.r or `StadiumBorder` for pills

Default screen padding should feel roomy and modern: typically 16-20 on the
edges, 8 between tightly related items, and 24-32 between sections.

## 6. Surfaces and elevation

Model elevation through Material surface containers, not custom shadow stacks.

- Page background -> `surface`
- Recessed panel / bottom sheet -> `surfaceContainerLow`
- Standard card / grouped tile / dialog body -> `surfaceContainer`
- App bar over scrolling content / popover -> `surfaceContainerHigh`

Design from lowest to highest surface: `surface` ->
`surfaceContainerLow` -> `surfaceContainer` -> `surfaceContainerHigh`.

## 7. Iconography

Lucide SVG icons are the default icon system. Use assets under
`assets/images/svg/icons/` and register new ones in
`lib/core/constants/app/app_constants.dart` when needed.

- 16.r-20.r for inline/supporting icons
- 24.r for tappable actions
- 32.r+ only for emphasis or empty states
- Tint through `colorScheme` or `CustomThemeColors`, never hardcoded colors

Do not fall back to Material glyphs where the project convention expects a
Lucide asset.

## 8. Motion

Use restrained motion that reinforces hierarchy:

- 200-250ms, `Curves.easeOut` for micro feedback and content swaps
- 250-300ms, `Curves.easeInOut` for reveals, expansions, and validation
- Route transitions should reuse the existing route types rather than invent
  a new transition system

Motion should support clarity, not decoration.

## 9. Component recipes

- **Primary button:** filled using `primary` / `onPrimary`
- **Secondary action:** text or tonal treatment using `secondary` or
  `onSurfaceVariant`
- **Cards and settings rows:** `surfaceContainer`, 12.r radius, clear title /
  subtitle hierarchy
- **Dialogs and sheets:** container-role background, strong title, subdued
  supporting text, one obvious primary action
- **Inline alert or banner:** `error` / `onError` for destructive states,
  `primaryContainer` / `onPrimaryContainer` for informational emphasis

## 10. Accessibility and RTL

- Minimum tap target about 44.r
- Never hand-pick low-contrast grays; use semantic text roles
- Use directional layout APIs such as `AlignmentDirectional` and
  `EdgeInsetsDirectional`
- Avoid designs that depend on left/right assumptions or only work in LTR

## Checklist

- [ ] Uses Material 3 semantic roles instead of raw colors
- [ ] Looks deliberate in both light and dark themes
- [ ] Surfaces follow the container layering model
- [ ] Text hierarchy comes from `textTheme` roles
- [ ] Spacing and radii come from the shared scale
- [ ] Icons use Lucide assets and semantic tinting
- [ ] Primary actions are readable and prominent in dark mode
- [ ] Borders and dividers use `outline` / `outlineVariant`
- [ ] RTL and tap targets were considered before shipping
