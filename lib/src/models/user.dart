//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// user.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T13:10:33.763Z
// Modified: 2020-04-25T19:32:47.472Z
//

import 'dart:convert';

import '../utils.dart';
import 'tweet.dart';

/// The User object contains Twitter User account metadata that describes the
/// Twitter User referenced. Users can author Tweets, Retweet, quote other Users
/// Tweets, reply to Tweets, follow Users, be @mentioned in Tweets and can be
/// grouped into lists.
/// From:
/// https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/user-object
class User {
  int id;
  String name;
  String screenName;
  String location;
  Map<String, dynamic> derived;
  String url;
  String description;
  bool protected;
  bool verified;
  int followersCount;
  int friendsCount;
  int listedCount;
  int favouritesCount;
  int statusesCount;
  String _createdAt;
  DateTime createdAt;
  String profileBannerUrl;
  String profileImageUrlHttps;
  bool defaultProfile;
  bool defaultProfileImage;
  List<String> withheldInCountries;
  String withheldScope;
  //Returns the last tweet, if possible
  Tweet status;
  User(
      {this.id,
      this.name,
      this.screenName,
      this.location,
      this.derived,
      this.url,
      this.description,
      this.protected,
      this.verified,
      this.followersCount,
      this.friendsCount,
      this.listedCount,
      this.favouritesCount,
      this.statusesCount,
      String createdAt,
      this.profileBannerUrl,
      this.profileImageUrlHttps,
      this.defaultProfile,
      this.defaultProfileImage,
      this.withheldInCountries,
      this.withheldScope,
      this.status}) {
    _createdAt = createdAt;
    this.createdAt = dateTimeFromString(createdAt);
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'screen_name': screenName,
      'location': location,
      'derived': derived,
      'url': url,
      'description': description,
      'protected': protected,
      'verified': verified,
      'followers_count': followersCount,
      'friends_count': friendsCount,
      'listed_count': listedCount,
      'favourites_count': favouritesCount,
      'statuses_count': statusesCount,
      'created_at': _createdAt,
      'profile_banner_url': profileBannerUrl,
      'profile_image_url_https': profileImageUrlHttps,
      'default_profile': defaultProfile,
      'default_profile_image': defaultProfileImage,
      'withheld_in_countries':
          List<String>.from(withheldInCountries.map((x) => x)),
      'withheld_scope': withheldScope,
      'status': status.toMap()
    };
  }

  @override
  String toString() {
    return 'User(id: $id, screenName: $screenName, name: $name)';
  }

  static User fromJson(String source) => fromMap(json.decode(source));

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
        id: map['id'],
        name: map['name'],
        screenName: map['screen_name'],
        location: map['location'],
        derived: map['derived'],
        url: map['url'],
        description: map['description'],
        protected: map['protected'],
        verified: map['verified'],
        followersCount: map['followers_count'],
        friendsCount: map['friends_count'],
        listedCount: map['listed_count'],
        favouritesCount: map['favourites_count'],
        statusesCount: map['statuses_count'],
        createdAt: map['created_at'],
        profileBannerUrl: map['profile_banner_url'],
        profileImageUrlHttps: map['profile_image_url_https'],
        defaultProfile: map['default_profile'],
        defaultProfileImage: map['default_profile_image'],
        withheldInCountries: map.containsKey('withheld_in_countries')
            ? List<String>.from(map['withheld_in_countries'])
            : null,
        withheldScope: map['withheld_scope'],
        status: Tweet.fromMap(map['status']));
  }
}
