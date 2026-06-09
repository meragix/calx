import 'package:test/test.dart';
import 'package:calx/src/comparison/is_within_interval.dart';

void main() {
  group('isWithinInterval', () {
    final start = DateTime(2026, 3, 1);
    final end = DateTime(2026, 3, 31);

    group('standard cases', () {
      test('within the interval', () {
        expect(isWithinInterval(DateTime(2026, 3, 15), start: start, end: end),
            true);
      });

      test('before the start', () {
        expect(isWithinInterval(DateTime(2026, 2, 28), start: start, end: end),
            false);
      });

      test('after the end', () {
        expect(isWithinInterval(DateTime(2026, 4, 1), start: start, end: end),
            false);
      });

      test('equal to start: inclusive', () {
        expect(isWithinInterval(DateTime(2026, 3, 1), start: start, end: end),
            true);
      });

      test('equal to end: inclusive', () {
        expect(isWithinInterval(DateTime(2026, 3, 31), start: start, end: end),
            true);
      });
    });

    group('assertion start <= end', () {
      test('start after end: AssertionError', () {
        expect(
          () => isWithinInterval(DateTime(2026, 3, 15), start: end, end: start),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('UTC/Local invariant', () {
      test('all UTC', () {
        expect(
          isWithinInterval(
            DateTime.utc(2026, 3, 15),
            start: DateTime.utc(2026, 3, 1),
            end: DateTime.utc(2026, 3, 31),
          ),
          true,
        );
      });

      test('UTC vs Local: AssertionError in debug mode', () {
        expect(
          () => isWithinInterval(
            DateTime(2026, 3, 15),
            start: DateTime.utc(2026, 3, 1),
            end: DateTime.utc(2026, 3, 31),
          ),
          throwsA(isA<AssertionError>()),
        );
      });
    });
  });
}
