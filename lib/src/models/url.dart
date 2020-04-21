//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// url.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T14:08:56.961Z
// Modified: 2020-04-21T15:10:10.804Z
//

import 'unwound_url.dart';

class Url {
  /// URL pasted/typed into Tweet.
  String displayUrl;

  /// Expanded version of 'display_url' .
  String expandedUrl;

  /// An array of integers representing offsets within the Tweet text where the
  /// URL begins and ends. The first integer represents the location of the
  /// first character of the URL in the Tweet text. The second integer
  /// represents the location of the first non-URL character after the end of
  /// the URL.
  List<int> indices;

  /// Wrapped URL, corresponding to the value embedded directly into the raw
  /// Tweet text, and the values for the indices parameter.
  String url;

  /// If you are using the Expanded and/or Enhanced URL enrichments, the
  /// following metadata is available under the unwound attribute
  UnwoundUrl unwound;
}
