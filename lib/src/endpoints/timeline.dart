//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// timeline.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-22T21:09:45.954Z
// Modified: 2020-04-24T21:44:30.521Z
//

import 'dart:convert';

import '../models/tweet.dart';

import '../api_base.dart';

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
      {int count, int sinceId, int maxId, bool excludeReplies}) async {
    var method = 'GET';
    var endPoint = 'statuses/home_timeline';
    var parameters = <String, String>{};
    if (count != null) parameters['count'] = count.toString();
    if (sinceId != null) parameters['since_id'] = sinceId.toString();
    if (maxId != null) parameters['max_id'] = maxId.toString();
    if (excludeReplies != null) {
      parameters['exclude_replies'] = excludeReplies.toString();
    }
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<Tweet>.from(decoded.map((t) => Tweet.fromMap(t)));
  }

  /// Returns the 20 most recent statuses posted from the user specified.
  /// [userId] Specifies the ID of the user.
  /// [screenName] Specifies the screen name of the user.
  /// [count] The number of results.
  /// [sinceId] Returns only statuses with an ID greater than (that is, more
  /// recent than) the specified ID.
  /// [maxId] Returns only statuses with an ID less than (that is, older than)
  /// or equal to the specified ID.
  Future<List<Tweet>> userTimeline(
      {int userId,
      String screenName,
      int count,
      int sinceId,
      int maxId,
      bool excludeReplies}) async {
    if (userId == null && screenName == null) {
      throw ArgumentError('required screenName or userId parameters.');
    }
    var method = 'GET';
    var endPoint = 'statuses/user_timeline';
    var parameters = {
      'user_id': userId.toString(),
      'screen_name': screenName,
      'count': count.toString(),
      'since_id': sinceId.toString(),
      'max_id': maxId.toString()
    };
    if (excludeReplies != null) {
      parameters['exclude_replies'] = excludeReplies.toString();
    }
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
  Future<List<Tweet>> mentionsTimeline(
      {int count, int sinceId, int maxId}) async {
    var method = 'GET';
    var endPoint = 'statuses/mentions_timeline';
    var parameters = {
      'count': count.toString(),
      'since_id': sinceId.toString(),
      'max_id': maxId.toString()
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
  Future<List<Tweet>> retweetsOfMe({int count, int sinceId, int maxId}) async {
    var method = 'GET';
    var endPoint = 'statuses/retweets_of_me';
    var parameters = {
      'count': count.toString(),
      'since_id': sinceId.toString(),
      'max_id': maxId.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<Tweet>.from(decoded.map((t) => Tweet.fromMap(t)));
  }
}
