import 'package:test/test.dart';
import 'package:calx/src/query/is_today.dart';

void main() {
  group('isToday', () {
    test('today → true', () {
      expect(isToday(DateTime.now()), true);
    });

    test('yesterday → false', () {
      final yesterday = DateTime.now().subtract(const Duration(days: 1));
      expect(isToday(yesterday), false);
    });

    test('tomorrow → false', () {
      final tomorrow = DateTime.now().add(const Duration(days: 1));
      expect(isToday(tomorrow), false);
    });

    test('today at midnight → true', () {
      final now = DateTime.now();
      expect(isToday(DateTime(now.year, now.month, now.day)), true);
    });

    test('today at 23:59 → true', () {
      final now = DateTime.now();
      expect(isToday(DateTime(now.year, now.month, now.day, 23, 59, 59)), true);
    });
  });
}
