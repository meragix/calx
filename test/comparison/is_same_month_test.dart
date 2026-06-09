import 'package:test/test.dart';
import 'package:calx/src/comparison/is_same_month.dart';

void main() {
  group('isSameMonth', () {
    group('standard cases', () {
      test('same month', () {
        expect(
          isSameMonth(DateTime(2026, 3, 1), DateTime(2026, 3, 31)),
          true,
        );
      });

      test('different months, same year', () {
        expect(
          isSameMonth(DateTime(2026, 3, 15), DateTime(2026, 4, 15)),
          false,
        );
      });

      test('same month, different years', () {
        expect(
          isSameMonth(DateTime(2025, 3, 15), DateTime(2026, 3, 15)),
          false,
        );
      });
    });

    group('UTC/Local invariant', () {
      test('both UTC: same month', () {
        expect(
          isSameMonth(DateTime.utc(2026, 3, 1), DateTime.utc(2026, 3, 31)),
          true,
        );
      });

      test('UTC vs Local: AssertionError in debug mode', () {
        expect(
          () => isSameMonth(DateTime.utc(2026, 3, 15), DateTime(2026, 3, 15)),
          throwsA(isA<AssertionError>()),
        );
      });
    });
  });
}
