import 'package:test/test.dart';
import 'package:calx/src/manipulation/add_years.dart';

void main() {
  group('addYears', () {
    group('standard cases', () {
      test('adds 1 year', () {
        expect(addYears(DateTime(2026, 3, 15), 1), DateTime(2027, 3, 15));
      });

      test('subtraction', () {
        expect(addYears(DateTime(2026, 3, 15), -1), DateTime(2025, 3, 15));
      });

      test('amount == 0 returns identical date', () {
        final date = DateTime(2026, 3, 15);
        expect(addYears(date, 0), date);
      });

      test('amount > 1', () {
        expect(addYears(DateTime(2026, 3, 15), 5), DateTime(2031, 3, 15));
      });
    });

    group('leap year clamping', () {
      test('Feb 29 + 1 year → Feb 28', () {
        expect(addYears(DateTime(2024, 2, 29), 1), DateTime(2025, 2, 28));
      });

      test('Feb 29 + 4 years → Feb 29', () {
        expect(addYears(DateTime(2024, 2, 29), 4), DateTime(2028, 2, 29));
      });
    });

    group('UTC/Local invariant', () {
      test('UTC input → UTC output', () {
        final result = addYears(DateTime.utc(2026, 3, 15), 1);
        expect(result.isUtc, true);
        expect(result, DateTime.utc(2027, 3, 15));
      });

      test('Local input → Local output', () {
        final result = addYears(DateTime(2026, 3, 15), 1);
        expect(result.isUtc, false);
      });
    });
  });
}
