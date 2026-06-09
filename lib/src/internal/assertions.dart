// INTERNAL: not exported via calx.dart

/// Asserts that [dateA] and [dateB] share the same UTC/local representation.
///
/// Throws [AssertionError] in debug mode if one is UTC and the other is local.
/// Comparing mixed representations is undefined behavior in calx.
void assertSameRepresentation(DateTime dateA, DateTime dateB) {
  assert(
    dateA.isUtc == dateB.isUtc,
    'calx: cannot compare a UTC DateTime with a local DateTime. '
    'Convert both to the same representation first.\n'
    '  dateA.isUtc: ${dateA.isUtc}\n'
    '  dateB.isUtc: ${dateB.isUtc}',
  );
}
