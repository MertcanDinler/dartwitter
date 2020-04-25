//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// api.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-19T21:31:23.019Z
// Modified: 2020-04-25T10:31:52.028Z
//

import 'package:http/http.dart' as http;

import 'api_base.dart';
import 'auth/auth_base.dart';
import 'endpoints/timeline.dart';
import 'endpoints/users.dart';

class Api extends ApiBase with Timeline, Users {
  final Uri _apiUri = Uri.parse('https://api.twitter.com/1.1/');
  final AuthBase _authHandler;

  Api(this._authHandler) {
    if (_authHandler == null) throw ArgumentError('authHandler can\'t null');
  }

  http.Client get _client => _authHandler.client;

  @override
  Future<String> request(String method, String endPoint,
      {Map<String, dynamic> parameters}) async {
    parameters.removeWhere((key, val) => val == null);
    var response = '';
    parameters.removeWhere((key, val) => val == null);
    var uri = _apiUri.replace(path: '${_apiUri.path}$endPoint.json');
    if (method == 'GET') {
      uri = uri.replace(queryParameters: parameters);
      var res = await _client.get(uri.toString());
      response = res.body;
    }
    if (method == 'POST') {
      var res = await _client.post(uri, body: parameters);
      response = res.body;
    }
    return response;
  }
}
