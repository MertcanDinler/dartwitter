//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// utils.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-23T10:57:29.435Z
// Modified: 2020-04-23T11:15:01.229Z
//

DateTime dateTimeFromString(String str) {
  var parts = str.split(' ');
  var months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];
  var month =
      (months.indexOf(parts[1].toLowerCase()) + 1).toString().padLeft(2, '0');
  return DateTime.parse('${parts[5]}-$month-${parts[2]} ${parts[3]}Z');
}
