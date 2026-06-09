import 'package:test/test.dart';
import 'package:calx/src/internal/date_factory.dart';

void main() {
  group('reconstructDate', () {
    group('preserves UTC flag', () {
      test('UTC input → UTC output', () {
        final date = DateTime.utc(2026, 3, 15, 10, 30);
        final result = reconstructDate(date, day: 20);
        expect(result.isUtc, true);
        expect(result.day, 20);
        expect(result.hour, 10); // other fields are preserved
      });

      test('Local input → Local output', () {
        final date = DateTime(2026, 3, 15, 10, 30);
        final result = reconstructDate(date, day: 20);
        expect(result.isUtc, false);
        expect(result.day, 20);
      });
    });

    group('overflow normalization', () {
      test('day 32 in January → February 1st', () {
        final date = DateTime(2026, 1, 15);
        final result = reconstructDate(date, day: 32);
        expect(result.month, 2);
        expect(result.day, 1);
      });

      test('month 13 → January of the following year', () {
        final date = DateTime(2026, 1, 15);
        final result = reconstructDate(date, month: 13);
        expect(result.year, 2027);
        expect(result.month, 1);
      });
    });

    group('preserves unmodified fields', () {
      test('only the month changes', () {
        final date = DateTime.utc(2026, 1, 15, 10, 30, 45);
        final result = reconstructDate(date, month: 6);
        expect(result.year, 2026);
        expect(result.day, 15);
        expect(result.hour, 10);
        expect(result.minute, 30);
        expect(result.second, 45);
      });
    });
  });
}
