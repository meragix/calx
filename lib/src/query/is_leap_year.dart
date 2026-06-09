import 'package:calx/src/internal/calendar_utils.dart' as internal;

/// Returns true if the year of [date] is a leap year.
///
/// A year is a leap year if it is divisible by 4, except for century years,
/// which must be divisible by 400.
///
/// ```dart
/// isLeapYear(DateTime(2024)) // → true
/// isLeapYear(DateTime(2025)) // → false
/// isLeapYear(DateTime(1900)) // → false
/// isLeapYear(DateTime(2000)) // → true
/// ```
bool isLeapYear(DateTime date) => internal.isLeapYear(date.year);
