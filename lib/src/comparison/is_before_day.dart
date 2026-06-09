import 'package:calx/src/internal/assertions.dart';

/// Returns true if [dateA] falls strictly before [dateB] at the day level.
///
/// Time fields are ignored; two instants on the same calendar day return false.
/// Throws [AssertionError] in debug mode if representations differ (UTC vs local).
///
/// ```dart
/// isBeforeDay(DateTime(2026, 3, 14), DateTime(2026, 3, 15)) // → true
/// isBeforeDay(DateTime(2026, 3, 15), DateTime(2026, 3, 15)) // → false
/// isBeforeDay(DateTime(2026, 3, 16), DateTime(2026, 3, 15)) // → false
/// ```
///
/// See also: [isSameDay], [isAfterDay]
bool isBeforeDay(DateTime dateA, DateTime dateB) {
  assertSameRepresentation(dateA, dateB);

  if (dateA.year != dateB.year) return dateA.year < dateB.year;
  if (dateA.month != dateB.month) return dateA.month < dateB.month;
  return dateA.day < dateB.day;
}
