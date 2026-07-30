import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';

/// Semantic colors exposed as a [ThemeExtension].
///
/// Widgets consume meaning, not raw colors: `context.colors.success` instead of
/// `Colors.green`. When the brand changes you edit one instance here — every
/// screen follows.
///
/// Implements [lerp] so switching between light and dark animates smoothly
/// instead of jumping.
@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.brand,
    required this.onBrand,
    required this.success,
    required this.warning,
    required this.info,
    required this.danger,
    required this.link,
    required this.onSemantic,
    required this.surface,
    required this.surfaceMuted,
    required this.onSurface,
  });

  final Color brand;
  final Color onBrand;
  final Color success;
  final Color warning;
  final Color info;
  final Color danger;
  final Color link;

  /// Foreground color to use on top of a semantic/brand fill.
  final Color onSemantic;

  final Color surface;
  final Color surfaceMuted;
  final Color onSurface;

  /// The light palette. Call with no args for the sensible defaults, or pass
  /// only the colors you want to change to define your own palette:
  ///
  /// ```dart
  /// final brand = AppColorsExtension.light(
  ///   brand: Color(0xFFEC4899),
  ///   success: Color(0xFF10B981),
  /// ); // every other color keeps its default
  /// ```
  ///
  /// When you add a new field to this class, add one optional param here plus a
  /// `?? <light default>` line below.
  factory AppColorsExtension.light({
    Color? brand,
    Color? onBrand,
    Color? success,
    Color? warning,
    Color? info,
    Color? danger,
    Color? link,
    Color? onSemantic,
    Color? surface,
    Color? surfaceMuted,
    Color? onSurface,
  }) {
    return AppColorsExtension(
      brand: brand ?? AppColors.primary,
      onBrand: onBrand ?? AppColors.onPrimary,
      success: success ?? AppColors.successLight,
      warning: warning ?? AppColors.warningLight,
      info: info ?? AppColors.infoLight,
      danger: danger ?? AppColors.dangerLight,
      link: link ?? AppColors.linkLight,
      onSemantic: onSemantic ?? AppColors.onSemantic,
      surface: surface ?? AppColors.surfaceLight,
      surfaceMuted: surfaceMuted ?? AppColors.surfaceMutedLight,
      onSurface: onSurface ?? AppColors.onSurfaceLight,
    );
  }

  /// The dark palette. Same ergonomics as [AppColorsExtension.light] — pass only
  /// the colors you want to override.
  factory AppColorsExtension.dark({
    Color? brand,
    Color? onBrand,
    Color? success,
    Color? warning,
    Color? info,
    Color? danger,
    Color? link,
    Color? onSemantic,
    Color? surface,
    Color? surfaceMuted,
    Color? onSurface,
  }) {
    return AppColorsExtension(
      brand: brand ?? AppColors.primary,
      onBrand: onBrand ?? AppColors.onPrimary,
      success: success ?? AppColors.successDark,
      warning: warning ?? AppColors.warningDark,
      info: info ?? AppColors.infoDark,
      danger: danger ?? AppColors.dangerDark,
      link: link ?? AppColors.linkDark,
      onSemantic: onSemantic ?? AppColors.onSemantic,
      surface: surface ?? AppColors.surfaceDark,
      surfaceMuted: surfaceMuted ?? AppColors.surfaceMutedDark,
      onSurface: onSurface ?? AppColors.onSurfaceDark,
    );
  }

  @override
  AppColorsExtension copyWith({
    Color? brand,
    Color? onBrand,
    Color? success,
    Color? warning,
    Color? info,
    Color? danger,
    Color? link,
    Color? onSemantic,
    Color? surface,
    Color? surfaceMuted,
    Color? onSurface,
  }) {
    return AppColorsExtension(
      brand: brand ?? this.brand,
      onBrand: onBrand ?? this.onBrand,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      danger: danger ?? this.danger,
      link: link ?? this.link,
      onSemantic: onSemantic ?? this.onSemantic,
      surface: surface ?? this.surface,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      onSurface: onSurface ?? this.onSurface,
    );
  }

  @override
  AppColorsExtension lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      brand: Color.lerp(brand, other.brand, t)!,
      onBrand: Color.lerp(onBrand, other.onBrand, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      link: Color.lerp(link, other.link, t)!,
      onSemantic: Color.lerp(onSemantic, other.onSemantic, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
    );
  }
}
