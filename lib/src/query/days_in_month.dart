import 'package:calx/src/internal/calendar_utils.dart' as internal;

/// Returns the number of days in the month of [date].
///
/// Accounts for leap years when the month is February.
///
/// ```dart
/// daysInMonth(DateTime(2026, 1)) // → 31
/// daysInMonth(DateTime(2026, 4)) // → 30
/// daysInMonth(DateTime(2024, 2)) // → 29
/// daysInMonth(DateTime(2025, 2)) // → 28
/// ```
///
/// See also: [isLeapYear]
int daysInMonth(DateTime date) => internal.daysInMonth(date.year, date.month);
