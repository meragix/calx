# Architecture & Design Decisions

## Library invariants

These invariants are non-negotiable. Every contribution must respect them.

1. **UTC/Local preservation**
   Every function returns a `DateTime` with the same `isUtc` flag as its input.
   Calx never performs implicit conversion between representations.

2. **Civil time arithmetic**
   `addDays(date, 1)` returns the next calendar day, regardless of DST.
   An alarm set at 07:00 + 1 day rings at 07:00 the next day; never at 06:00 or 08:00.

3. **Strict immutability**
   No function modifies the `DateTime` instance passed as a parameter.
   Every operation returns a new instance.

4. **Mixed representation guard**
   Comparing a UTC `DateTime` with a local `DateTime` is a programming error.
   Calx throws an `AssertionError` in debug mode via `assertSameRepresentation`.

## Architectural decisions

### UTC/Local strategy: polymorphism by inspection

Every `DateTime` reconstruction goes through `reconstructDate` in
`src/internal/date_factory.dart`. This is the only place in the package where
a `DateTime` is instantiated; it centralizes UTC/Local invariant management.

**Rejected: strategy via distinct types (`LocalDate`, `UtcDate`)**
Adoption friction too high. Flutter developers manipulate native `DateTime`
instances from the SDK and external APIs. Forcing them to convert to custom types
reduces adoption.

### Civil vs physical arithmetic

Calx implements civil arithmetic (Behavior A).
`date.add(Duration(days: 1))` is already available in the SDK for
physical arithmetic (Behavior B). Both coexist without conflict.

**Reference:** date-fns (JavaScript) follows the same principle.

### Hybrid API: pure functions + opt-in extensions

The main public contract is exposed via `calx.dart` (pure functions).
The extensions in `calx_extensions.dart` are a thin wrapper; zero logic,
pure delegation. The user chooses their level of engagement.

## Documented edge cases

| Function | Edge case | Behavior |
|---|---|---|
| `addMonths` | Jan 31 + 1 month | Clamped to Feb 28/29 |
| `addMonths` | Negative amount | Floor division for correct modulo |
| `addMonths` | Non-reversible | `addMonths(addMonths(d,1),-1) != d` when clamp is active |
| `addYears` | Feb 29 + 1 year | Clamped to Feb 28 |
| `differenceInDays` | DST | Truncated to midnight; physical time ignored |
| `isSameDay` | UTC vs Local | AssertionError in debug mode |

## Layer structure

```
internal/     → private helpers; never exported
manipulation/ → operations that return a modified DateTime
comparison/   → operations that return a bool
query/        → operations that return a scalar value
extensions/   → opt-in thin wrappers on DateTime
```