//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// dartwitter_exception.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mertcandinler/dartwitter/master/LICENSE
//
// Created:  2020-04-18T22:00:12.789Z
// Modified: 2020-04-20T10:37:52.317Z
//

class DartwitterError implements Exception {
  /// A message describing the format error.
  final String message;

  /// Creates a new DartwitterError with an optional error [message].
  const DartwitterError([this.message = '']);

  @override
  String toString() {
    if (message == null) return 'DartwitterError';
    return 'DartwitterError: $message';
  }
}
