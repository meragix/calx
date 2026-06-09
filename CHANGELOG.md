# Changelog

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](https://semver.org).

## [0.1.0] - 2026-06-09

### Added

**Manipulation**
- `addDays` / `subDays`: civil time, DST-safe
- `addMonths` / `subMonths`: with end-of-month clamping
- `addYears` / `subYears`: with leap year clamping
- `startOfWeek`: configurable start day (default: Monday)

**Comparison**
- `isSameDay`: compares year, month, day fields
- `isSameMonth`: compares year, month fields
- `isBeforeDay`: strict day-level comparison
- `isWithinInterval`: inclusive interval check

**Query**
- `daysInMonth`: leap-year aware
- `differenceInDays`: civil time, DST-safe
- `isLeapYear`: full Gregorian rules (÷4, ÷100, ÷400)
- `isToday`: civil time comparison against `DateTime.now()`

**Extensions (opt-in)**
- `calx_extensions.dart`: fluent API over all core functions

### Design
- Zero dependencies
- UTC/Local preservation invariant on all functions
- Civil time arithmetic throughout
- `AssertionError` in debug mode on mixed UTC/Local comparisons
- 106 tests, 100% edge case coverage (DST, leap years, month overflow)