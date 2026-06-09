# DST Handling in Calx

## The problem

Dart's `DateTime` has no explicit timezone ID (e.g., `Europe/Paris`).
It is either **local** (uses the OS timezone) or **UTC**.

When a DST transition occurs, a local day may last 23h or 25h physically.
This creates a trap for naive implementations:

```dart
// ❌ Naive: physically correct, civilly wrong
date.add(Duration(days: 1)); // 1 day = 24h physical; wrong on DST boundary

// ✅ Calx: civilly correct
addDays(date, 1); // 1 day = next calendar day, always
```

## Calx's approach: Civil Time Arithmetic

Calx implements **Civil Time (Behavior A)**:

> Adding 1 day to `07:00` always returns `07:00` the next calendar day,
> regardless of whether that night lasted 23h or 25h due to DST.

This matches user expectations in UI contexts (alarms, reminders, billing cycles).
Physical time arithmetic is already covered by the Dart SDK via `Duration`.

## Implementation

All date reconstruction goes through `reconstructDate` in `src/internal/date_factory.dart`.
By using the `DateTime` constructor with explicit year/month/day fields (instead of
`add(Duration(...))`), Dart's OS-level timezone handling resolves DST automatically
for local dates.

```dart
// addDays: DST-safe via constructor normalization
DateTime addDays(DateTime date, int amount) {
  if (amount == 0) return date;
  return reconstructDate(date, day: date.day + amount);
}
```

## UTC dates and DST

UTC dates are never affected by DST by definition.
Calx preserves `isUtc` on every operation; a UTC input always produces a UTC output.

## Mixed representation guard

Comparing or operating on a UTC `DateTime` with a local `DateTime` is
undefined behavior in Calx. An `AssertionError` is thrown in debug mode:

```dart
isSameDay(DateTime.utc(2026, 3, 15), DateTime(2026, 3, 15)); // ❌ AssertionError
```

Convert to the same representation first:

```dart
isSameDay(DateTime.utc(2026, 3, 15), DateTime(2026, 3, 15).toUtc()); // ✅
```