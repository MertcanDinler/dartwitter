A Twitter API client library for Dart developers.

> **I'm just develop, not testing** :innocent:

## Usage
Authorization

```dart
import 'dart:io';

import 'package:dartwitter/dartwitter.dart';
import 'package:dartwitter/models.dart' as models;

void main() {
  authorize().then((token) => print(token));
}

Future<models.AccessToken> authorize() async {
  var handler = Auth1Handler('api_key', 'api_key_secret');
  var url = await handler.getAuthorizationUrl();
  print(url);
  var verifier = stdin.readLineSync();
  return await handler.getAccessToken(verifier);
}

```

A simple usage example:

```dart
import 'package:dartwitter/dartwitter.dart';
import 'package:dartwitter/models.dart' as models;

void main() {
  var handler = OAuth1Handler('api_key', 'api_key_secret');
  handler.accessToken =
      models.AccessToken('access_token', 'access_token_secret');

  var api = Api(handler);
  api.getUser(screenName: 'mertcandinler0').then((object) => print(object));
}

```

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).