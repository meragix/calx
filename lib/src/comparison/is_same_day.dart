import 'package:calx/src/internal/assertions.dart';

/// Returns true if [dateA] and [dateB] fall on the same calendar day.
///
/// Compares year, month, and day fields only; time is ignored.
/// Preserves the UTC/local representation invariant: comparing a UTC
/// [DateTime] with a local [DateTime] throws an [AssertionError] in debug mode.
///
/// ```dart
/// isSameDay(DateTime(2026, 3, 15, 10, 0), DateTime(2026, 3, 15, 22, 0)) // → true
/// isSameDay(DateTime(2026, 3, 15), DateTime(2026, 3, 16))                // → false
/// ```
///
/// See also: [isSameMonth], [isBeforeDay]
bool isSameDay(DateTime dateA, DateTime dateB) {
  assertSameRepresentation(dateA, dateB);

  return dateA.year == dateB.year &&
      dateA.month == dateB.month &&
      dateA.day == dateB.day;
}
