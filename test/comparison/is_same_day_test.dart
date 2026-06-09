import 'package:test/test.dart';
import 'package:calx/src/comparison/is_same_day.dart';

void main() {
  group('isSameDay', () {
    group('standard cases', () {
      test('same day', () {
        expect(
          isSameDay(DateTime(2026, 3, 15, 10, 0), DateTime(2026, 3, 15, 22, 0)),
          true,
        );
      });

      test('different days', () {
        expect(
          isSameDay(DateTime(2026, 3, 15), DateTime(2026, 3, 16)),
          false,
        );
      });

      test('identical instant', () {
        final date = DateTime(2026, 3, 15, 10, 30);
        expect(isSameDay(date, date), true);
      });
    });

    group('day boundaries', () {
      test('start and end of the same day', () {
        expect(
          isSameDay(DateTime(2026, 3, 15, 0, 0, 0),
              DateTime(2026, 3, 15, 23, 59, 59)),
          true,
        );
      });

      test('midnight: next day', () {
        expect(
          isSameDay(DateTime(2026, 3, 15, 23, 59, 59),
              DateTime(2026, 3, 16, 0, 0, 0)),
          false,
        );
      });
    });

    group('UTC/Local invariant', () {
      test('both UTC: same day', () {
        expect(
          isSameDay(DateTime.utc(2026, 3, 15, 10, 0),
              DateTime.utc(2026, 3, 15, 22, 0)),
          true,
        );
      });

      test('both Local: same day', () {
        expect(
          isSameDay(DateTime(2026, 3, 15, 10, 0), DateTime(2026, 3, 15, 22, 0)),
          true,
        );
      });

      test('UTC vs Local: AssertionError in debug mode', () {
        expect(
          () => isSameDay(DateTime.utc(2026, 3, 15), DateTime(2026, 3, 15)),
          throwsA(isA<AssertionError>()),
        );
      });
    });
  });
}
