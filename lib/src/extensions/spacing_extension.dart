import 'package:flutter/widgets.dart';

/// Turn a spacing token into an [EdgeInsets] fluently.
///
/// ```dart
/// Padding(padding: AppSpacing.md.all);
/// Padding(padding: AppSpacing.lg.horizontal);
/// ```
extension SpacingEdgeInsets on double {
  EdgeInsets get all => EdgeInsets.all(this);
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);
  EdgeInsets get top => EdgeInsets.only(top: this);
  EdgeInsets get bottom => EdgeInsets.only(bottom: this);
  EdgeInsets get left => EdgeInsets.only(left: this);
  EdgeInsets get right => EdgeInsets.only(right: this);

  /// A square [SizedBox] gap of this size (works for both Row and Column).
  SizedBox get gap => SizedBox(height: this, width: this);
}
