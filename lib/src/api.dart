//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// api.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-19T21:31:23.019Z
// Modified: 2020-04-20T19:26:56.791Z
//

import 'package:dartwitter/src/api_base.dart';
import 'package:dartwitter/src/auth/auth_base.dart';
import 'package:http/http.dart' as http;

class Api extends ApiBase {
  final Uri _apiUri = Uri.parse('https://api.twitter.com/1.1/');
  final AuthBase _authHandler;

  Api(this._authHandler) {
    if (_authHandler == null) throw ArgumentError('authHandler can\'t null');
  }

  http.Client get _client => _authHandler.client;

  @override
  Future<String> request(String method, String endPoint,
      {Map<String, String> parameters}) async {
    var response = '';
    var uri = _apiUri.replace(path: '${_apiUri.path}$endPoint.json');
    if (method == 'GET') {
      uri = uri.replace(queryParameters: parameters);
      var res = await _client.get(uri.toString());
      response = res.body;
    }
    return response;
  }
}