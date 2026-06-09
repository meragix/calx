import 'package:test/test.dart';
import 'package:calx/src/query/is_leap_year.dart';

void main() {
  group('isLeapYear', () {
    test('classic leap year', () => expect(isLeapYear(DateTime(2024)), true));
    test('non-leap year', () => expect(isLeapYear(DateTime(2025)), false));
    test('century non-leap year',
        () => expect(isLeapYear(DateTime(1900)), false));
    test('century leap year', () => expect(isLeapYear(DateTime(2000)), true));
  });
}
