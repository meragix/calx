// INTERNAL: not exported via calx.dart
// ignore_for_file: public_member_api_docs

const List<int> _daysInMonthTable = [
  0, // index 0: unused; months are 1-indexed
  31, 28, 31, 30, 31, 30,
  31, 31, 30, 31, 30, 31,
];

bool isLeapYear(int year) =>
    (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0);

int daysInMonth(int year, int month) {
  if (month == 2 && isLeapYear(year)) return 29;
  return _daysInMonthTable[month];
}
