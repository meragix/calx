import 'package:test/test.dart';
import 'package:calx/src/internal/calendar_utils.dart';

void main() {
  group('daysInMonth', () {
    test('standard months', () {
      expect(daysInMonth(2026, 1), 31);
      expect(daysInMonth(2026, 4), 30);
      expect(daysInMonth(2026, 6), 30);
    });

    test('February in a non-leap year', () {
      expect(daysInMonth(2025, 2), 28);
    });

    test('February in a leap year', () {
      expect(daysInMonth(2024, 2), 29);
      expect(daysInMonth(2000, 2), 29); // divisible by 400
      expect(daysInMonth(1900, 2), 28); // divisible by 100 but not 400
    });
  });

  group('isLeapYear', () {
    test('classic leap year', () => expect(isLeapYear(2024), true));
    test('non-leap year', () => expect(isLeapYear(2025), false));
    test('century non-leap year', () => expect(isLeapYear(1900), false));
    test('century leap year', () => expect(isLeapYear(2000), true));
  });
}
