import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tokenkit/tokenkit.dart';

void main() => runApp(const DemoApp());

/// Type scale rendered with the Inter font from `google_fonts`.
///
/// `applyFont` transforms every base style so the whole scale switches font in
/// one place — `textStyle:` preserves each style's size/weight and triggers
/// google_fonts' lazy loader.
final _typography = AppTypographyExtension.standard(
  applyFont: (base) => GoogleFonts.cabin(textStyle: base),
);

/// A custom brand palette — override only the colors you care about; every
/// other color keeps its sensible default.
final _colorsLight = AppColorsExtension.light(
  brand: const Color(0xFFEC4899),
  surface: Colors.amberAccent,
);
final _colorsDark = AppColorsExtension.dark(brand: const Color(0xFFF472B6));

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode _mode = ThemeMode.light;

  void _toggle() => setState(() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tokenkit demo',
      debugShowCheckedModeBanner: false,
      // Colors + typography animate between these via lerp().
      // Custom Inter typography is injected via the `typography:` override.
      theme: AppTheme.buildTheme(
        brightness: Brightness.light,
        colors: _colorsLight,
        typography: _typography,
      ),
      darkTheme: AppTheme.buildTheme(
        brightness: Brightness.dark,
        colors: _colorsDark,
        typography: _typography,
      ),
      themeMode: _mode,
      home: DemoPage(onToggleTheme: _toggle),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key, required this.onToggleTheme});

  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final type = context.typography;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        title: Text('Design Tokens', style: type.bold18),
        actions: [
          IconButton(
            onPressed: onToggleTheme,
            icon: Icon(context.isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: ListView(
        children: [
          // Typography scale — weight+size names, zero magic numbers.
          // bold28 is the custom-added style; whole scale renders in Inter.
          Text('Inter · bold28', style: type.bold28),
          Text('Appointment', style: type.bold24),
          AppSpacing.gapSm,
          Text('Card title uses bold18', style: type.bold18),
          Text('Body text uses regular16', style: type.regular16),
          Text('Caption uses regular12', style: type.regular12),
          AppSpacing.gapLg,

          // Semantic colors via context.colors — includes the added `link`.
          Text('Semantic colors', style: type.semibold16),
          AppSpacing.gapSm,
          Wrap(
            spacing: AppSpacing.lg,
            runSpacing: AppSpacing.sm,
            children: [
              _SemanticChip(label: 'success', color: colors.success),
              _SemanticChip(label: 'warning', color: colors.warning),
              _SemanticChip(label: 'info', color: colors.info),
              _SemanticChip(label: 'danger', color: colors.danger),
              _SemanticChip(label: 'link', color: colors.link),
            ],
          ),
          AppSpacing.gapLg,

          // Added tokens: xxxl spacing gap + xlRadius container.
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.surfaceMuted,
              borderRadius: AppRadius.xlRadius,
            ),
            child: Text(
              'AppRadius.xlRadius + AppSpacing.xxxl gap below',
              style: type.medium14,
            ).withAllPadding(AppSpacing.md),
          ),
          const SizedBox(height: AppSpacing.xxxl),

          // Shared radius on a card.
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: AppRadius.mdRadius,
            ),
            child: Text(
              'AppRadius.mdRadius card',
              style: type.medium14,
            ).withAllPadding(AppSpacing.md),
          ),
          AppSpacing.gapMd,

          // Padding extension helpers.
          Container(
            color: colors.surfaceMuted,
            child: Text(
              'withHorizontalPadding()',
              style: type.regular14,
            ).withHorizontalPadding(),
          ),
          AppSpacing.gapSm,
          Container(
            color: colors.surfaceMuted,
            child: Text(
              'withVerticalPadding()',
              style: type.regular14,
            ).withVerticalPadding(),
          ),
        ],
        // Whole screen inset in one call.
      ).withScreenPadding(),
    );
  }
}

class _SemanticChip extends StatelessWidget {
  const _SemanticChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppRadius.pillRadius,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Text(
        label,
        style: context.typography.medium14.copyWith(
          color: context.colors.onSemantic,
        ),
      ),
    );
  }
}
