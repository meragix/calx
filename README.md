# Welcome to Calx

A functional, tree-shakeable date utility library for Dart, proudly inspired by [date-fns](https://date-fns.org).

Calx works directly on your native `DateTime` objects. That means **zero wrapper overhead** and absolutely **zero dependencies**. It’s just clean, reliable date manipulation.

## Why choose Calx?

If you've ever wrestled with Daylight Saving Time (DST) or bulky date wrappers, Calx is here to help. Here is how we stack up:

| Feature | `DateTime` SDK | `jiffy` | `calx` |
|---|---|---|---|
| **Paradigm** | Imperative | OO Wrapper | **Pure functional** |
| **Tree-shaking** | Native | ❌ Monolith | ✅ **Per function** |
| **Dependencies** | None | Yes | ✅ **Zero** |
| **DST-safe** | ❌ Tricky | Partial | ✅ **Tested invariants** |
| **Immutability** | ✅ | ❌ | ✅ |

## Installation

Getting started is simple. Just add Calx to your `pubspec.yaml`:

```yaml
dependencies:
  calx: ^0.1.0
```

## How to Use It

You can use Calx in two ways, depending on your coding style:

### 1. Pure functions (Main API)
For fans of functional programming, use the core functions directly.

```dart
import 'package:calx/calx.dart';

// Manipulation
final nextMonth  = addMonths(DateTime.now(), 1);
final nextWeek   = addDays(DateTime.now(), 7);
final nextYear   = addYears(DateTime.now(), 1);
final weekStart  = startOfWeek(DateTime.now());

// Comparison
final isOverdue  = isBeforeDay(dueDate, DateTime.now());
final sameDay    = isSameDay(dateA, dateB);
final sameMonth  = isSameMonth(dateA, dateB);
final inRange    = isWithinInterval(date, start: from, end: to);

// Query
final leapYear   = isLeapYear(DateTime.now());
final today      = isToday(date);
final days       = daysInMonth(DateTime.now());
final diff       = differenceInDays(dateA, dateB);
```

### 2. Opt-in extensions (Fluent API)
If you prefer method chaining, you can easily opt-in to our extension methods.

```dart
import 'package:calx/calx_extensions.dart';

final next  = DateTime.now().addMonths(1);
final start = DateTime.now().startOfWeek();
final same  = dateA.isSameDay(dateB);
final leap  = DateTime(2024).isLeapYear;
```

## Our Core Principles

Calx is built around four fundamental principles to guarantee predictable and safe date math:

- **UTC/Local preservation:** every function returns a `DateTime` with the exact same `isUtc` flag as its input. We never convert types unexpectedly.
- **Civil time arithmetic:** `addDays(date, 1)` always returns the next calendar day, regardless of Daylight Saving Time (DST) shifts. 
- **Strict immutability:** no function ever modifies the input date you pass in.
- **Mixed representation guard:** comparing a UTC `DateTime` with a local `DateTime` is usually a bug waiting to happen, so Calx throws an `AssertionError` in debug mode to help you catch it early!

Want to know more?  
Check out our [Architecture & Design Decisions](doc/architecture.md) and learn more about [how we handle Daylight Saving Time](doc/dst_handling.md).

## Compatibility

- Dart SDK `>=3.0.0 <4.0.0`
- Flutter ✅, works beautifully on mobile, web, and desktop!

## Contributing

We'd love your help to make Calx even better! If you're interested in contributing, please check out our [Contributing Guidelines](CONTRIBUTING.md) to get started.