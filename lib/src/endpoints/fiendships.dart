//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// fiendships.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-26T13:43:34.870Z
// Modified: 2020-04-26T13:45:37.768Z
//

import '../api_base.dart';
import '../models/cursor_response.dart';

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
