//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// tweet.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T12:55:38.389Z
// Modified: 2020-04-21T13:18:46.944Z
//

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
  // TODO User user;
  // TODO Coordinates coordinates;
  // TODO Places place;
  int quotedStatusId;
  bool isQuoteStatus;
  Tweet quotedStatus;
  Tweet retweetedStatus;
  int quoteCount;
  int replyCount;
  int retweetCount;
  int favoriteCount;
  // TODO Entities entities;
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
  bool withheld_copyright;
  List<String> withheldInCountries;
  String withheldScope;
}
