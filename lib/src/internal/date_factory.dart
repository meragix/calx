// INTERNAL: not exported via calx.dart
// ignore_for_file: public_member_api_docs

/// Reconstructs a [DateTime] preserving the UTC/local representation.
///
/// Only the fields explicitly provided are changed.
/// Field overflow is handled by Dart's DateTime constructor normalization
/// (e.g., day 32 → first day of next month).
///
/// Does NOT perform timezone conversion; this is an invariant of the library.
@pragma('vm:prefer-inline')
DateTime reconstructDate(
  DateTime src, {
  int? year,
  int? month,
  int? day,
  int? hour,
  int? minute,
  int? second,
}) {
  return src.isUtc
      ? DateTime.utc(
          year ?? src.year,
          month ?? src.month,
          day ?? src.day,
          hour ?? src.hour,
          minute ?? src.minute,
          second ?? src.second,
        )
      : DateTime(
          year ?? src.year,
          month ?? src.month,
          day ?? src.day,
          hour ?? src.hour,
          minute ?? src.minute,
          second ?? src.second,
        );
}
