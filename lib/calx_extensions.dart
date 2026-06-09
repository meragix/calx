/// Opt-in extension methods for [DateTime].
///
/// Provides a fluent API over the core calx functions.
/// Import this file explicitly; it is intentionally separate from [calx]
/// to avoid namespace pollution in large projects.
///
/// ## Collision notice
///
/// If another package defines extensions with the same names on [DateTime],
/// disambiguate via: `CalxManipulation(date).addMonths(1)`.
///
/// ```dart
/// import 'package:calx/calx_extensions.dart';
///
/// final next  = DateTime.now().addMonths(1);
/// final start = DateTime.now().startOfWeek();
/// final same  = dateA.isSameDay(dateB);
/// ```
library;

import 'package:calx/calx.dart' as cx;

/// Manipulation extensions on [DateTime].
extension CalxManipulation on DateTime {
  /// See [addDays].
  DateTime addDays(int amount) => cx.addDays(this, amount);

  /// See [subDays].
  DateTime subDays(int amount) => cx.subDays(this, amount);

  /// See [addMonths].
  DateTime addMonths(int amount) => cx.addMonths(this, amount);

  /// See [subMonths].
  DateTime subMonths(int amount) => cx.subMonths(this, amount);

  /// See [addYears].
  DateTime addYears(int amount) => cx.addYears(this, amount);

  /// See [subYears].
  DateTime subYears(int amount) => cx.subYears(this, amount);

  /// See [startOfWeek].
  DateTime startOfWeek({int startDay = DateTime.monday}) =>
      cx.startOfWeek(this, startDay: startDay);
}

/// Comparison extensions on [DateTime].
extension CalxComparison on DateTime {
  /// See [isSameDay].
  bool isSameDay(DateTime other) => cx.isSameDay(this, other);

  /// See [isSameMonth].
  bool isSameMonth(DateTime other) => cx.isSameMonth(this, other);

  /// See [isBeforeDay].
  bool isBeforeDay(DateTime other) => cx.isBeforeDay(this, other);

  /// See [isWithinInterval].
  bool isWithinInterval({required DateTime start, required DateTime end}) =>
      cx.isWithinInterval(this, start: start, end: end);
}

/// Query extensions on [DateTime].
extension CalxQuery on DateTime {
  /// See [isLeapYear].
  bool get isLeapYear => cx.isLeapYear(this);

  /// See [isToday].
  bool get isToday => cx.isToday(this);

  /// See [daysInMonth].
  int get daysInMonth => cx.daysInMonth(this);

  /// See [differenceInDays].
  int differenceInDays(DateTime other) => cx.differenceInDays(this, other);
}
