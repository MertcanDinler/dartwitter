//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// hashtag.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T13:50:54.453Z
// Modified: 2020-04-21T15:09:34.956Z
//

class Hashtag {
  /// An array of integers indicating the offsets within the Tweet text where
  /// the hashtag begins and ends. The first integer represents the location of
  /// the # character in the Tweet text string. The second integer represents
  /// the location of the first character after the hashtag. Therefore the
  /// difference between the two numbers will be the length of the hashtag name
  /// plus one (for the ‘#’ character).
  List<int> indices;

  /// Name of the hashtag, minus the leading ‘#’ character.
  String text;
}
