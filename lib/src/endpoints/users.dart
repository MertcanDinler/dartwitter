//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// user.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-24T22:51:04.462Z
// Modified: 2020-04-27T23:36:18.740Z
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
    var parameters = <String, dynamic>{
      'id': id,
      'screen_name': screenName,
      'include_entities': includeEntities
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
    var parameters = <String, dynamic>{
      'q': query,
      'page': page,
      'count': count,
      'include_entities': includeEntities
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
    var parameters = <String, dynamic>{
      'user_id': ids?.join(','),
      'screen_name': screenNames?.join(','),
      'include_entities': includeEntities
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
    var parameters = <String, dynamic>{
      'id': id,
      'screen_name': screenName,
      'cursor': cursor,
      'count': count
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
    var parameters = <String, dynamic>{
      'id': id,
      'screen_name': screenName,
      'cursor': cursor,
      'count': count
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
    var parameters = <String, dynamic>{
      'id': id,
      'screen_name': screenName,
      'cursor': cursor,
      'count': count,
      'skip_status': skipStatus,
      'include_user_entities': includeUserEntities
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
    var parameters = <String, dynamic>{
      'id': id,
      'screen_name': screenName,
      'cursor': cursor,
      'count': count,
      'skip_status': skipStatus,
      'include_user_entities': includeUserEntities
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<User>(resp);
  }

  /// Returns an array of numeric user ids the authenticating user is blocking.
  /// [cursor] Causes the results to be broken into pages. If no cursor is
  /// provided, a value of -1 will be assumed, which is the first "page."
  /// The response from the API will include a previous_cursor and next_cursor
  /// to allow paging back and forth.
  Future<CursorResponse<int>> getBlocksIds({int cursor}) async {
    var method = 'GET';
    var endPoint = 'blocks/ids';
    var parameters = <String, dynamic>{
      'cursor': cursor,
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<int>(resp);
  }

  /// Returns a collection of user objects that the authenticating user is
  /// blocking.
  /// [cursor] Causes the results to be broken into pages. If no cursor is
  /// provided, a value of -1 will be assumed, which is the first "page."
  /// The response from the API will include a previous_cursor and next_cursor
  /// to allow paging back and forth.
  /// [skipStatus] When set to either true , t or 1 statuses will not be
  /// included in the returned user objects.
  /// [includeEntities] The entities node will not be included when set to
  /// false.
  Future<CursorResponse<User>> getBlocks(
      {int cursor, bool skipStatus, bool includeEntities}) async {
    var method = 'GET';
    var endPoint = 'blocks/list';
    var parameters = <String, dynamic>{
      'cursor': cursor,
      'skip_status': skipStatus,
      'include_user_entities': includeEntities
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<User>(resp);
  }

  /// Returns an array of numeric user ids the authenticating user has muted.
  /// [cursor] Causes the results to be broken into pages. If no cursor is
  /// provided, a value of -1 will be assumed, which is the first "page."
  /// The response from the API will include a previous_cursor and next_cursor
  /// to allow paging back and forth.
  Future<CursorResponse<int>> getMutesIds({int cursor}) async {
    var method = 'GET';
    var endPoint = 'mutes/users/ids';
    var parameters = <String, dynamic>{
      'cursor': cursor,
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<int>(resp);
  }

  /// Returns an array of user objects the authenticating user has muted.
  /// [cursor] Causes the results to be broken into pages. If no cursor is
  /// provided, a value of -1 will be assumed, which is the first "page."
  /// The response from the API will include a previous_cursor and next_cursor
  /// to allow paging back and forth.
  /// [skipStatus] When set to either true , t or 1 statuses will not be
  /// included in the returned user objects.
  /// [includeEntities] The entities node will not be included when set to
  /// false.
  Future<CursorResponse<User>> getMutes(
      {int cursor, bool skipStatus, bool includeEntities}) async {
    var method = 'GET';
    var endPoint = 'mutes/users/list';
    var parameters = <String, dynamic>{
      'cursor': cursor,
      'skip_status': skipStatus,
      'include_user_entities': includeEntities
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return CursorResponse.fromJson<User>(resp);
  }

  /// Blocks the specified user from following the authenticating user.
  /// In addition the blocked user will not show in the authenticating users
  ///  mentions or timeline (unless retweeted by another user). If a follow or
  /// friend relationship exists it is destroyed.
  /// [id] The ID of the potentially blocked user. Helpful for disambiguating
  /// when a valid user ID is also a valid screen name.
  /// [screenName] The screen name of the potentially blocked user. Helpful for
  /// disambiguating when a valid screen name is also a user ID.
  /// [includeEntities] The entities node will not be included when set to
  /// false.
  /// [skipStatus] When set to either true , t or 1 statuses will not be
  /// included in the returned user objects.
  Future<User> createBlock(
      {int id,
      String screenName,
      bool includeEntities,
      bool skipStatus}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required id or screenName parameters.');
    }
    var method = 'POST';
    var endPoint = 'blocks/create';
    var parameters = <String, dynamic>{
      'id': id,
      'screen_name': screenName,
      'include_entities': includeEntities,
      'skip_status': skipStatus
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return User.fromJson(resp);
  }

  /// Un-blocks the user specified in the ID parameter for the authenticating
  /// user. Returns the un-blocked user when successful. If relationships
  /// existed before the block was instantiated, they will not be restored.
  /// [id] The ID of the potentially blocked user. Helpful for disambiguating
  /// when a valid user ID is also a valid screen name.
  /// [screenName] The screen name of the potentially blocked user. Helpful for
  /// disambiguating when a valid screen name is also a user ID.
  /// [includeEntities] The entities node will not be included when set to
  /// false.
  /// [skipStatus] When set to either true , t or 1 statuses will not be
  /// included in the returned user objects.
  Future<User> destroyBlock(
      {int id,
      String screenName,
      bool includeEntities,
      bool skipStatus}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required id or screenName parameters.');
    }
    var method = 'POST';
    var endPoint = 'blocks/destroy';
    var parameters = <String, dynamic>{
      'id': id,
      'screen_name': screenName,
      'include_entities': includeEntities,
      'skip_status': skipStatus
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return User.fromJson(resp);
  }

  /// Mutes the user specified in the ID parameter for the authenticating user.
  /// Returns the muted user when successful.
  /// [id] The ID of the potentially muted user. Helpful for disambiguating when
  /// a valid user ID is also a valid screen name.
  /// [screenName] The screen name of the potentially muted user. Helpful for
  /// disambiguating when a valid screen name is also a user ID.
  Future<User> createMute({int id, String screenName}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required id or screenName parameters.');
    }
    var method = 'POST';
    var endPoint = 'mutes/users/create';
    var parameters = <String, dynamic>{'id': id, 'screen_name': screenName};
    var resp = await request(method, endPoint, parameters: parameters);
    return User.fromJson(resp);
  }

  /// Un-mutes the user specified in the ID parameter for the authenticating
  /// user. Returns the muted user when successful.
  /// [id] The ID of the potentially muted user. Helpful for disambiguating when
  /// a valid user ID is also a valid screen name.
  /// [screenName] The screen name of the potentially muted user. Helpful for
  /// disambiguating when a valid screen name is also a user ID.
  Future<User> destroyMute({int id, String screenName}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required id or screenName parameters.');
    }
    var method = 'POST';
    var endPoint = 'mutes/users/destroy';
    var parameters = <String, dynamic>{'id': id, 'screen_name': screenName};
    var resp = await request(method, endPoint, parameters: parameters);
    return User.fromJson(resp);
  }

  /// Report the specified user as a spam account to Twitter. Additionally,
  /// optionally performs the equivalent of [createBlock] on behalf of the
  /// authenticated user.
  /// [id] The ID of the user to report as a spammer. Helpful for disambiguating
  /// when a valid user ID is also a valid screen name.
  /// [screenName] The screen_name of the user to report as a spammer.
  /// Helpful for disambiguating when a valid screen name is also a user ID.
  /// [performBlock] Whether the account should be blocked by the authenticated
  /// user, as well as being reported for spam.
  Future<User> reportSpam(
      {int id, String screenName, bool performBlock}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required id or screenName parameters.');
    }
    var method = 'POST';
    var endPoint = 'users/report_spam';
    var parameters = <String, dynamic>{
      'id': id,
      'screen_name': screenName,
      'perform_block': performBlock
    };
    var resp = await request(method, endPoint, parameters: parameters);
    return User.fromJson(resp);
  }
}
