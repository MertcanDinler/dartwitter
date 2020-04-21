//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// api_base.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-20T09:44:42.864Z
// Modified: 2020-04-20T10:28:56.645Z
//

abstract class ApiBase {
  Future<String> request(String method, String endPoint,
      {Map<String, String> parameters});
}
