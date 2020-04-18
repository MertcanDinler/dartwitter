//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// auth_base.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-18T21:59:38.051Z
// Modified: 2020-04-18T22:05:39.349Z
//

import 'package:oauth1_client/oauth1_client.dart' as oauth1_client;

import '../models/access_token.dart';
import 'auth_base.dart';

/// OAuth1 Authentication Handler
class OAuth1Handler extends AuthBase {
  final String _oAuthUrl = 'https://api.twitter.com/oauth/';
  oauth1_client.OAuth1Client _oauth1;

  OAuth1Handler(String apiKey, String apiKeySecret, {callbackUrl = 'oob'}) {
    var credentials = oauth1_client.ConsumerCredentials(apiKey, apiKeySecret,
        callbackUrl: callbackUrl);
    _oauth1 = oauth1_client.OAuth1Client(credentials);
    _oauth1.signatureMethod = oauth1_client.Signatures.hmacSha1;
  }

  /// After user has authorized the request token, get access token
  /// with user supplied verifier.
  Future<AccessToken> getAccessToken(String verifier) async {
    var accessToken =
        await _oauth1.fetchAccessToken(_getOAuthUrl('access_token'), verifier);
    return AccessToken(accessToken.identifier, accessToken.secret);
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
