import 'package:test/test.dart';
import 'package:calx/src/query/days_in_month.dart';

void main() {
  group('daysInMonth', () {
    test('January → 31', () => expect(daysInMonth(DateTime(2026, 1)), 31));
    test('April → 30', () => expect(daysInMonth(DateTime(2026, 4)), 30));
    test('February non-leap → 28',
        () => expect(daysInMonth(DateTime(2025, 2)), 28));
    test(
        'February leap → 29', () => expect(daysInMonth(DateTime(2024, 2)), 29));
  });
}
