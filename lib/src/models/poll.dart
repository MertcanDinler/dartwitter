//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// poll.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mertcandinler/dartwitter/master/LICENSE
//
// Created:  2020-04-21T14:19:05.345Z
// Modified: 2020-04-25T10:29:18.833Z
//

import 'dart:convert';

import '../utils.dart';

class Poll {
  /// An array of options, each having a poll position, and the text for that
  /// position.
  List<Map<String, dynamic>> options;

  /// Time stamp (UTC) of when poll ends.
  DateTime endDatetime;

  /// Duration of poll in minutes.
  int durationMinutes;
  String _endDatetime;
  Poll({
    this.options,
    String endDatetime,
    this.durationMinutes,
  }) {
    _endDatetime = endDatetime;
    this.endDatetime = dateTimeFromString(endDatetime);
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'options': options,
      'end_datetime': _endDatetime,
      'duration_minutes': durationMinutes,
    };
  }

  @override
  String toString() =>
      'Poll(options: $options, endDatetime: $endDatetime, durationMinutes: $durationMinutes)';

  static Poll fromJson(String source) => fromMap(json.decode(source));

  static Poll fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Poll(
      options: map['options'],
      endDatetime: map['end_datetime'],
      durationMinutes: map['duration_minutes'],
    );
  }
}
