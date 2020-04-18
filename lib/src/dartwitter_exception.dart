class DartwitterException implements Exception {
  /// A message describing the format error.
  final String message;

  /// Creates a new DartwitterError with an optional error [message].
  const DartwitterException([this.message = '']);

  @override
  String toString() {
    if (message == null) return 'DartwitterException';
    return 'DartwitterException: $message';
  }
}
