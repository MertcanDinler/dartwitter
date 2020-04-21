//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// poll.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T14:19:05.345Z
// Modified: 2020-04-21T15:07:14.121Z
//

class Poll {
  /// An array of options, each having a poll position, and the text for that
  /// position.
  List<Map<String, dynamic>> options;

  /// Time stamp (UTC) of when poll ends.
  DateTime endDatetime;

  /// Duration of poll in minutes.
  int durationMinutes;
}
