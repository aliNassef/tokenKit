## 0.0.3

- `AppColorsExtension.light` / `.dark` are now **factories with all-optional params**, so defining a
  custom palette is a one-liner (`AppColorsExtension.light(brand: ..., success: ...)`) — override
  only what differs. Existing usages must append `()` (`AppColorsExtension.light()`).
- README "Define your own color palette" section; example app now uses a custom brand palette.

## 0.0.2

- `AppTypographyExtension.standard` gains an `applyFont` hook for plugging in font
  systems like `google_fonts` without adding a dependency to the package.
- New tokens as worked examples: `bold28` text style, `link` semantic color,
  `AppSpacing.xxxl`, `AppRadius.xlRadius`.
- README "How to extend" guide (font, text style, color, spacing, radius).
- Example app now uses the Inter font and demos the new tokens.

## 0.0.1

Initial release.

- Semantic colors as `AppColorsExtension` (`ThemeExtension`) with light/dark, `copyWith` and `lerp`.
- Typography as `AppTypographyExtension` with weight+size named styles (`bold14`, `regular16`, …), `copyWith` and `lerp`.
- `AppSpacing`, `AppRadius`, `AppTypographyTokens` token classes (single source of truth).
- `PaddingExtension on Widget`: `withScreenPadding`, `withHorizontalPadding`, `withVerticalPadding`, `withAllPadding`, `withPadding`.
- `ThemeContext on BuildContext`: `context.colors`, `context.typography`, `context.scheme`, `context.isDark`.
- `AppTheme.light` / `AppTheme.dark` / `AppTheme.buildTheme(...)` wiring `fromSeed` + brand overrides + extensions.
- Runnable `example/` app.
