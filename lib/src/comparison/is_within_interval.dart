import 'package:calx/src/internal/assertions.dart';

/// Returns true if [date] falls within the interval [[start], [end]] inclusive.
///
/// Comparison is at the millisecond level; no truncation to day.
/// Throws [AssertionError] in debug mode if [start] is after [end],
/// or if representations differ (UTC vs local).
///
/// ```dart
/// isWithinInterval(
///   DateTime(2026, 3, 15),
///   start: DateTime(2026, 3, 1),
///   end: DateTime(2026, 3, 31),
/// ) // → true
/// ```
///
/// See also: [isSameDay], [isBeforeDay]
bool isWithinInterval(
  DateTime date, {
  required DateTime start,
  required DateTime end,
}) {
  assertSameRepresentation(date, start);
  assertSameRepresentation(date, end);
  assert(
    !start.isAfter(end),
    'calx: start must not be after end.\n'
    '  start: $start\n'
    '  end:   $end',
  );

  return !date.isBefore(start) && !date.isAfter(end);
}
