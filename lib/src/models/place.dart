//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// place.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-22T21:04:03.715Z
// Modified: 2020-04-25T10:29:03.179Z
//

import 'dart:convert';

class Place {
  String id;
  String url;
  String placeType;
  String name;
  String fullName;
  String countryCode;
  String country;
  Map<String, dynamic> boundingBox;
  Place({
    this.id,
    this.url,
    this.placeType,
    this.name,
    this.fullName,
    this.countryCode,
    this.country,
    this.boundingBox,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'place_type': placeType,
      'name': name,
      'full_name': fullName,
      'country_code': countryCode,
      'country': country,
      'bounding_box': boundingBox,
    };
  }

  @override
  String toString() {
    return 'Place(id: $id, url: $url, placeType: $placeType, name: $name, fullName: $fullName, countryCode: $countryCode, country: $country, boundingBox: $boundingBox)';
  }

  static Place fromJson(String source) => fromMap(json.decode(source));

  static Place fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Place(
      id: map['id'],
      url: map['url'],
      placeType: map['place_type'],
      name: map['name'],
      fullName: map['full_name'],
      countryCode: map['country_code'],
      country: map['country'],
      boundingBox: map['bounding_box'],
    );
  }
}
