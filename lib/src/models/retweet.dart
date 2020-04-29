import 'dart:convert';

//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// retweet.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mertcandinler/dartwitter/master/LICENSE
//
// Created:  2020-04-27T15:32:24.959Z
// Modified: 2020-04-27T15:37:52.193Z
//

import 'tweet.dart';

class Retweet {
  Tweet status;
  Tweet retweetedStatus;
  Retweet({
    this.status,
    this.retweetedStatus,
  });

  Map<String, dynamic> toMap() {
    var map = status?.toMap();
    map['retweeted_status'] = retweetedStatus?.toMap();
    return map;
  }

  static Retweet fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Retweet(
      status: Tweet.fromMap(map),
      retweetedStatus: Tweet.fromMap(map['retweeted_status']),
    );
  }

  String toJson() => json.encode(toMap());

  static Retweet fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Retweet(id: ${status.id}, retweetedStatus: ${retweetedStatus.id})';
}
