import 'package:flutter/material.dart';

import '../tokens/app_typography_tokens.dart';

/// Typography exposed as a [ThemeExtension].
///
/// Styles are named by **weight + size** so the call site says exactly what it
/// renders and there are no magic numbers in widgets:
///
/// ```dart
/// Text('Appointment', style: context.typography.bold18);
/// ```
///
/// Implements [lerp] so text transitions smoothly between themes.
@immutable
class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  const AppTypographyExtension({
    required this.regular12,
    required this.medium12,
    required this.bold12,
    required this.regular14,
    required this.medium14,
    required this.bold14,
    required this.regular16,
    required this.medium16,
    required this.semibold16,
    required this.bold16,
    required this.medium18,
    required this.bold18,
    required this.bold20,
    required this.bold24,
    required this.bold28,
  });

  final TextStyle regular12;
  final TextStyle medium12;
  final TextStyle bold12;
  final TextStyle regular14;
  final TextStyle medium14;
  final TextStyle bold14;
  final TextStyle regular16;
  final TextStyle medium16;
  final TextStyle semibold16;
  final TextStyle bold16;
  final TextStyle medium18;
  final TextStyle bold18;
  final TextStyle bold20;
  final TextStyle bold24;
  final TextStyle bold28;

  // --- Semantic aliases (optional convenience) --------------------------
  /// Alias for [bold18].
  TextStyle get cardTitle => bold18;

  /// Alias for [bold24].
  TextStyle get displayLarge => bold24;

  /// Alias for [bold28].
  TextStyle get displayXl => bold28;

  /// Alias for [regular16].
  TextStyle get bodyPrimary => regular16;

  /// Alias for [regular14].
  TextStyle get bodySecondary => regular14;

  /// Alias for [regular12].
  TextStyle get caption => regular12;

  /// Alias for [semibold16].
  TextStyle get button => semibold16;

  /// Default type scale.
  ///
  /// - Pass [fontFamily] for a plain platform/asset font family name.
  /// - Pass [applyFont] to transform every base style — this is how you plug in
  ///   packages like `google_fonts`:
  ///   ```dart
  ///   AppTypographyExtension.standard(
  ///     applyFont: (base) => GoogleFonts.inter(textStyle: base),
  ///   );
  ///   ```
  factory AppTypographyExtension.standard({
    String? fontFamily,
    TextStyle Function(TextStyle base)? applyFont,
  }) {
    TextStyle s(double size, FontWeight weight) {
      final base =
          AppTypographyTokens.style(size, weight, fontFamily: fontFamily);
      return applyFont == null ? base : applyFont(base);
    }

    return AppTypographyExtension(
      regular12: s(AppTypographyTokens.size12, AppTypographyTokens.regular),
      medium12: s(AppTypographyTokens.size12, AppTypographyTokens.medium),
      bold12: s(AppTypographyTokens.size12, AppTypographyTokens.bold),
      regular14: s(AppTypographyTokens.size14, AppTypographyTokens.regular),
      medium14: s(AppTypographyTokens.size14, AppTypographyTokens.medium),
      bold14: s(AppTypographyTokens.size14, AppTypographyTokens.bold),
      regular16: s(AppTypographyTokens.size16, AppTypographyTokens.regular),
      medium16: s(AppTypographyTokens.size16, AppTypographyTokens.medium),
      semibold16: s(AppTypographyTokens.size16, AppTypographyTokens.semibold),
      bold16: s(AppTypographyTokens.size16, AppTypographyTokens.bold),
      medium18: s(AppTypographyTokens.size18, AppTypographyTokens.medium),
      bold18: s(AppTypographyTokens.size18, AppTypographyTokens.bold),
      bold20: s(AppTypographyTokens.size20, AppTypographyTokens.bold),
      bold24: s(AppTypographyTokens.size24, AppTypographyTokens.bold),
      bold28: s(AppTypographyTokens.size28, AppTypographyTokens.bold),
    );
  }

  @override
  AppTypographyExtension copyWith({
    TextStyle? regular12,
    TextStyle? medium12,
    TextStyle? bold12,
    TextStyle? regular14,
    TextStyle? medium14,
    TextStyle? bold14,
    TextStyle? regular16,
    TextStyle? medium16,
    TextStyle? semibold16,
    TextStyle? bold16,
    TextStyle? medium18,
    TextStyle? bold18,
    TextStyle? bold20,
    TextStyle? bold24,
    TextStyle? bold28,
  }) {
    return AppTypographyExtension(
      regular12: regular12 ?? this.regular12,
      medium12: medium12 ?? this.medium12,
      bold12: bold12 ?? this.bold12,
      regular14: regular14 ?? this.regular14,
      medium14: medium14 ?? this.medium14,
      bold14: bold14 ?? this.bold14,
      regular16: regular16 ?? this.regular16,
      medium16: medium16 ?? this.medium16,
      semibold16: semibold16 ?? this.semibold16,
      bold16: bold16 ?? this.bold16,
      medium18: medium18 ?? this.medium18,
      bold18: bold18 ?? this.bold18,
      bold20: bold20 ?? this.bold20,
      bold24: bold24 ?? this.bold24,
      bold28: bold28 ?? this.bold28,
    );
  }

  @override
  AppTypographyExtension lerp(
    covariant ThemeExtension<AppTypographyExtension>? other,
    double t,
  ) {
    if (other is! AppTypographyExtension) return this;
    return AppTypographyExtension(
      regular12: TextStyle.lerp(regular12, other.regular12, t)!,
      medium12: TextStyle.lerp(medium12, other.medium12, t)!,
      bold12: TextStyle.lerp(bold12, other.bold12, t)!,
      regular14: TextStyle.lerp(regular14, other.regular14, t)!,
      medium14: TextStyle.lerp(medium14, other.medium14, t)!,
      bold14: TextStyle.lerp(bold14, other.bold14, t)!,
      regular16: TextStyle.lerp(regular16, other.regular16, t)!,
      medium16: TextStyle.lerp(medium16, other.medium16, t)!,
      semibold16: TextStyle.lerp(semibold16, other.semibold16, t)!,
      bold16: TextStyle.lerp(bold16, other.bold16, t)!,
      medium18: TextStyle.lerp(medium18, other.medium18, t)!,
      bold18: TextStyle.lerp(bold18, other.bold18, t)!,
      bold20: TextStyle.lerp(bold20, other.bold20, t)!,
      bold24: TextStyle.lerp(bold24, other.bold24, t)!,
      bold28: TextStyle.lerp(bold28, other.bold28, t)!,
    );
  }
}
