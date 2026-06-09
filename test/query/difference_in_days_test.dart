import 'package:test/test.dart';
import 'package:calx/src/query/difference_in_days.dart';

void main() {
  group('differenceInDays', () {
    group('standard cases', () {
      test('1 day', () {
        expect(
          differenceInDays(DateTime(2026, 3, 16), DateTime(2026, 3, 15)),
          1,
        );
      });

      test('negative result when dateA is before dateB', () {
        expect(
          differenceInDays(DateTime(2026, 3, 15), DateTime(2026, 3, 16)),
          -1,
        );
      });

      test('same day: 0', () {
        expect(
          differenceInDays(
              DateTime(2026, 3, 15, 10, 0), DateTime(2026, 3, 15, 22, 0)),
          0,
        );
      });

      test('month boundary', () {
        expect(
          differenceInDays(DateTime(2026, 4, 1), DateTime(2026, 3, 1)),
          31,
        );
      });

      test('year boundary', () {
        expect(
          differenceInDays(DateTime(2027, 1, 1), DateTime(2026, 1, 1)),
          365,
        );
      });

      test('leap year', () {
        expect(
          differenceInDays(DateTime(2025, 1, 1), DateTime(2024, 1, 1)),
          366,
        );
      });
    });

    group('civil time: ignores time fields', () {
      test('23h59 vs 00h01 next day → 1 civil day', () {
        expect(
          differenceInDays(
              DateTime(2026, 3, 16, 0, 1), DateTime(2026, 3, 15, 23, 59)),
          1,
        );
      });

      test('different time, same day → 0', () {
        expect(
          differenceInDays(
              DateTime(2026, 3, 15, 23, 0), DateTime(2026, 3, 15, 1, 0)),
          0,
        );
      });
    });

    group('UTC/Local invariant', () {
      test('both UTC', () {
        expect(
          differenceInDays(
              DateTime.utc(2026, 3, 16), DateTime.utc(2026, 3, 15)),
          1,
        );
      });

      test('UTC vs Local: AssertionError in debug mode', () {
        expect(
          () => differenceInDays(
              DateTime.utc(2026, 3, 16), DateTime(2026, 3, 15)),
          throwsA(isA<AssertionError>()),
        );
      });
    });
  });
}
