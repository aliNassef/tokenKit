import 'package:flutter/material.dart';

import 'app_colors_extension.dart';
import 'app_typography_extension.dart';

/// Makes tokens one keystroke away off the [BuildContext].
///
/// If reaching for tokens is hard, the team falls back to hard-coded values —
/// so the right path is also the easiest one:
///
/// ```dart
/// final colors = context.colors;
/// final text = context.typography;
/// ```
extension ThemeContext on BuildContext {
  /// Semantic colors. Requires [AppColorsExtension] registered on the theme
  /// (done for you by `AppTheme`).
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>()!;

  /// Typography scale. Requires [AppTypographyExtension] on the theme.
  AppTypographyExtension get typography =>
      Theme.of(this).extension<AppTypographyExtension>()!;

  /// The Material [ColorScheme] for the current theme.
  ColorScheme get scheme => Theme.of(this).colorScheme;

  /// Whether the active theme is dark.
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
