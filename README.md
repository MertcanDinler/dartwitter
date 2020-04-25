A Twitter API client library for Dart developers.

> **I'm just develop, not testing** :innocent:

## Usage

A simple usage example:

```dart
import 'dart:io';

import 'package:dartwitter/dartwitter.dart';

void main() {
  var handler = OAuth1Handler(
      'api_key', 'api_key_secret');
  handler.accessToken = AccessToken(
      'access_token',
      'access_token_secret');

  var api = Api(handler);
  api.getUser(screenName: 'mertcandinler0').then((object) => print(object));
}
```

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).