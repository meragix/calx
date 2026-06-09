import 'package:calx/src/internal/calendar_utils.dart';
import 'package:calx/src/internal/date_factory.dart';

/// Adds [amount] months to [date], clamping to the last valid day of the
/// target month if necessary.
///
/// Uses civil time arithmetic; DST transitions do not affect the result.
/// Preserves the UTC/local representation of [date].
///
/// **Non-reversible operation:** `addMonths(addMonths(d, 1), -1)` may not
/// equal `d` when [date] falls on a day that doesn't exist in the
/// intermediate month.
///
/// ```dart
/// addMonths(DateTime(2026, 1, 31), 1)  // → 2026-02-28
/// addMonths(DateTime(2024, 1, 31), 1)  // → 2024-02-29 (leap year)
/// addMonths(DateTime(2026, 3, 31), -1) // → 2026-02-28
/// ```
///
/// See also: [subMonths], [addDays]
DateTime addMonths(DateTime date, int amount) {
  if (amount == 0) return date;

  final totalMonths = date.month - 1 + amount;
  final targetYear = date.year +
      (totalMonths >= 0 ? totalMonths ~/ 12 : (totalMonths - 11) ~/ 12);
  final targetMonth = ((totalMonths % 12) + 12) % 12 + 1;
  final targetDay = date.day.clamp(1, daysInMonth(targetYear, targetMonth));

  return reconstructDate(
    date,
    year: targetYear,
    month: targetMonth,
    day: targetDay,
  );
}

/// Subtracts [amount] months from [date].
/// Equivalent to `addMonths(date, -amount)`.
DateTime subMonths(DateTime date, int amount) => addMonths(date, -amount);
