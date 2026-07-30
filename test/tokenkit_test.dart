import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tokenkit/tokenkit.dart';

void main() {
  group('AppColorsExtension', () {
    test('lerp blends light and dark into a non-null instance', () {
      final blended =
          AppColorsExtension.light().lerp(AppColorsExtension.dark(), 0.5);
      expect(blended, isA<AppColorsExtension>());
      // Midpoint should differ from both endpoints for a changing channel.
      expect(blended.success, isNot(AppColorsExtension.light().success));
      expect(blended.success, isNot(AppColorsExtension.dark().success));
    });

    test('lerp returns this when other is null', () {
      final same = AppColorsExtension.light().lerp(null, 0.5);
      expect(same.brand, AppColorsExtension.light().brand);
    });

    test('copyWith overrides only the given field', () {
      final updated =
          AppColorsExtension.light().copyWith(success: const Color(0xFF000000));
      expect(updated.success, const Color(0xFF000000));
      expect(updated.warning, AppColorsExtension.light().warning);
      expect(updated.brand, AppColorsExtension.light().brand);
    });

    test('light() factory overrides only the given colors', () {
      final p = AppColorsExtension.light(
        brand: const Color(0xFFEC4899),
        success: const Color(0xFF10B981),
      );
      // Overridden.
      expect(p.brand, const Color(0xFFEC4899));
      expect(p.success, const Color(0xFF10B981));
      // Untouched — keep light defaults.
      expect(p.warning, AppColors.warningLight);
      expect(p.surface, AppColors.surfaceLight);
    });

    test('added `link` color is wired into light/dark and lerp', () {
      expect(AppColorsExtension.light().link, AppColors.linkLight);
      expect(AppColorsExtension.dark().link, AppColors.linkDark);
      final blended =
          AppColorsExtension.light().lerp(AppColorsExtension.dark(), 0.5);
      expect(blended.link,
          Color.lerp(AppColors.linkLight, AppColors.linkDark, 0.5));
    });
  });

  group('AppTypographyExtension', () {
    test('standard builds weight+size named styles correctly', () {
      final t = AppTypographyExtension.standard();
      expect(t.bold14.fontSize, 14);
      expect(t.bold14.fontWeight, FontWeight.w700);
      expect(t.regular16.fontSize, 16);
      expect(t.regular16.fontWeight, FontWeight.w400);
      // Semantic alias points at the expected style.
      expect(t.cardTitle, t.bold18);
    });

    test('lerp blends styles smoothly', () {
      final a = AppTypographyExtension.standard();
      final b = AppTypographyExtension.standard(fontFamily: 'Serif');
      final mid = a.lerp(b, 0.5);
      expect(mid, isA<AppTypographyExtension>());
      expect(mid.bold14.fontSize, 14);
    });

    test('added `bold28` style has the right size/weight', () {
      final t = AppTypographyExtension.standard();
      expect(t.bold28.fontSize, 28);
      expect(t.bold28.fontWeight, FontWeight.w700);
      expect(t.displayXl, t.bold28);
    });

    test('applyFont transforms every base style', () {
      final t = AppTypographyExtension.standard(
        applyFont: (base) => base.copyWith(fontFamily: 'CustomFam'),
      );
      expect(t.bold14.fontFamily, 'CustomFam');
      expect(t.regular16.fontFamily, 'CustomFam');
      // Size/weight preserved through the transform.
      expect(t.bold14.fontSize, 14);
      expect(t.bold14.fontWeight, FontWeight.w700);
    });
  });

  group('added spacing & radius tokens', () {
    test('AppSpacing.xxxl == 64', () {
      expect(AppSpacing.xxxl, 64.0);
    });

    test('AppRadius.xlRadius is 28-circular', () {
      expect(AppRadius.xl, 28.0);
      expect(AppRadius.xlRadius, BorderRadius.circular(28));
    });
  });

  group('AppTheme', () {
    test('light theme registers both extensions', () {
      final theme = AppTheme.light;
      expect(theme.extension<AppColorsExtension>(), isNotNull);
      expect(theme.extension<AppTypographyExtension>(), isNotNull);
      expect(theme.brightness, Brightness.light);
    });

    test('dark theme uses the dark palette', () {
      final theme = AppTheme.dark;
      expect(theme.brightness, Brightness.dark);
      expect(
        theme.extension<AppColorsExtension>()!.surface,
        AppColorsExtension.dark().surface,
      );
    });

    test('buildTheme accepts overrides', () {
      final custom = AppTheme.buildTheme(
        brightness: Brightness.light,
        colors:
            AppColorsExtension.light().copyWith(brand: const Color(0xFF112233)),
      );
      expect(
        custom.extension<AppColorsExtension>()!.brand,
        const Color(0xFF112233),
      );
    });
  });

  testWidgets('context.colors and context.typography resolve', (tester) async {
    late Color success;
    late TextStyle bold14;

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Builder(
          builder: (context) {
            success = context.colors.success;
            bold14 = context.typography.bold14;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(success, AppColorsExtension.light().success);
    expect(bold14.fontSize, 14);
    expect(bold14.fontWeight, FontWeight.w700);
  });

  testWidgets('withScreenPadding wraps child in Padding', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const Text('hi').withScreenPadding(),
      ),
    );
    expect(find.byType(Padding), findsWidgets);
    expect(find.text('hi'), findsOneWidget);
  });
}
