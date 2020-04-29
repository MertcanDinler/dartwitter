//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// auth_base.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mertcandinler/dartwitter/master/LICENSE
//
// Created:  2020-04-18T22:04:11.309Z
// Modified: 2020-04-20T13:46:10.869Z
//
import 'package:http/http.dart' as http;

abstract class AuthBase {
  http.BaseClient get client;
}
