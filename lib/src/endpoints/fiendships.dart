//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// fiendships.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mertcandinler/dartwitter/master/LICENSE
//
// Created:  2020-04-26T13:43:34.870Z
// Modified: 2020-04-27T12:16:03.430Z
//

import 'package:dartwitter/models.dart';

import '../api_base.dart';
import '../models/cursor_response.dart';
import '../models/relationship.dart';

mixin Friendships on ApiBase {
  /// Returns a collection of integer IDs for every user who has a pending
  /// request to follow the authenticating user.
  /// [cursor] Causes the list of connections to be broken into pages of no more
  /// than 5000 IDs at a time. The number of IDs returned is not guaranteed to
  /// be 5000 as suspended users are filtered out after connections are queried.
  /// If no cursor is provided, a value of -1 will be assumed, which is the f
  /// irst "page."
  Future<CursorResponse<int>> friendshipsIncoming({int cursor}) async {
    var method = 'GET';
    var endPoint = 'friendships/incoming';
    var parameters = <String, dynamic>{'cursor': cursor};
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<int>(resp);
  }

  /// Returns a collection of integer IDs for every user who has a pending
  /// request to follow the authenticating user.
  /// [cursor] Causes the list of connections to be broken into pages of no more
  /// than 5000 IDs at a time. The number of IDs returned is not guaranteed to
  /// be 5000 as suspended users are filtered out after connections are queried.
  /// If no cursor is provided, a value of -1 will be assumed, which is the f
  /// irst "page."
  Future<CursorResponse<int>> friendshipsOutgoing({int cursor}) async {
    var method = 'GET';
    var endPoint = 'friendships/outgoing';
    var parameters = <String, dynamic>{'cursor': cursor};
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<int>(resp);
  }

  /// Allows the authenticating user to follow (friend) the user specified in
  /// the [id] or [screenName] parameter.
  /// [id] The ID of the user to follow.
  /// [screenName] The screen name of the user to follow.
  /// [follow] Enable notifications for the target user.
  Future<User> createFriendship(
      {int id, String screenName, bool follow}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required ids or screenNames parameters.');
    }
    var method = 'POST';
    var endPoint = 'friendships/create';
    var parameters = <String, dynamic>{
      'user_id': id,
      'screen_name': screenName,
      'follow': follow
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return User.fromJson(resp);
  }

  /// Allows the authenticating user to unfollow the user specified in the [id]
  /// or [screenName] parameter.
  /// [id] The ID of the user to unfollow.
  /// [screenName] The screen name of the user to unfollow.
  Future<User> destroyFriendship({int id, String screenName}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required ids or screenNames parameters.');
    }
    var method = 'POST';
    var endPoint = 'friendships/destroy';
    var parameters = <String, dynamic>{
      'user_id': id,
      'screen_name': screenName
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return User.fromJson(resp);
  }

  ///Returns detailed information about the relationship between two arbitrary users.
  ///[sourceId] The id of the subject user.
  ///[sourceScreenName] The username of the subject user
  ///[targetId] The id of the target  user.
  ///[targetScreenName] The username of the target  user
  Future<Relationship> showFriendship(
      {int sourceId,
      String sourceScreenName,
      int targetId,
      String targetScreenName}) async {
    if ((sourceId == null && sourceScreenName == null) ||
        (targetId == null && targetScreenName == null)) {
      throw ArgumentError('required ids or screenNames parameters.');
    }
    var method = 'GET';
    var endPoint = 'friendships/show';
    var parameters = <String, dynamic>{
      'source_id': sourceId,
      'source_screen_name': sourceScreenName,
      'target_id': targetId,
      'target_screen_name': targetScreenName
    };
    var resp = await request(method, endPoint, parameters: parameters);
    print(resp);
    return Relationship.fromJson(resp);
  }

  /// Enable or disable Retweets and device notifications from the specified
  /// user.
  /// [id] The ID of the user to unfollow.
  /// [screenName] The screen name of the user to unfollow.
  /// [device] Enable/disable device notifications from the target user.
  /// [retweets] Enable/disable Retweets from the target user.
  Future<Relationship> updateFriendship(
      {int id, String screenName, bool device, bool retweets}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required ids or screenNames parameters.');
    }
    var method = 'POST';
    var endPoint = 'friendships/update';
    var parameters = <String, dynamic>{
      'user_id': id,
      'screen_name': screenName,
      'device': device,
      'retweets': retweets
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return Relationship.fromJson(resp);
  }
}
