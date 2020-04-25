//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// user.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-24T22:51:04.462Z
// Modified: 2020-04-25T10:28:26.707Z
//

import 'dart:convert';

import '../api_base.dart';
import '../models/user.dart';

mixin Users on ApiBase {
  /// Returns a variety of information about the user specified by the required
  /// user_id or screen_name parameter.
  /// [id] The ID of the user for whom to return results.
  /// [screenName] The screen name of the user for whom to return results.
  Future<User> getUser({int id, String screenName}) async {
    if (id == null && screenName == null) {
      throw ArgumentError('required id or screenName parameters.');
    }
    var method = 'GET';
    var endPoint = 'users/show';
    var parameters = {
      'id': id?.toString(),
      'screen_name': screenName?.toString(),
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
  Future<List<User>> searchUser(String query, {int page, int count}) async {
    var method = 'GET';
    var endPoint = 'users/search';
    var parameters = {
      'q': query,
      'page': page.toString(),
      'count': count?.toString(),
    };
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<User>.from(decoded.map((u) => User.fromMap(u)));
  }

  /// Returns fully-hydrated user objects for up to 100 users per request, as
  /// specified by list values passed to the user_id and/or screen_name
  /// parameters.
  /// [ids] A list of IDs, up to 100 are allowed in a single request.
  /// [screenNames] A list of screen names, up to 100 are allowed in a
  /// single request.
  Future<List<User>> usersLookup(
      {List<int> ids, List<String> screenNames}) async {
    if (ids == null && screenNames == null) {
      throw ArgumentError('required ids or screenNames parameters.');
    }
    var method = 'GET';
    var endPoint = 'users/lookup';
    var parameters = {
      'user_id': ids?.join(','),
      'screen_name': screenNames?.join(',')
    };
    var resp = await request(method, endPoint, parameters: parameters);
    List decoded = json.decode(resp);
    return List<User>.from(decoded.map((u) => User.fromMap(u)));
  }
}
