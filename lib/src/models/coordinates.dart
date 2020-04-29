//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// coordinates.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mertcandinler/dartwitter/master/LICENSE
//
// Created:  2020-04-22T21:06:36.334Z
// Modified: 2020-04-23T10:39:13.078Z
//

import 'dart:convert';

class Coordinates {
  List<double> coordinates;
  String type;

  Coordinates({
    this.coordinates,
    this.type,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'coordinates': List<dynamic>.from(coordinates.map((x) => x)),
      'type': type,
    };
  }

  @override
  String toString() => 'Coordinates(coordinates: $coordinates, type: $type)';

  static Coordinates fromJson(String source) => fromMap(json.decode(source));

  static Coordinates fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Coordinates(
      coordinates: List<double>.from(map['coordinates']),
      type: map['type'],
    );
  }
}
