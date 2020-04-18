import 'dart:convert';

class AccessToken {
  final String _token;
  final String _secret;

  AccessToken(this._token, this._secret);

  factory AccessToken.fromJson(String source) =>
      AccessToken.fromMap(json.decode(source));
  factory AccessToken.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AccessToken(
      map['access_token'],
      map['access_token_secret'],
    );
  }

  String get secret => _secret;
  String get token => _token;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'access_token': _token,
      'access_token_secret': _secret,
    };
  }

  @override
  String toString() => 'AccessToken(_token: $_token, _secret: $_secret)';
}
