import 'package:calx/src/internal/assertions.dart';

/// Returns true if [dateA] and [dateB] fall in the same calendar month.
///
/// Compares year and month fields only; day and time are ignored.
/// Throws [AssertionError] in debug mode if representations differ (UTC vs local).
///
/// ```dart
/// isSameMonth(DateTime(2026, 3, 1), DateTime(2026, 3, 31)) // → true
/// isSameMonth(DateTime(2026, 3, 15), DateTime(2026, 4, 15)) // → false
/// ```
///
/// See also: [isSameDay], [isBeforeDay]
bool isSameMonth(DateTime dateA, DateTime dateB) {
  assertSameRepresentation(dateA, dateB);

  return dateA.year == dateB.year && dateA.month == dateB.month;
}
