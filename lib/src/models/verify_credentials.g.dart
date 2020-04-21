// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCredentials _$VerifyCredentialsFromJson(Map<String, dynamic> json) {
  return VerifyCredentials()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..screenName = json['screenName'] as String
    ..location = json['location'] as String
    ..description = json['description'] as String
    ..url = json['url'] as String
    ..protected = json['protected'] as bool
    ..followersCount = json['followersCount'] as int
    ..friendsCount = json['friendsCount'] as int
    ..listedCount = json['listedCount'] as int
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String)
    ..favouritesCount = json['favouritesCount'] as int
    ..utcOffset = json['utcOffset']
    ..timezone = json['timezone']
    ..geoEnabled = json['geoEnabled'] as bool
    ..verified = json['verified'] as bool
    ..statusesCount = json['statusesCount'] as int
    ..lang = json['lang'] as String
    ..status = json['status']
    ..contributorsEnabled = json['contributorsEnabled'] as bool
    ..isTranslator = json['isTranslator'] as bool
    ..isTranslationEnabled = json['isTranslationEnabled'] as bool
    ..profileBackgroundColor = json['profileBackgroundColor'] as String
    ..profileBackgroundImageUrl = json['profileBackgroundImageUrl'] as String
    ..profileBackgroundImageUrlHttps =
        json['profileBackgroundImageUrlHttps'] as String
    ..profileBackgroundTile = json['profileBackgroundTile'] as bool
    ..profileImageUrl = json['profileImageUrl'] as String
    ..profileImageUrlHttps = json['profileImageUrlHttps'] as String
    ..profileBannerUrl = json['profileBannerUrl'] as String
    ..profileLinkColor = json['profileLinkColor'] as String
    ..profileSidebarBorderColor = json['profileSidebarBorderColor'] as String
    ..profileSidebarFillColor = json['profileSidebarFillColor'] as String
    ..profileTextColor = json['profileTextColor'] as String
    ..profileUseBackgroundImage = json['profileUseBackgroundImage'] as bool
    ..hasExtendedProfile = json['hasExtendedProfile'] as bool
    ..defaultProfile = json['defaultProfile'] as bool
    ..defaultProfileImage = json['defaultProfileImage'] as bool
    ..following = json['following'] as bool
    ..followRequestSent = json['followRequestSent'] as bool
    ..notifications = json['notifications'] as bool
    ..translatorType = json['translatorType'] as String
    ..suspended = json['suspended'] as bool
    ..needsPhoneVerification = json['needsPhoneVerification'] as bool;
}

Map<String, dynamic> _$VerifyCredentialsToJson(VerifyCredentials instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'screenName': instance.screenName,
      'location': instance.location,
      'description': instance.description,
      'url': instance.url,
      'protected': instance.protected,
      'followersCount': instance.followersCount,
      'friendsCount': instance.friendsCount,
      'listedCount': instance.listedCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'favouritesCount': instance.favouritesCount,
      'utcOffset': instance.utcOffset,
      'timezone': instance.timezone,
      'geoEnabled': instance.geoEnabled,
      'verified': instance.verified,
      'statusesCount': instance.statusesCount,
      'lang': instance.lang,
      'status': instance.status,
      'contributorsEnabled': instance.contributorsEnabled,
      'isTranslator': instance.isTranslator,
      'isTranslationEnabled': instance.isTranslationEnabled,
      'profileBackgroundColor': instance.profileBackgroundColor,
      'profileBackgroundImageUrl': instance.profileBackgroundImageUrl,
      'profileBackgroundImageUrlHttps': instance.profileBackgroundImageUrlHttps,
      'profileBackgroundTile': instance.profileBackgroundTile,
      'profileImageUrl': instance.profileImageUrl,
      'profileImageUrlHttps': instance.profileImageUrlHttps,
      'profileBannerUrl': instance.profileBannerUrl,
      'profileLinkColor': instance.profileLinkColor,
      'profileSidebarBorderColor': instance.profileSidebarBorderColor,
      'profileSidebarFillColor': instance.profileSidebarFillColor,
      'profileTextColor': instance.profileTextColor,
      'profileUseBackgroundImage': instance.profileUseBackgroundImage,
      'hasExtendedProfile': instance.hasExtendedProfile,
      'defaultProfile': instance.defaultProfile,
      'defaultProfileImage': instance.defaultProfileImage,
      'following': instance.following,
      'followRequestSent': instance.followRequestSent,
      'notifications': instance.notifications,
      'translatorType': instance.translatorType,
      'suspended': instance.suspended,
      'needsPhoneVerification': instance.needsPhoneVerification,
    };
