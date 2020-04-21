//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// verify_credentials.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-20T22:07:17.916Z
// Modified: 2020-04-20T22:23:37.383Z
//

import 'package:json_annotation/json_annotation.dart';
part 'verify_credentials.g.dart';

@JsonSerializable()
class VerifyCredentials {
  int id;
  String name;
  String screenName;
  String location;
  String description;
  String url;
  bool protected;
  int followersCount;
  int friendsCount;
  int listedCount;
  DateTime createdAt;
  int favouritesCount;
  dynamic utcOffset;
  dynamic timezone;
  bool geoEnabled;
  bool verified;
  int statusesCount;
  String lang;
  dynamic status;
  bool contributorsEnabled;
  bool isTranslator;
  bool isTranslationEnabled;
  String profileBackgroundColor;
  String profileBackgroundImageUrl;
  String profileBackgroundImageUrlHttps;
  bool profileBackgroundTile;
  String profileImageUrl;
  String profileImageUrlHttps;
  String profileBannerUrl;
  String profileLinkColor;
  String profileSidebarBorderColor;
  String profileSidebarFillColor;
  String profileTextColor;
  bool profileUseBackgroundImage;
  bool hasExtendedProfile;
  bool defaultProfile;
  bool defaultProfileImage;
  bool following;
  bool followRequestSent;
  bool notifications;
  String translatorType;
  bool suspended;
  bool needsPhoneVerification;
}
