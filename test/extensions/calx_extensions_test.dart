import 'package:test/test.dart';
import 'package:calx/calx_extensions.dart';

void main() {
  group('CalxManipulation', () {
    test('addDays', () {
      expect(DateTime(2026, 3, 15).addDays(1), DateTime(2026, 3, 16));
    });

    test('subDays', () {
      expect(DateTime(2026, 3, 15).subDays(1), DateTime(2026, 3, 14));
    });

    test('addMonths with clamp', () {
      expect(DateTime(2026, 1, 31).addMonths(1), DateTime(2026, 2, 28));
    });

    test('subMonths', () {
      expect(DateTime(2026, 3, 15).subMonths(1), DateTime(2026, 2, 15));
    });

    test('addYears with leap year clamp', () {
      expect(DateTime(2024, 2, 29).addYears(1), DateTime(2025, 2, 28));
    });

    test('subYears', () {
      expect(DateTime(2026, 3, 15).subYears(1), DateTime(2025, 3, 15));
    });

    test('startOfWeek', () {
      expect(DateTime(2026, 3, 18).startOfWeek(), DateTime(2026, 3, 16));
    });

    test('startOfWeek with Sunday start', () {
      expect(
        DateTime(2026, 3, 18).startOfWeek(startDay: DateTime.sunday),
        DateTime(2026, 3, 15),
      );
    });
  });

  group('CalxComparison', () {
    test('isSameDay', () {
      expect(
          DateTime(2026, 3, 15, 10, 0).isSameDay(DateTime(2026, 3, 15, 22, 0)),
          true);
    });

    test('isSameMonth', () {
      expect(DateTime(2026, 3, 1).isSameMonth(DateTime(2026, 3, 31)), true);
    });

    test('isBeforeDay', () {
      expect(DateTime(2026, 3, 14).isBeforeDay(DateTime(2026, 3, 15)), true);
    });

    test('isWithinInterval', () {
      expect(
        DateTime(2026, 3, 15).isWithinInterval(
          start: DateTime(2026, 3, 1),
          end: DateTime(2026, 3, 31),
        ),
        true,
      );
    });
  });

  group('CalxQuery', () {
    test('isLeapYear', () {
      expect(DateTime(2024).isLeapYear, true);
      expect(DateTime(2025).isLeapYear, false);
    });

    test('isToday', () {
      expect(DateTime.now().isToday, true);
    });

    test('daysInMonth', () {
      expect(DateTime(2026, 1).daysInMonth, 31);
      expect(DateTime(2024, 2).daysInMonth, 29);
    });

    test('differenceInDays', () {
      expect(DateTime(2026, 3, 16).differenceInDays(DateTime(2026, 3, 15)), 1);
    });
  });
}
