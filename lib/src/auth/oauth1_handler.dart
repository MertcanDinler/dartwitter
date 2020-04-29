//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// auth_base.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mertcandinler/dartwitter/master/LICENSE
//
// Created:  2020-04-18T21:59:38.051Z
// Modified: 2020-04-20T13:46:14.194Z
//

import 'package:oauth1_client/oauth1_client.dart' as auth;
import 'package:http/http.dart' as http;

import '../models/access_token.dart';
import 'auth_base.dart';

/// OAuth1 Authentication Handler
class OAuth1Handler extends AuthBase {
  final String _oAuthUrl = 'https://api.twitter.com/oauth/';
  auth.OAuth1Client _oauth1;
  String _authorizedUsername;
  AccessToken _token;

  OAuth1Handler(String apiKey, String apiKeySecret, {callbackUrl = 'oob'}) {
    var credentials = auth.ConsumerCredentials(apiKey, apiKeySecret,
        callbackUrl: callbackUrl);
    _oauth1 = auth.OAuth1Client(credentials);
    _oauth1.signatureMethod = auth.Signatures.hmacSha1;
  }

  String get authorizedUsername => _authorizedUsername;
  AccessToken get accessToken => _token;
  set accessToken(AccessToken token) {
    _token = token;
    _oauth1.token = auth.TokenCredentials(token.token, token.secret);
  }

  @override
  http.BaseClient get client => _oauth1.client;

  /// After user has authorized the request token, get access token
  /// with user supplied verifier.
  Future<AccessToken> getAccessToken(String verifier) async {
    var accessToken =
        await _oauth1.fetchAccessToken(_getOAuthUrl('access_token'), verifier);
    var splitResp = Uri.splitQueryString(_oauth1.lastResponse.body);
    if (splitResp.containsKey('screen_name')) {
      _authorizedUsername = splitResp['screen_name'];
    }
    _token = AccessToken(accessToken.identifier, accessToken.secret);
    return _token;
  }

  /// Get the authorization URL to redirect the user
  Future<String> getAuthorizationUrl({bool signInWithTwitter = false}) async {
    var url = '';
    if (signInWithTwitter) {
      url = _getOAuthUrl('authenticate');
    } else {
      url = _getOAuthUrl('authorize');
    }
    await _oauth1.fetchRequestToken(_getOAuthUrl('request_token'));
    return _oauth1.getAuthorizationUrl(url);
  }

  String _getOAuthUrl(String endpoint) => _oAuthUrl + endpoint;
}
