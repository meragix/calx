import 'package:calx/src/internal/date_factory.dart';

/// Returns the first day of the week containing [date], at midnight.
///
/// [startDay] defaults to [DateTime.monday] (ISO 8601 standard).
/// Pass [DateTime.sunday] for US/Canadian locale conventions.
///
/// Preserves the UTC/local representation of [date].
///
/// ```dart
/// startOfWeek(DateTime(2026, 3, 18))                          // → 2026-03-16 (monday)
/// startOfWeek(DateTime(2026, 3, 18), startDay: DateTime.sunday) // → 2026-03-15
/// ```
///
/// See also: [addDays], [isWithinInterval]
DateTime startOfWeek(DateTime date, {int startDay = DateTime.monday}) {
  final diff = (date.weekday - startDay) % 7;

  return reconstructDate(
    date,
    day: date.day - diff,
    hour: 0,
    minute: 0,
    second: 0,
  );
}
