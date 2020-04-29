//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// access_token.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mertcandinler/dartwitter/master/LICENSE
//
// Created:  2020-04-18T22:00:00.950Z
// Modified: 2020-04-25T10:28:39.650Z
//

import 'dart:convert';

class AccessToken {
  final String token;
  final String secret;

  AccessToken(
    this.token,
    this.secret,
  );

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AccessToken && o.token == token && o.secret == secret;
  }

  String toJson() => json.encode(toMap());

  Map<String, String> toMap() {
    return {
      'access_token': token,
      'access_token_secret': secret,
    };
  }

  @override
  String toString() => 'AccessToken(token: $token, secret: $secret)';

  static AccessToken fromJson(String source) => fromMap(json.decode(source));

  static AccessToken fromMap(Map<String, String> map) {
    if (map == null) return null;

    return AccessToken(
      map['access_token'],
      map['access_token_secret'],
    );
  }
}
