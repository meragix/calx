import 'package:calx/calx.dart';

/// Examples inspired by real use cases (Tallyno / FamSub).
void main() {
  _tally();
  _famsub();
  _extensions();
}

void _tally() {
  print('=== Tallyno: Expense splitting ===\n');

  final expenseDate = DateTime(2026, 1, 31);
  final dueDate = addMonths(expenseDate, 1);
  final reminder = subDays(dueDate, 3);
  final isOverdue = isBeforeDay(dueDate, DateTime(2026, 3, 1));

  print('Expense created on : $expenseDate');
  print('Due date           : $dueDate'); // → 2026-02-28 (clamp)
  print('Reminder           : $reminder'); // → 2026-02-25
  print('Overdue?           : $isOverdue'); // → true

  final weekStart = startOfWeek(DateTime(2026, 3, 18));
  final weekEnd = addDays(weekStart, 6);
  final inRange = isWithinInterval(
    DateTime(2026, 3, 20),
    start: weekStart,
    end: weekEnd,
  );
  print('Expense this week? : $inRange\n');
}

void _famsub() {
  print('=== FamSub: Subscription cycles ===\n');

  // Netflix billed on the 28th of each month
  final lastBilling = DateTime(2026, 1, 28);
  final nextBilling = addMonths(lastBilling, 1);
  final daysLeft = differenceInDays(nextBilling, DateTime(2026, 2, 10));
  final sameMonth = isSameMonth(nextBilling, DateTime(2026, 2, 1));

  print('Last billing       : $lastBilling');
  print('Next billing       : $nextBilling'); // → 2026-02-28
  print('Days remaining     : $daysLeft'); // → 18
  print('This month?        : $sameMonth'); // → true

  // Annual subscription
  final renewalDate = addYears(DateTime(2025, 3, 1), 1);
  print('Renewal date       : $renewalDate\n');
}

void _extensions() {
  print('=== Fluent API (calx_extensions) ===\n');
  // Imported separately in a real project:
  // import 'package:calx/calx_extensions.dart';

  final now = DateTime(2026, 3, 18);
  print('Today              : $now');
  print('In 1 month         : ${addMonths(now, 1)}');
  print('Start of week      : ${startOfWeek(now)}');
  print('Leap year?         : ${isLeapYear(now)}');
  print('Days in month      : ${daysInMonth(now)}');
}
