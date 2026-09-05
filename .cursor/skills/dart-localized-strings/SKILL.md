---
name: dart-localized-strings
description: Use whenever writing or editing Flutter/Dart code that contains
  any static/user-facing string (labels, button text, hints, titles, error
  messages, snackbars, dialogs, etc.)
---

# Dart Localized Strings

Always use `S.current` for static, user-facing strings in Flutter/Dart code.
Never hardcode them directly in widgets or Dart code.

## Rules

- Never write `Text("Save")`, `labelText: "Amount"`, or similar hardcoded
  strings in widgets, dialogs, snackbars, validators, or enums with display
  text.
- Always reference the string via the generated localization class, e.g.
  `S.current.saveButton`, `S.current.amountLabel`. Assume it's imported from
  the project's generated l10n file (e.g. `generated/l10n.dart`).
- If a needed key doesn't exist yet, add it to the project's `.arb` file(s)
  first, using a sensible camelCase key name, then reference it via
  `S.current`.
- Apply this to all Dart/Flutter files containing user-facing text.
- After Adding the translations to .arb files don't run any generate command ; it will be generated when save the files automatically

## Skip this rule for

- Debug/log strings
- Non-user-facing identifiers
- Asset paths
- Code comments

## Example

**Before:**
\`\`\`dart
ElevatedButton(
onPressed: () {},
child: Text("Save"),
)
\`\`\`

**After:**
\`\`\`dart
ElevatedButton(
onPressed: () {},
child: Text(S.current.saveButton),
)
\`\`\`

(with `"saveButton": "Save"` added to the relevant `.arb` file)
