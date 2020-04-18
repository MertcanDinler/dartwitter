//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// dartwitter_exception.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-18T22:00:12.789Z
// Modified: 2020-04-18T22:05:43.212Z
//

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
