//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// poll.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T14:19:05.345Z
// Modified: 2020-04-23T10:56:16.942Z
//

import 'dart:convert';

class Poll {
  /// An array of options, each having a poll position, and the text for that
  /// position.
  List<Map<String, dynamic>> options;

  /// Time stamp (UTC) of when poll ends.
  DateTime endDatetime;

  /// Duration of poll in minutes.
  int durationMinutes;
  Poll({
    this.options,
    this.endDatetime,
    this.durationMinutes,
  });

  Map<String, dynamic> toMap() {
    return {
      'options': options,
      // TODO - 'end_datetime': ,
      'duration_minutes': durationMinutes,
    };
  }

  static Poll fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Poll(
      options: map['options'],
      // TODO - endDatetime: ,
      durationMinutes: map['duration_minutes'],
    );
  }

  String toJson() => json.encode(toMap());

  static Poll fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Poll(options: $options, endDatetime: $endDatetime, durationMinutes: $durationMinutes)';
}
