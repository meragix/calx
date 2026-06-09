import 'package:test/test.dart';
import 'package:calx/src/manipulation/start_of_week.dart';

void main() {
  group('startOfWeek', () {
    group('Monday as start (default)', () {
      test('mid-week day', () {
        // 2026-03-18 is a Wednesday
        expect(
          startOfWeek(DateTime(2026, 3, 18)),
          DateTime(2026, 3, 16), // Monday
        );
      });

      test('already a Monday', () {
        expect(
          startOfWeek(DateTime(2026, 3, 16)),
          DateTime(2026, 3, 16),
        );
      });

      test('Sunday', () {
        expect(
          startOfWeek(DateTime(2026, 3, 22)),
          DateTime(2026, 3, 16),
        );
      });

      test('month boundary', () {
        // 2026-03-01 is a Sunday
        expect(
          startOfWeek(DateTime(2026, 3, 1)),
          DateTime(2026, 2, 23),
        );
      });

      test('year boundary', () {
        // 2026-01-01 is a Thursday
        expect(
          startOfWeek(DateTime(2026, 1, 1)),
          DateTime(2025, 12, 29),
        );
      });
    });

    group('Sunday as start', () {
      test('mid-week day', () {
        // 2026-03-18 is a Wednesday
        expect(
          startOfWeek(DateTime(2026, 3, 18), startDay: DateTime.sunday),
          DateTime(2026, 3, 15), // Sunday
        );
      });

      test('already a Sunday', () {
        expect(
          startOfWeek(DateTime(2026, 3, 15), startDay: DateTime.sunday),
          DateTime(2026, 3, 15),
        );
      });
    });

    group('UTC/Local invariant', () {
      test('UTC input → UTC output', () {
        final result = startOfWeek(DateTime.utc(2026, 3, 18));
        expect(result.isUtc, true);
        expect(result, DateTime.utc(2026, 3, 16));
      });

      test('Local input → Local output', () {
        final result = startOfWeek(DateTime(2026, 3, 18));
        expect(result.isUtc, false);
      });
    });
  });
}
