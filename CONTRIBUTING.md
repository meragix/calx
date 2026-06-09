# Contributing to Calx

First off, thank you for considering contributing to Calx! We welcome contributions from everyone and appreciate your help in making this library better.

## Setup

Getting started is easy. Just clone the repository and run the tests to make sure everything is set up correctly:

```bash
git clone https://github.com/meragix/calx
cd calx
dart pub get
dart test
```

## Guidelines

To keep the codebase healthy and easy to maintain, we ask that you follow these guidelines when contributing:

### 1. Tests first
We love tests! Please make sure to add a test file before or alongside your implementation.
The test matrix should ideally cover:
- Standard cases
- Edge cases (DST, leap years, month overflow, negative amounts)
- UTC/Local invariant (both representations + mixed assertion)

### 2. Respect library invariants
All four invariants documented in `doc/architecture.md` are essential to the library's reliability. Please ensure your contributions respect them to help us maintain a stable experience for everyone. 

### 3. Keep extensions simple
`calx_extensions.dart` is meant to be a simple wrapper with zero logic; it should only handle delegation. Please place all core logic in the functions under the `src/` directory.

### 4. Internal helpers stay internal
Files under `src/internal/` are meant for internal use and are never exported via `calx.dart`. Please avoid adding public APIs to these files.

### 5. Helpful documentation
To keep our documentation useful for all developers, please include the following for every exported function:
- A one-line summary
- A note on UTC/Local behavior
- At least two `dart` code examples
- A `See also` reference

## Adding a new function

Here is a recommended workflow for adding a new feature:

```
1. Create test/[layer]/your_function_test.dart
2. Run dart test → confirm it fails (red)
3. Create lib/src/[layer]/your_function.dart
4. Run dart test → confirm it passes (green)
5. Export your new function in lib/calx.dart
6. Add an extension in lib/calx_extensions.dart (delegation only)
7. Update CHANGELOG.md
```

## Architecture Layers

Calx is organized into a few clear layers:

| Layer | Purpose |
|---|---|
| `internal/` | Private helpers, never exported |
| `manipulation/` | Operations that return a modified `DateTime` |
| `comparison/` | Operations that return a `bool` |
| `query/` | Operations that return a scalar value |

## Running checks before PR

Before opening a pull request, please run the following checks to ensure everything is in order:

```bash
dart test
dart analyze
dart format --set-exit-if-changed .
```

If all three pass with zero issues, you are good to go! We look forward to reviewing your PR.