//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// entities.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T13:21:55.426Z
// Modified: 2020-04-21T15:09:28.852Z
//

import 'hashtag.dart';
import 'symbol.dart';
import 'url.dart';

import 'mention.dart';

class Entities {
  List<Hashtag> hashtags;
  List<Url> urls;
  List<Mention> mentions;
  List<Symbol> symbols;
}
