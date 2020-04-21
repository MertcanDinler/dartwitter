//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// unwound_url.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T14:12:17.812Z
// Modified: 2020-04-21T15:10:05.364Z
//

class UnwoundUrl {
  /// The fully unwound version of the link included in the Tweet.
  String url;

  /// Final HTTP status of the unwinding process, a '200' indicating success.
  int status;

  /// HTML title for the link.
  String title;

  /// HTML description for the link.
  String description;
}
