import 'package:calx/src/comparison/is_same_day.dart';

/// Returns true if [date] falls on today's calendar day.
///
/// Uses civil time arithmetic; time fields are ignored.
/// Always operates in local time via [DateTime.now].
///
/// ```dart
/// isToday(DateTime.now())                          // → true
/// isToday(DateTime.now().add(Duration(days: 1)))   // → false
/// ```
///
/// See also: [isSameDay]
bool isToday(DateTime date) => isSameDay(date, DateTime.now());
