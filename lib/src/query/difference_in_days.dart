import 'package:calx/src/internal/assertions.dart';

/// Returns the number of calendar days between [dateA] and [dateB].
///
/// Uses civil time arithmetic; only date fields are compared, time is ignored.
/// This avoids DST pitfalls where a physical day may last 23h or 25h.
///
/// Returns a positive integer if [dateA] is after [dateB], negative if before,
/// and zero if both fall on the same calendar day.
///
/// ```dart
/// differenceInDays(DateTime(2026, 3, 16), DateTime(2026, 3, 15)) // → 1
/// differenceInDays(DateTime(2026, 3, 15), DateTime(2026, 3, 16)) // → -1
/// differenceInDays(DateTime(2026, 3, 15, 23, 0), DateTime(2026, 3, 15, 1, 0)) // → 0
/// ```
///
/// See also: [isSameDay], [isBeforeDay]
int differenceInDays(DateTime dateA, DateTime dateB) {
  assertSameRepresentation(dateA, dateB);

  // Truncate to midnight: civil time comparison, DST-safe
  final a = DateTime(dateA.year, dateA.month, dateA.day);
  final b = DateTime(dateB.year, dateB.month, dateB.day);

  return a.difference(b).inDays;
}
