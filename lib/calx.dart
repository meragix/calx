/// Calx: a functional, tree-shakeable date utility library for Dart.
///
/// Inspired by date-fns. Works directly on native [DateTime] with zero wrapper overhead.
///
/// ## Library invariants
///
/// 1. **UTC/Local preservation:** every function returns a [DateTime] with the
///    same [DateTime.isUtc] flag as its input.
/// 2. **Civil time arithmetic:** 1 day = 1 calendar day, regardless of DST.
/// 3. **Immutability:** no function modifies the input [DateTime].
/// 4. **Mixed representation:** comparing or operating on a UTC [DateTime]
///    with a local [DateTime] throws an [AssertionError] in debug mode.
///
/// ## Usage
///
/// ```dart
/// import 'package:calx/calx.dart';
///
/// final nextMonth  = addMonths(DateTime.now(), 1);
/// final weekStart  = startOfWeek(DateTime.now());
/// final isOverdue  = isBeforeDay(dueDate, DateTime.now());
/// ```
///
/// For a fluent API via extension methods, import [calx_extensions] instead:
///
/// ```dart
/// import 'package:calx/calx_extensions.dart';
///
/// final nextMonth = DateTime.now().addMonths(1);
/// ```
library;

// manipulation
export 'src/manipulation/add_days.dart';
export 'src/manipulation/add_months.dart';
export 'src/manipulation/add_years.dart';
export 'src/manipulation/start_of_week.dart';

// comparison
export 'src/comparison/is_same_day.dart';
export 'src/comparison/is_same_month.dart';
export 'src/comparison/is_before_day.dart';
export 'src/comparison/is_within_interval.dart';

// query
export 'src/query/days_in_month.dart';
export 'src/query/difference_in_days.dart';
export 'src/query/is_leap_year.dart';
export 'src/query/is_today.dart';
