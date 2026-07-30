import 'package:flutter/material.dart';

/// Raw brand color constants.
///
/// This is the ONLY place raw `Color(0xFF...)` literals should live in the app.
/// Everything else consumes semantic colors through [AppColorsExtension]
/// (`context.colors.success`) so the palette can change in one place.
///
/// These are sensible defaults — override them by passing your own
/// `AppColorsExtension` / seed to `AppTheme.buildTheme(...)`.
class AppColors {
  AppColors._();

  // --- Brand -------------------------------------------------------------
  static const Color primary = Color(0xFF2E6BE6);
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Seed used by `ColorScheme.fromSeed`. Defaults to the brand primary.
  static const Color seed = primary;

  // --- Neutral surfaces (light) -----------------------------------------
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceMutedLight = Color(0xFFF2F4F7);
  static const Color onSurfaceLight = Color(0xFF1A1C1E);

  // --- Neutral surfaces (dark) ------------------------------------------
  static const Color surfaceDark = Color(0xFF121417);
  static const Color surfaceMutedDark = Color(0xFF1E2126);
  static const Color onSurfaceDark = Color(0xFFE6E8EB);

  // --- Semantic raws (light) --------------------------------------------
  static const Color successLight = Color(0xFF1E9E5A);
  static const Color warningLight = Color(0xFFCC8A00);
  static const Color infoLight = Color(0xFF2E6BE6);
  static const Color dangerLight = Color(0xFFD64545);
  static const Color linkLight = Color(0xFF2E6BE6);

  // --- Semantic raws (dark) ---------------------------------------------
  static const Color successDark = Color(0xFF3ECf82);
  static const Color warningDark = Color(0xFFF2B33D);
  static const Color infoDark = Color(0xFF6FA0F5);
  static const Color dangerDark = Color(0xFFF07171);
  static const Color linkDark = Color(0xFF6FA0F5);

  /// Default error color used by `ColorScheme` overrides.
  static const Color error = dangerLight;

  /// Foreground color used on top of a semantic/brand fill.
  static const Color onSemantic = Color(0xFFFFFFFF);
}
