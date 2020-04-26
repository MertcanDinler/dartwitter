//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// user.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-24T22:51:04.462Z
// Modified: 2020-04-26T12:01:53.767Z
//

import 'dart:convert';

import '../api_base.dart';
import '../models/user.dart';
import '../models/cursor_response.dart';

mixin Users on ApiBase {
  /// Returns a variety of information about the user specified by the required
  /// [id] or [screenName] parameter.
  /// [id] The ID of the user for whom to return results.
  /// [screenName] The screen name of the user for whom to return results.
  /// [includeEntities] The entities node that may appear within embedded
  /// statuses will not be included when set to false.
  Future<User> getUser(
      {int id, String screenName, bool includeEntities}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required id or screenName parameters.');
    }
    var method = 'GET';
    var endPoint = 'users/show';
    var parameters = {
      'id': id?.toString(),
      'screen_name': screenName?.toString(),
      'include_entities': includeEntities?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return User.fromJson(resp);
  }

  /// Provides a simple, relevance-based search interface to public user
  /// accounts on Twitter. Try querying by topical interest, full name,
  /// company name, location, or other criteria. Exact match searches are not
  /// supported.
  /// [query] is required. The search query to run against people search.
  /// [page] Specifies the page of results to retrieve.
  /// [count] The number of potential user results to retrieve per page.
  /// This value has a maximum of 20.
  /// [includeEntities] The entities node that may appear within embedded
  /// statuses will not be included when set to false.
  Future<List<User>> searchUser(String query,
      {int page, int count, bool includeEntities}) async {
    var method = 'GET';
    var endPoint = 'users/search';
    var parameters = {
      'q': query,
      'page': page.toString(),
      'count': count?.toString(),
      'include_entities': includeEntities?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<User>.from(decoded.map((u) => User.fromMap(u)));
  }

  /// Returns fully-hydrated user objects for up to 100 users per request, as
  /// specified by list values passed to the [ids] and/or [screenNames]
  /// parameters.
  /// [ids] A list of IDs, up to 100 are allowed in a single request.
  /// [screenNames] A list of screen names, up to 100 are allowed in a
  /// single request.
  /// [includeEntities] The entities node that may appear within embedded
  /// statuses will not be included when set to false.
  Future<List<User>> usersLookup(
      {List<int> ids, List<String> screenNames, bool includeEntities}) async {
    if (ids == null && screenNames == null) {
      throw ArgumentError('required ids or screenNames parameters.');
    }
    var method = 'GET';
    var endPoint = 'users/lookup';
    var parameters = {
      'user_id': ids?.join(','),
      'screen_name': screenNames?.join(','),
      'include_entities': includeEntities?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<User>.from(decoded.map((u) => User.fromMap(u)));
  }

  /// Returns a cursored collection of user IDs for every user following the
  /// specified user. Required [id] or [screenName] parameter.
  /// [id] The ID of the user for whom to return results.
  /// [screenName] The screen name of the user for whom to return results.
  /// [cursor] Causes the list of connections to be broken into pages of no more
  /// than 5000 IDs at a time. The number of IDs returned is not guaranteed to
  /// be 5000 as suspended users are filtered out after connections are queried.
  /// If no cursor is provided, a value of -1 will be assumed, which is the
  /// first "page."
  /// [count] Specifies the number of IDs attempt retrieval of, up to a maximum
  /// of 5,000 per distinct request. The value of count is best thought of as a
  /// limit to the number of results to return. When using the count parameter
  /// with this method, it is wise to use a consistent count value across all
  /// requests to the same user's collection. Usage of this parameter is
  /// encouraged in environments where all 5,000 IDs constitutes
  /// too large of a response.
  Future<CursorResponse<int>> followersIds(
      {int id, String screenName, int cursor, int count}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required ids or screenNames parameters.');
    }
    var method = 'GET';
    var endPoint = 'followers/ids';
    var parameters = {
      'id': id?.toString(),
      'screen_name': screenName?.toString(),
      'cursor': cursor?.toString(),
      'count': count?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<int>(resp);
  }

  /// Returns a cursored collection of user IDs for every user the specified
  /// user is following (otherwise known as their "friends").
  /// Required [id] or [screenName] parameter.
  /// [id] The ID of the user for whom to return results.
  /// [screenName] The screen name of the user for whom to return results.
  /// [cursor] Causes the list of connections to be broken into pages of no more
  /// than 5000 IDs at a time. The number of IDs returned is not guaranteed to
  /// be 5000 as suspended users are filtered out after connections are queried.
  /// If no cursor is provided, a value of -1 will be assumed, which is the
  /// first "page."
  /// [count] Specifies the number of IDs attempt retrieval of, up to a maximum
  /// of 5,000 per distinct request. The value of count is best thought of as a
  /// limit to the number of results to return. When using the count parameter
  /// with this method, it is wise to use a consistent count value across all
  /// requests to the same user's collection. Usage of this parameter is
  /// encouraged in environments where all 5,000 IDs constitutes
  /// too large of a response.
  Future<CursorResponse<int>> friendsIds(
      {int id, String screenName, int cursor, int count}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required ids or screenNames parameters.');
    }
    var method = 'GET';
    var endPoint = 'friends/ids';
    var parameters = {
      'id': id?.toString(),
      'screen_name': screenName?.toString(),
      'cursor': cursor?.toString(),
      'count': count?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<int>(resp);
  }

  /// Returns a cursored collection of user objects for users following the
  /// specified user.
  /// Required [id] or [screenName] parameter.
  /// [id] The ID of the user for whom to return results.
  /// [screenName] The screen name of the user for whom to return results.
  /// [cursor] Causes the results to be broken into pages. If no cursor is
  /// provided, a value of -1 will be assumed, which is the first "page."
  /// The response from the API will include a previous_cursor and next_cursor
  /// to allow paging back and forth.
  /// [count] The number of users to return per page, up to a maximum of 200.
  /// Defaults to 20.
  Future<CursorResponse<User>> friends(
      {int id,
      String screenName,
      int cursor,
      int count,
      bool skipStatus,
      bool includeUserEntities}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required ids or screenNames parameters.');
    }
    var method = 'GET';
    var endPoint = 'friends/list';
    var parameters = {
      'id': id?.toString(),
      'screen_name': screenName?.toString(),
      'cursor': cursor?.toString(),
      'count': count?.toString(),
      'skip_status': skipStatus?.toString(),
      'include_user_entities': includeUserEntities?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<User>(resp);
  }

  /// Returns a cursored collection of user objects for users following the
  /// specified user.
  /// Required [id] or [screenName] parameter.
  /// [id] The ID of the user for whom to return results.
  /// [screenName] The screen name of the user for whom to return results.
  /// [cursor] Causes the results to be broken into pages. If no cursor is
  /// provided, a value of -1 will be assumed, which is the first "page."
  /// The response from the API will include a previous_cursor and next_cursor
  /// to allow paging back and forth.
  /// [count] The number of users to return per page, up to a maximum of 200.
  /// Defaults to 20.
  Future<CursorResponse<User>> followers(
      {int id,
      String screenName,
      int cursor,
      int count,
      bool skipStatus,
      bool includeUserEntities}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required ids or screenNames parameters.');
    }
    var method = 'GET';
    var endPoint = 'followers/list';
    var parameters = {
      'id': id?.toString(),
      'screen_name': screenName?.toString(),
      'cursor': cursor?.toString(),
      'count': count?.toString(),
      'skip_status': skipStatus?.toString(),
      'include_user_entities': includeUserEntities?.toString()
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<User>(resp);
  }

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
    var parameters = {'cursor': cursor?.toString()};
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
    var parameters = {'cursor': cursor?.toString()};
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<int>(resp);
  }
}
