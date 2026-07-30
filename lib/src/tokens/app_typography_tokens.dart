import 'package:flutter/widgets.dart';

/// The single source of truth for font sizes, weights and family.
///
/// Widgets never write `TextStyle(fontSize: 14, fontWeight: ...)` directly —
/// they read named styles off [AppTypographyExtension] (e.g.
/// `context.typography.bold14`), and those styles are built from the helpers
/// here so sizes/weights live in exactly one place.
class AppTypographyTokens {
  AppTypographyTokens._();

  /// `null` = use the platform's default font family. Override in
  /// `AppTypographyExtension.standard(fontFamily: 'Inter')`.
  static const String? defaultFontFamily = null;

  // --- Size scale --------------------------------------------------------
  static const double size12 = 12.0;
  static const double size14 = 14.0;
  static const double size16 = 16.0;
  static const double size18 = 18.0;
  static const double size20 = 20.0;
  static const double size24 = 24.0;
  static const double size28 = 28.0;

  // --- Weights -----------------------------------------------------------
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  /// Builds a [TextStyle] from a size + weight, applying the given family.
  static TextStyle style(
    double size,
    FontWeight weight, {
    String? fontFamily,
    double? height,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontFamily: fontFamily,
      height: height,
    );
  }
}
