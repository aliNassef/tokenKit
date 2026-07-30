import 'package:flutter/widgets.dart';

import '../tokens/app_spacing.dart';

/// Wrap repeated padding in helpers instead of retyping `Padding(...)` on every
/// screen. Cleaner widget trees, less duplication, one spacing source.
///
/// ```dart
/// LoginForm().withScreenPadding();
/// Icon(Icons.add).withHorizontalPadding();
/// ```
extension PaddingExtension on Widget {
  /// Standard screen inset — `EdgeInsets.all(AppSpacing.lg)`.
  Widget withScreenPadding() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: this,
    );
  }

  /// Symmetric horizontal padding. Defaults to `AppSpacing.md`.
  Widget withHorizontalPadding([double horizontal = AppSpacing.md]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: this,
    );
  }

  /// Symmetric vertical padding. Defaults to `AppSpacing.md`.
  Widget withVerticalPadding([double vertical = AppSpacing.md]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: this,
    );
  }

  /// Equal padding on all sides.
  Widget withAllPadding([double value = AppSpacing.md]) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  /// Fully custom padding when a helper doesn't fit.
  Widget withPadding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }
}
