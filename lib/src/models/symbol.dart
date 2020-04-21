//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// symbol.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T14:23:38.761Z
// Modified: 2020-04-21T15:06:20.939Z
//

class Symbol {
  /// An array of integers indicating the offsets within the Tweet text where
  /// the symbol/cashtag begins and ends. The first integer represents the
  /// location of the $ character in the Tweet text string. The second integer
  /// represents the location of the first character after the cashtag.
  /// Therefore the difference between the two numbers will be the length of
  /// the hashtag name plus one (for the ‘$’ character).
  List<int> indices;

  /// Name of the cashhtag, minus the leading ‘$’ character.
  String text;
}
