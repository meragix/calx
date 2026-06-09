import 'package:test/test.dart';
import 'package:calx/src/manipulation/add_days.dart';

void main() {
  group('addDays', () {
    group('standard cases', () {
      test('adds 1 day', () {
        expect(addDays(DateTime(2026, 3, 15), 1), DateTime(2026, 3, 16));
      });

      test('subtraction (negative amount)', () {
        expect(addDays(DateTime(2026, 3, 15), -1), DateTime(2026, 3, 14));
      });

      test('amount == 0 returns identical date', () {
        final date = DateTime(2026, 3, 15);
        expect(addDays(date, 0), date);
      });

      test('reversibility: addDays is always reversible', () {
        final date = DateTime(2026, 3, 15);
        expect(addDays(addDays(date, 1), -1), date);
      });
    });

    group('calendar overflow', () {
      test('rolls over to next month', () {
        expect(addDays(DateTime(2026, 1, 31), 1), DateTime(2026, 2, 1));
      });

      test('rolls over to next year', () {
        expect(addDays(DateTime(2026, 12, 31), 1), DateTime(2027, 1, 1));
      });

      test('rolls back to previous year', () {
        expect(addDays(DateTime(2026, 1, 1), -1), DateTime(2025, 12, 31));
      });

      test('February in a leap year', () {
        expect(addDays(DateTime(2024, 2, 28), 1), DateTime(2024, 2, 29));
      });

      test('February in a non-leap year', () {
        expect(addDays(DateTime(2025, 2, 28), 1), DateTime(2025, 3, 1));
      });
    });

    group('UTC/Local invariant', () {
      test('UTC input → UTC output', () {
        final result = addDays(DateTime.utc(2026, 3, 15), 1);
        expect(result.isUtc, true);
        expect(result, DateTime.utc(2026, 3, 16));
      });

      test('Local input → Local output', () {
        final result = addDays(DateTime(2026, 3, 15), 1);
        expect(result.isUtc, false);
      });
    });
  });
}
