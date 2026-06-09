import 'package:calx/src/internal/calendar_utils.dart';
import 'package:calx/src/internal/date_factory.dart';

/// Adds [amount] years to [date], clamping to the last valid day of the
/// target month if necessary (e.g., Feb 29 on a non-leap year → Feb 28).
///
/// Preserves the UTC/local representation of [date].
///
/// ```dart
/// addYears(DateTime(2024, 2, 29), 1)  // → 2025-02-28
/// addYears(DateTime(2024, 2, 29), 4)  // → 2028-02-29
/// ```
///
/// See also: [subYears], [addMonths]
DateTime addYears(DateTime date, int amount) {
  if (amount == 0) return date;

  final targetYear = date.year + amount;
  final targetDay = date.day.clamp(1, daysInMonth(targetYear, date.month));

  return reconstructDate(date, year: targetYear, day: targetDay);
}

/// Subtracts [amount] years from [date].
/// Equivalent to `addYears(date, -amount)`.
DateTime subYears(DateTime date, int amount) => addYears(date, -amount);
