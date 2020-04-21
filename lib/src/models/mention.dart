//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// mention.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T14:19:05.345Z
// Modified: 2020-04-21T15:05:42.893Z
//

class Mention {
  /// ID of the mentioned user, as an integer.
  int id;

  /// An array of integers representing the offsets within the Tweet text where
  /// the user reference begins and ends. The first integer represents the
  /// location of the ‘@’ character of the user mention. The second integer
  /// represents the location of the first non-screenname character following
  /// the user mention.
  List<int> indices;

  /// Display name of the referenced user.
  String name;

  /// Screen name of the referenced user.
  String screen_name;
}
