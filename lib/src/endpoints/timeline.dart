//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// timeline.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-22T21:09:45.954Z
// Modified: 2020-04-25T17:37:10.554Z
//

import 'dart:convert';

import '../api_base.dart';
import '../models/tweet.dart';

mixin Timeline on ApiBase {
  /// Returns the 20 most recent statuses, including retweets, posted by the
  /// authenticating user and that user’s friends. This is the equivalent of
  /// /home on the Web.
  /// [count] The number of results.
  /// [sinceId] Returns only statuses with an ID greater than (that is, more
  /// recent than) the specified ID.
  /// [maxId] Returns only statuses with an ID less than (that is, older than)
  /// or equal to the specified ID.
  Future<List<Tweet>> homeTimeline(
      {int count,
      int sinceId,
      int maxId,
      bool trimUser,
      bool excludeReplies,
      bool includeEntities}) async {
    var method = 'GET';
    var endPoint = 'statuses/home_timeline';
    var parameters = {
      'count': count?.toString(),
      'since_id': sinceId?.toString(),
      'max_id': maxId?.toString(),
      'trim_user': trimUser?.toString(),
      'exclude_replies': excludeReplies?.toString(),
      'include_entities': includeEntities?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<Tweet>.from(decoded.map((t) => Tweet.fromMap(t)));
  }

  /// Returns the 20 most recent mentions, including retweets.
  /// [count] The number of results
  /// [sinceId] Returns only statuses with an ID greater than (that is, more
  /// recent than) the specified ID.
  /// [maxId] Returns only statuses with an ID less than (that is, older than)
  /// or equal to the specified ID.
  /// [trimUser] When set to either true , t or 1 , each Tweet returned in a
  /// timeline will include a user object including only the status authors
  /// numerical ID. Omit this parameter to receive the complete user object.
  /// [includeEntities] The entities node that may appear within embedded
  /// statuses will not be included when set to false.
  Future<List<Tweet>> mentionsTimeline(
      {int count,
      int sinceId,
      int maxId,
      bool trimUser,
      bool includeEntities}) async {
    var method = 'GET';
    var endPoint = 'statuses/mentions_timeline';
    var parameters = {
      'count': count?.toString(),
      'since_id': sinceId?.toString(),
      'max_id': maxId?.toString(),
      'trim_user': trimUser?.toString(),
      'include_entities': includeEntities?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<Tweet>.from(decoded.map((t) => Tweet.fromMap(t)));
  }

  /// Returns the 20 most recent mentions, including retweets.
  /// [count] The number of results
  /// [sinceId] Returns only statuses with an ID greater than (that is, more
  /// recent than) the specified ID.
  /// [maxId] Returns only statuses with an ID less than (that is, older than)
  /// or equal to the specified ID.
  /// [trimUser] When set to either true , t or 1 , each Tweet returned in a
  /// timeline will include a user object including only the status authors
  /// numerical ID. Omit this parameter to receive the complete user object.
  /// [includeEntities] The entities node that may appear within embedded
  /// statuses will not be included when set to false.
  /// [includeUserEntities] The user entities node will not be included when set
  /// to false
  Future<List<Tweet>> retweetsOfMe(
      {int count,
      int sinceId,
      int maxId,
      bool trimUser,
      bool includeEntities,
      bool includeUserEntities}) async {
    var method = 'GET';
    var endPoint = 'statuses/retweets_of_me';
    var parameters = {
      'count': count?.toString(),
      'since_id': sinceId?.toString(),
      'max_id': maxId?.toString(),
      'trim_user': trimUser?.toString(),
      'include_entities': includeEntities?.toString(),
      'include_user_entities': includeUserEntities?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<Tweet>.from(decoded.map((t) => Tweet.fromMap(t)));
  }

  /// Returns fully-hydrated Tweet objects for up to 100 Tweets per request.
  /// This method is especially useful to get the details (hydrate) a collection
  /// of Tweet IDs.
  /// [ids] a list of  tweet ids
  /// [trimUser] When set to either true , t or 1 , each Tweet returned in a
  /// timeline will include a user object including only the status authors
  /// numerical ID. Omit this parameter to receive the complete user object.
  /// [includeEntities] The entities node that may appear within embedded
  /// statuses will not be included when set to false.
  Future<List<Tweet>> statusesLookup(List<int> ids,
      {bool includeEntities, bool trimUser}) async {
    var method = 'GET';
    var endPoint = 'statuses/lookup';
    var parameters = {
      'id': ids.join(','),
      'trim_user': trimUser?.toString(),
      'include_entities': includeEntities?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<Tweet>.from(decoded.map((t) => Tweet.fromMap(t)));
  }

  /// Returns the 20 most recent statuses posted from the user specified.
  /// [id] Specifies the ID of the user.
  /// [screenName] Specifies the screen name of the user.
  /// [count] The number of results.
  /// [sinceId] Returns only statuses with an ID greater than (that is, more
  /// recent than) the specified ID.
  /// [maxId] Returns only statuses with an ID less than (that is, older than)
  /// or equal to the specified ID.
  /// [trimUser] When set to either true , t or 1 , each Tweet returned in a
  /// timeline will include a user object including only the status authors
  /// numerical ID. Omit this parameter to receive the complete user object.
  /// [includeEntities] The entities node that may appear within embedded
  /// statuses will not be included when set to false.
  /// [includeRts] When set to false , the timeline will strip any native
  /// retweets (though they will still count toward both the maximal length of
  /// the timeline and the slice selected by the count parameter).
  /// Note: If you're using the trim_user parameter in conjunction with
  /// [trimUser], the retweets will still contain a full user object.
  Future<List<Tweet>> userTimeline(
      {int id,
      String screenName,
      int count,
      int sinceId,
      int maxId,
      bool excludeReplies,
      bool trimUser,
      bool includeRts}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required id or screenName parameters.');
    }
    var method = 'GET';
    var endPoint = 'statuses/user_timeline';
    var parameters = {
      'user_id': id?.toString(),
      'screen_name': screenName,
      'count': count?.toString(),
      'since_id': sinceId?.toString(),
      'max_id': maxId?.toString(),
      'exclude_replies': excludeReplies?.toString(),
      'trim_user': trimUser?.toString(),
      'include_rts': includeRts?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<Tweet>.from(decoded.map((t) => Tweet.fromMap(t)));
  }
}
