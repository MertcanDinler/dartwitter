//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// auth_base.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-18T22:04:11.309Z
// Modified: 2020-04-18T22:05:37.205Z
//
import 'package:http/http.dart' as http;

abstract class AuthBase {
  http.BaseClient _client;
  http.BaseClient get client => _client;
}
