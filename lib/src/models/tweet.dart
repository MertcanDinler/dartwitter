//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// tweet.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T12:55:38.389Z
// Modified: 2020-04-25T10:29:32.102Z
//
import 'dart:convert';

import '../utils.dart';
import 'coordinates.dart';
import 'entities.dart';
import 'place.dart';
import 'user.dart';

/// Tweets are the basic atomic building block of all things Twitter. Tweets are
/// also known as “status updates.” The Tweet object has a long list of
/// ‘root-level’ attributes, including fundamental attributes such as id,
/// created_at, and text. Tweet objects are also the ‘parent’ object to several
/// child objects. Tweet child objects include user, entities, and
/// extended_entities. Tweets that are geo-tagged will have a place child object.
/// From:
/// https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/tweet-object
class Tweet {
  int id;
  String text;
  String source;
  bool truncated;
  int inReplyToStatusId;
  int inReplyToUseId;
  String inReplyToScreenName;
  User user;
  Coordinates coordinates;
  List<Place> places;
  int quotedStatusId;
  bool isQuoteStatus;
  Tweet quotedStatus;
  Tweet retweetedStatus;
  int quoteCount;
  int replyCount;
  int retweetCount;
  int favoriteCount;
  Entities entities;
  String _createdAt;
  DateTime createdAt;
  // TODO ExtendedEntities extendedEntities;
  bool favorited;
  bool retweeted;
  bool possiblySensitive;
  String filterLevel;
  String lang;
  List<Object> matchingRules;

  // Additional Tweet attributes
  // Twitter APIs that provide Tweets (e.g. the GET statuses/lookup endpoint) may include these additional Tweet attributes:
  Map<String, dynamic> currentUserRetweet;
  Map<String, dynamic> scopes;
  bool withheldCopyright;
  List<String> withheldInCountries;
  String withheldScope;
  Tweet({
    this.id,
    this.text,
    this.source,
    this.truncated,
    this.inReplyToStatusId,
    this.inReplyToUseId,
    this.inReplyToScreenName,
    this.user,
    this.coordinates,
    this.places,
    this.quotedStatusId,
    this.isQuoteStatus,
    this.quoteCount,
    this.replyCount,
    this.retweetCount,
    this.favoriteCount,
    this.entities,
    String createdAt,
    this.favorited,
    this.retweeted,
    this.possiblySensitive,
    this.filterLevel,
    this.lang,
    this.matchingRules,
    this.currentUserRetweet,
    this.scopes,
    this.withheldCopyright,
    this.withheldInCountries,
    this.withheldScope,
  }) {
    _createdAt = createdAt;
    this.createdAt = dateTimeFromString(_createdAt);
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'source': source,
      'truncated': truncated,
      'in_reply_to_status_id': inReplyToStatusId,
      'in_reply_to_use_id': inReplyToUseId,
      'in_reply_to_screen_name': inReplyToScreenName,
      'user': user.toMap(),
      'coordinates': coordinates.toMap(),
      'places': List<dynamic>.from(places.map((x) => x.toMap())),
      'quoted_status_id': quotedStatusId,
      'is_quote_status': isQuoteStatus,
      'quote_count': quoteCount,
      'reply_count': replyCount,
      'retweet_count': retweetCount,
      'favorite_count': favoriteCount,
      'entities': entities.toMap(),
      'created_at': _createdAt,
      'favorited': favorited,
      'retweeted': retweeted,
      'possibly_sensitive': possiblySensitive,
      'filter_level': filterLevel,
      'lang': lang,
      'matching_rules': matchingRules,
      'current_user_retweet': currentUserRetweet,
      'scopes': scopes,
      'withheld_copyright': withheldCopyright,
      'withheld_in_countries': withheldInCountries,
      'withheld_scope': withheldScope,
    };
  }

  @override
  String toString() {
    return 'Tweet(id: $id, screen_name:${user.screenName} text: $text)';
  }

  static Tweet fromJson(String source) => fromMap(json.decode(source));

  static Tweet fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Tweet(
      id: map['id'],
      text: map['text'],
      source: map['source'],
      truncated: map['truncated'],
      inReplyToStatusId: map['in_reply_to_status_id'],
      inReplyToUseId: map['in_reply_to_use_id'],
      inReplyToScreenName: map['in_reply_to_screen_name'],
      user: User.fromMap(map['user']),
      coordinates: Coordinates.fromMap(map['coordinates']),
      places: map.containsKey('places')
          ? List<Place>.from(map['places']?.map((x) => Place.fromMap(x)))
          : null,
      quotedStatusId: map['quoted_status_id'],
      isQuoteStatus: map['is_quote_status'],
      quoteCount: map['quote_count'],
      replyCount: map['reply_count'],
      retweetCount: map['retweet_count'],
      favoriteCount: map['favorite_count'],
      entities: Entities.fromMap(map['entities']),
      createdAt: map['created_at'],
      favorited: map['favorited'],
      retweeted: map['retweeted'],
      possiblySensitive: map['possibly_sensitive'],
      filterLevel: map['filter_level'],
      lang: map['lang'],
      matchingRules: map['matching_rules'],
      currentUserRetweet: map['current_user_retweet'],
      scopes: map['scopes'],
      withheldCopyright: map['withheld_copyright'],
      withheldInCountries: map.containsKey('withheld_in_countries')
          ? List<String>.from(map['withheld_in_countries'])
          : null,
      withheldScope: map['withheld_scope'],
    );
  }
}
