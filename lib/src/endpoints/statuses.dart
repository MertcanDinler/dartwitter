//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// statuses.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-22T21:09:45.954Z
// Modified: 2020-04-27T15:41:51.033Z
//

import 'dart:convert';

import '../../models.dart';
import '../api_base.dart';
import '../models/cursor_response.dart';
import '../models/retweet.dart';

mixin Statuses on ApiBase {
  /// Returns the 20 most recent Tweets liked by the authenticating or specified
  /// user.
  /// [id] The ID of the user for whom to return results.
  /// [screenName] The screen name of the user for whom to return results.
  /// [count] Specifies the number of records to retrieve. Must be less than or
  /// equal to 200; defaults to 20. The value of count is best thought of as a
  /// limit to the number of Tweets to return because suspended or deleted
  /// content is removed after the count has been applied.
  /// [sinceId] Returns results with an ID greater than (that is, more recent
  /// than) the specified ID. There are limits to the number of Tweets which can
  /// be accessed through the API. If the limit of Tweets has occured since the
  /// since_id, the since_id will be forced to the oldest ID available.
  /// [maxId] Returns results with an ID less than (that is, older than) or
  /// equal to the specified ID.
  /// [includeEntities] The entities node will be omitted when set to false .
  Future<List<Tweet>> getFavorites(
      {int id,
      String screenName,
      int count,
      int sinceId,
      int maxId,
      bool includeEntities}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required id or screenName parameters.');
    }
    var method = 'GET';
    var endPoint = 'favorites/list';
    var parameters = <String, dynamic>{
      'user_id': id,
      'screen_name': screenName,
      'count': count,
      'since_id': sinceId,
      'max_id': maxId,
      'include_entities': includeEntities
    };
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<Tweet>.from(decoded.map((t) => Tweet.fromMap(t)));
  }

  /// Returns a collection of up to 100 user IDs belonging to users who have
  /// retweeted the Tweet specified by the id parameter.
  /// [id] The numerical ID of the desired status/tweet.
  /// [count] Specifies the number of records to retrieve. Must be less than or
  /// equal to 100.
  /// [cursor] Causes the list of IDs to be broken into pages of no more than
  /// 100 IDs at a time. The number of IDs returned is not guaranteed to be 100
  /// as suspended users are filtered out after connections are queried. If no
  /// cursor is provided, a value of -1 will be assumed, which is the first
  /// "page." The response from the API will include a previous_cursor and
  /// next_cursor to allow paging back and forth
  Future<CursorResponse<int>> getRetweetersIds(int id,
      {int cursor, int count}) async {
    var method = 'GET';
    var endPoint = 'statuses/retweeters/ids';
    var parameters = <String, dynamic>{
      'id': id,
      'cursor': cursor,
      'count': count
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<int>(resp);
  }

  /// Returns a collection of the 100 most recent retweets of the Tweet specified
  /// by the [id] parameter.
  /// [id] The numerical ID of the desired status.
  /// [count] Specifies the number of records to retrieve. Must be less than or
  /// equal to 100.
  /// [trimUser] When set to either true , t or 1 , each tweet returned in a
  /// timeline will include a user object including only the status authors
  /// numerical ID. Omit this parameter to receive the complete user object.
  Future<List<Tweet>> getRetweets(int id, {int count, bool trimUser}) async {
    var method = 'GET';
    var endPoint = 'statuses/retweets/' + id.toString();
    var parameters = <String, dynamic>{'count': count, 'trim_user': trimUser};
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<Tweet>.from(decoded.map((t) => Tweet.fromMap(t)));
  }

  /// Returns a single Tweet, specified by the id parameter. The Tweet's author
  /// will also be embedded within the Tweet.
  /// [id] The numerical ID of the desired status/tweet.
  /// [trimUser] When set to either true , t or 1 , each tweet returned in a
  /// timeline will include a user object including only the status authors
  /// numerical ID. Omit this parameter to receive the complete user object.
  Future<Tweet> getStatus(int id, {bool includeEntities, bool trimUser}) async {
    var method = 'GET';
    var endPoint = 'statuses/show';
    var parameters = <String, dynamic>{
      'id': id,
      'include_entities': includeEntities,
      'trim_user': trimUser
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return Tweet.fromJson(resp);
  }

  /// Favorites (likes) the Tweet specified in the ID parameter as the
  /// authenticating user.
  /// [id] The numerical ID of the Tweet to like.
  /// [includeEntities] The entities node will be omitted when set to false.
  Future<Tweet> createFavorite(int id, {bool includeEntities}) async {
    var method = 'POST';
    var endPoint = 'favorites/create';
    var parameters = <String, dynamic>{
      'id': id,
      'include_entities': includeEntities,
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return Tweet.fromJson(resp);
  }

  /// Retweets a tweet. Returns the original Tweet with Retweet details
  /// embedded.
  /// [id] The numerical ID of the desired status/tweet.
  /// [includeEntities] The entities node will be omitted when set to false.
  Future<Retweet> retweet(int id, {bool trimUser}) async {
    var method = 'POST';
    var endPoint = 'statuses/retweet/' + id.toString();
    var parameters = <String, dynamic>{
      'trim_user': trimUser,
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return Retweet.fromJson(resp);
  }

  /// Untweets a retweeted status. Returns the original Tweet with Retweet details
  /// embedded.
  /// [id] The numerical ID of the desired status/tweet.
  /// [includeEntities] The entities node will be omitted when set to false.
  Future<Tweet> unRetweet(int id, {bool trimUser}) async {
    var method = 'POST';
    var endPoint = 'statuses/unretweet/' + id.toString();
    var parameters = <String, dynamic>{
      'trim_user': trimUser,
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return Tweet.fromJson(resp);
  }
}
