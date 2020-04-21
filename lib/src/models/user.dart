//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// user.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T13:10:33.763Z
// Modified: 2020-04-21T15:10:51.096Z
//

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
  DateTime createdAt;
  String profileBannerUrl;
  String profileImageUrlHttps;
  bool defaultProfile;
  bool defaultProfileImage;
  List<String> withheldInCountries;
  String withheldScope;
}
