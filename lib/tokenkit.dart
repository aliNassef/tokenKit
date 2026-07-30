/// tokenkit — design tokens as Flutter theme extensions.
///
/// Semantic colors, typography, spacing and radius exposed through
/// `ThemeExtension`s and `BuildContext` helpers, so the whole app is built from
/// one source of truth — with zero magic numbers.
///
/// Wire it up once:
///
/// ```dart
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
///   themeMode: ThemeMode.system,
/// );
/// ```
///
/// Then use tokens everywhere:
///
/// ```dart
/// Text('Appointment', style: context.typography.bold18);
/// Container(color: context.colors.success);
/// Padding(padding: EdgeInsets.all(AppSpacing.md));
/// Card(shape: RoundedRectangleBorder(borderRadius: AppRadius.mdRadius));
/// LoginForm().withScreenPadding();
/// ```
library;

// Tokens
export 'src/tokens/app_colors.dart';
export 'src/tokens/app_spacing.dart';
export 'src/tokens/app_radius.dart';
export 'src/tokens/app_typography_tokens.dart';

// Theme extensions
export 'src/extensions/app_colors_extension.dart';
export 'src/extensions/app_typography_extension.dart';

// Helper extensions
export 'src/extensions/padding_extension.dart';
export 'src/extensions/spacing_extension.dart';
export 'src/extensions/context_extension.dart';

// Theme builder
export 'src/theme/app_theme.dart';
