//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// access_token.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-18T22:00:00.950Z
// Modified: 2020-04-20T21:41:56.473Z
//
import 'package:json_annotation/json_annotation.dart';
part 'access_token.g.dart';

@JsonSerializable()
class AccessToken {
  final String token;
  final String secret;

  AccessToken(this.token, this.secret);
}
