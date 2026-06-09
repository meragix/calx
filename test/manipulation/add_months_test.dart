import 'package:test/test.dart';
import 'package:calx/src/manipulation/add_months.dart';

void main() {
  group('addMonths', () {
    group('standard cases', () {
      test('adds 1 month without overflow', () {
        expect(addMonths(DateTime(2026, 3, 15), 1), DateTime(2026, 4, 15));
      });

      test('adds multiple months', () {
        expect(addMonths(DateTime(2026, 1, 1), 6), DateTime(2026, 7, 1));
      });

      test('amount > 12', () {
        expect(addMonths(DateTime(2026, 1, 15), 13), DateTime(2027, 2, 15));
      });

      test('subtraction (negative amount)', () {
        expect(addMonths(DateTime(2026, 3, 15), -1), DateTime(2026, 2, 15));
      });

      test('rolls over to next year', () {
        expect(addMonths(DateTime(2026, 12, 1), 1), DateTime(2027, 1, 1));
      });

      test('rolls back to previous year', () {
        expect(addMonths(DateTime(2026, 1, 1), -1), DateTime(2025, 12, 1));
      });

      test('amount == 0 returns identical date', () {
        final date = DateTime(2026, 3, 15);
        expect(addMonths(date, 0), date);
      });
    });

    group('end-of-month clamping', () {
      test('Jan 31 + 1 month → Feb 28 (non-leap year)', () {
        expect(addMonths(DateTime(2025, 1, 31), 1), DateTime(2025, 2, 28));
      });

      test('Jan 31 + 1 month → Feb 29 (leap year)', () {
        expect(addMonths(DateTime(2024, 1, 31), 1), DateTime(2024, 2, 29));
      });

      test('Jan 31 + 13 months → Feb 28 (non-leap year)', () {
        expect(addMonths(DateTime(2026, 1, 31), 13), DateTime(2027, 2, 28));
      });

      test('Mar 31 - 1 month → Feb 28', () {
        expect(addMonths(DateTime(2025, 3, 31), -1), DateTime(2025, 2, 28));
      });

      test('documented non-reversibility', () {
        final jan31 = DateTime(2026, 1, 31);
        final result = addMonths(addMonths(jan31, 1), -1);
        expect(result, isNot(jan31)); // Jan 28, not Jan 31
        expect(result.day, 28);
      });
    });

    group('UTC/Local invariant', () {
      test('UTC input → UTC output', () {
        final result = addMonths(DateTime.utc(2026, 1, 31), 1);
        expect(result.isUtc, true);
        expect(result, DateTime.utc(2026, 2, 28));
      });

      test('Local input → Local output', () {
        final result = addMonths(DateTime(2026, 1, 31), 1);
        expect(result.isUtc, false);
        expect(result, DateTime(2026, 2, 28));
      });
    });
  });
}
