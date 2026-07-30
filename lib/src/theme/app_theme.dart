import 'package:flutter/material.dart';

import '../extensions/app_colors_extension.dart';
import '../extensions/app_typography_extension.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';

/// Assembles ready-to-use [ThemeData] wired with the design-token extensions.
///
/// `fromSeed()` is a start, not an end — we generate a full Material palette
/// from a seed, then override the brand-defining colors, and register
/// [AppColorsExtension] + [AppTypographyExtension] so `context.colors` /
/// `context.typography` resolve everywhere.
///
/// ```dart
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
///   themeMode: ThemeMode.system,
/// );
/// ```
class AppTheme {
  AppTheme._();

  /// Default light theme with sensible defaults.
  static ThemeData get light => buildTheme(brightness: Brightness.light);

  /// Default dark theme with sensible defaults.
  static ThemeData get dark => buildTheme(brightness: Brightness.dark);

  /// Builds a theme, letting consumers override the seed, palette or type scale
  /// without forking the package.
  static ThemeData buildTheme({
    required Brightness brightness,
    Color seed = AppColors.seed,
    AppColorsExtension? colors,
    AppTypographyExtension? typography,
  }) {
    final bool isDark = brightness == Brightness.dark;

    final AppColorsExtension appColors = colors ??
        (isDark ? AppColorsExtension.dark() : AppColorsExtension.light());
    final AppTypographyExtension appTypography =
        typography ?? AppTypographyExtension.standard();

    // fromSeed generates a coherent Material palette; copyWith injects the
    // brand-defining colors on top of it.
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
    ).copyWith(
      primary: appColors.brand,
      onPrimary: appColors.onBrand,
      surface: appColors.surface,
      onSurface: appColors.onSurface,
      error: appColors.danger,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: appColors.surface,
      cardTheme: const CardThemeData(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdRadius),
      ),
      extensions: <ThemeExtension<dynamic>>[
        appColors,
        appTypography,
      ],
    );
  }
}
