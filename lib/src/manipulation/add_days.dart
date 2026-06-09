import 'package:calx/src/internal/date_factory.dart';

/// Adds [amount] days to [date].
///
/// Uses civil time arithmetic; DST transitions do not affect the result.
/// Preserves the UTC/local representation of [date].
///
/// Unlike [addMonths], this operation is always reversible:
/// `addDays(addDays(d, n), -n) == d` for all valid inputs.
///
/// ```dart
/// addDays(DateTime(2026, 1, 31), 1)  // → 2026-02-01
/// addDays(DateTime(2026, 3, 15), -1) // → 2026-03-14
/// ```
///
/// See also: [subDays], [addMonths]
DateTime addDays(DateTime date, int amount) {
  if (amount == 0) return date;

  return reconstructDate(
    date,
    day: date.day + amount,
  );
}

/// Subtracts [amount] days from [date].
/// Equivalent to `addDays(date, -amount)`.
DateTime subDays(DateTime date, int amount) => addDays(date, -amount);
