//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// relationship.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-27T10:12:30.412Z
// Modified: 2020-04-27T12:14:26.999Z
//

import 'dart:convert';

class Relationship {
  _Source source;
  _Target target;
  Relationship({
    this.source,
    this.target,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'source': source?.toMap(),
      'target': target?.toMap(),
    };
  }

  @override
  String toString() => 'Relationship(source: $source, target: $target)';

  static Relationship fromJson(String source) => fromMap(json.decode(source));

  static Relationship fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Relationship(
      source: _Source.fromMap(map['relationship']['source']),
      target: _Target.fromMap(map['relationship']['target']),
    );
  }
}

class _RUser {
  int id;
  String screenName;
  bool following;
  bool followedBy;
  bool followingReceived;
  bool followingRequested;
  _RUser({
    this.id,
    this.screenName,
    this.following,
    this.followedBy,
    this.followingReceived,
    this.followingRequested,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'screen_name': screenName,
      'following': following,
      'followed_by': followedBy,
      'following_received': followingReceived,
      'following_requested': followingRequested,
    };
  }

  static _RUser fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return _RUser(
      id: map['id'],
      screenName: map['screen_name'],
      following: map['following'],
      followedBy: map['followed_by'],
      followingReceived: map['following_received'],
      followingRequested: map['following_requested'],
    );
  }
}

class _Source extends _RUser {
  bool liveFollowing;
  bool notificationsEnabled;
  bool canDm;
  bool blocking;
  bool blockedBy;
  bool muting;
  bool wantRetweets;
  bool allReplies;
  bool markedSpam;
  _Source({
    int id,
    String screenName,
    bool following,
    bool followedBy,
    bool followingReceived,
    bool followingRequested,
    this.liveFollowing,
    this.notificationsEnabled,
    this.canDm,
    this.blocking,
    this.blockedBy,
    this.muting,
    this.wantRetweets,
    this.allReplies,
    this.markedSpam,
  }) : super(
            id: id,
            screenName: screenName,
            following: following,
            followedBy: followedBy,
            followingReceived: followingReceived,
            followingRequested: followingRequested);

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      'live_following': liveFollowing,
      'notifications_enabled': notificationsEnabled,
      'can_dm': canDm,
      'blocking': blocking,
      'blocked_by': blockedBy,
      'muting': muting,
      'want_retweets': wantRetweets,
      'all_replies': allReplies,
      'marked_spam': markedSpam,
    });
    return map;
  }

  static _Source fromJson(String source) => fromMap(json.decode(source));

  static _Source fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return _Source(
      id: map['id'],
      screenName: map['screen_name'],
      following: map['following'],
      followedBy: map['followed_by'],
      followingReceived: map['following_received'],
      followingRequested: map['following_requested'],
      liveFollowing: map['live_following'],
      notificationsEnabled: map['notifications_enabled'],
      canDm: map['can_dm'],
      blocking: map['blocking'],
      blockedBy: map['blocked_by'],
      muting: map['muting'],
      wantRetweets: map['want_retweets'],
      allReplies: map['all_replies'],
      markedSpam: map['marked_spam'],
    );
  }
}

class _Target extends _RUser {
  _Target(
      {int id,
      String screenName,
      bool following,
      bool followedBy,
      bool followingReceived,
      bool followingRequested})
      : super(
            id: id,
            screenName: screenName,
            following: following,
            followedBy: followedBy,
            followingReceived: followingReceived,
            followingRequested: followingRequested);

  static _Target fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return _Target(
      id: map['id'],
      screenName: map['screen_name'],
      following: map['following'],
      followedBy: map['followed_by'],
      followingReceived: map['following_received'],
      followingRequested: map['following_requested'],
    );
  }
}
