import 'package:test/test.dart';
import 'package:calx/src/comparison/is_before_day.dart';

void main() {
  group('isBeforeDay', () {
    group('standard cases', () {
      test('dateA before dateB', () {
        expect(
          isBeforeDay(DateTime(2026, 3, 14), DateTime(2026, 3, 15)),
          true,
        );
      });

      test('dateA after dateB', () {
        expect(
          isBeforeDay(DateTime(2026, 3, 16), DateTime(2026, 3, 15)),
          false,
        );
      });

      test('same day: false (not strictly before)', () {
        expect(
          isBeforeDay(
              DateTime(2026, 3, 15, 10, 0), DateTime(2026, 3, 15, 22, 0)),
          false,
        );
      });

      test('month boundary', () {
        expect(
          isBeforeDay(DateTime(2026, 2, 28), DateTime(2026, 3, 1)),
          true,
        );
      });

      test('year boundary', () {
        expect(
          isBeforeDay(DateTime(2025, 12, 31), DateTime(2026, 1, 1)),
          true,
        );
      });
    });

    group('UTC/Local invariant', () {
      test('both UTC', () {
        expect(
          isBeforeDay(DateTime.utc(2026, 3, 14), DateTime.utc(2026, 3, 15)),
          true,
        );
      });

      test('UTC vs Local: AssertionError in debug mode', () {
        expect(
          () => isBeforeDay(DateTime.utc(2026, 3, 14), DateTime(2026, 3, 15)),
          throwsA(isA<AssertionError>()),
        );
      });
    });
  });
}
