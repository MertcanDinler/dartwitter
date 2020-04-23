//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// entities.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T13:21:55.426Z
// Modified: 2020-04-23T12:16:25.407Z
//

import 'dart:convert';

class Entities {
  List<_Hashtag> hashtags;
  List<_Url> urls;
  List<_Mention> mentions;
  List<_Symbol> symbols;
  Entities({
    this.hashtags,
    this.urls,
    this.mentions,
    this.symbols,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'hashtags': List<dynamic>.from(hashtags.map((x) => x.toMap())),
      'urls': List<dynamic>.from(urls.map((x) => x.toMap())),
      'mentions': List<dynamic>.from(mentions.map((x) => x.toMap())),
      'symbols': List<dynamic>.from(symbols.map((x) => x.toMap())),
    };
  }

  @override
  String toString() {
    return 'Entities(hashtags: $hashtags, urls: $urls, mentions: $mentions, symbols: $symbols)';
  }

  static Entities fromJson(String source) => fromMap(json.decode(source));

  static Entities fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Entities(
      hashtags:
          List<_Hashtag>.from(map['hashtags']?.map((x) => _Hashtag.fromMap(x))),
      urls: List<_Url>.from(map['urls']?.map((x) => _Url.fromMap(x))),
      mentions: List<_Mention>.from(
          map['user_mentions']?.map((x) => _Mention.fromMap(x))),
      symbols:
          List<_Symbol>.from(map['symbols']?.map((x) => _Symbol.fromMap(x))),
    );
  }
}

class _Hashtag {
  /// An array of integers indicating the offsets within the Tweet text where
  /// the hashtag begins and ends. The first integer represents the location of
  /// the # character in the Tweet text string. The second integer represents
  /// the location of the first character after the hashtag. Therefore the
  /// difference between the two numbers will be the length of the hashtag name
  /// plus one (for the ‘#’ character).
  List<int> indices;

  /// Name of the hashtag, minus the leading ‘#’ character.
  String text;

  _Hashtag({
    this.indices,
    this.text,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'indices': List<dynamic>.from(indices.map((x) => x)),
      'text': text,
    };
  }

  @override
  String toString() => '_Hashtag(indices: $indices, text: $text)';

  static _Hashtag fromJson(String source) => fromMap(json.decode(source));

  static _Hashtag fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return _Hashtag(
      indices: List<int>.from(map['indices']),
      text: map['text'],
    );
  }
}

class _Mention {
  /// ID of the mentioned user, as an integer.
  int id;

  /// An array of integers representing the offsets within the Tweet text where
  /// the user reference begins and ends. The first integer represents the
  /// location of the ‘@’ character of the user mention. The second integer
  /// represents the location of the first non-screenname character following
  /// the user mention.
  List<int> indices;

  /// Display name of the referenced user.
  String name;

  /// Screen name of the referenced user.
  String screenName;

  _Mention({
    this.id,
    this.indices,
    this.name,
    this.screenName,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'indices': List<dynamic>.from(indices.map((x) => x)),
      'name': name,
      'screen_name': screenName,
    };
  }

  @override
  String toString() {
    return '_Mention(id: $id, indices: $indices, name: $name, screen_name: $screenName)';
  }

  static _Mention fromJson(String source) => fromMap(json.decode(source));

  static _Mention fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return _Mention(
      id: map['id'],
      indices: List<int>.from(map['indices']),
      name: map['name'],
      screenName: map['screen_name'],
    );
  }
}

class _Symbol {
  /// An array of integers indicating the offsets within the Tweet text where
  /// the symbol/cashtag begins and ends. The first integer represents the
  /// location of the $ character in the Tweet text string. The second integer
  /// represents the location of the first character after the cashtag.
  /// Therefore the difference between the two numbers will be the length of
  /// the hashtag name plus one (for the ‘$’ character).
  List<int> indices;

  /// Name of the cashhtag, minus the leading ‘$’ character.
  String text;

  _Symbol({
    this.indices,
    this.text,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'indices': List<dynamic>.from(indices.map((x) => x)),
      'text': text,
    };
  }

  @override
  String toString() => '_Symbol(indices: $indices, text: $text)';

  static _Symbol fromJson(String source) => fromMap(json.decode(source));

  static _Symbol fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return _Symbol(
      indices: List<int>.from(map['indices']),
      text: map['text'],
    );
  }
}

class _UnwoundUrl {
  /// The fully unwound version of the link included in the Tweet.
  String url;

  /// Final HTTP status of the unwinding process, a '200' indicating success.
  int status;

  /// HTML title for the link.
  String title;

  /// HTML description for the link.
  String description;
  _UnwoundUrl({
    this.url,
    this.status,
    this.title,
    this.description,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'status': status,
      'title': title,
      'description': description,
    };
  }

  @override
  String toString() {
    return '_UnwoundUrl(url: $url, status: $status, title: $title, description: $description)';
  }

  static _UnwoundUrl fromJson(String source) => fromMap(json.decode(source));

  static _UnwoundUrl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return _UnwoundUrl(
      url: map['url'],
      status: map['status'],
      title: map['title'],
      description: map['description'],
    );
  }
}

class _Url {
  /// URL pasted/typed into Tweet.
  String displayUrl;

  /// Expanded version of 'display_url' .
  String expandedUrl;

  /// An array of integers representing offsets within the Tweet text where the
  /// URL begins and ends. The first integer represents the location of the
  /// first character of the URL in the Tweet text. The second integer
  /// represents the location of the first non-URL character after the end of
  /// the URL.
  List<int> indices;

  /// Wrapped URL, corresponding to the value embedded directly into the raw
  /// Tweet text, and the values for the indices parameter.
  String url;

  /// If you are using the Expanded and/or Enhanced URL enrichments, the
  /// following metadata is available under the unwound attribute
  _UnwoundUrl unwound;
  _Url({
    this.displayUrl,
    this.expandedUrl,
    this.indices,
    this.url,
    this.unwound,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'display_url': displayUrl,
      'expanded_url': expandedUrl,
      'indices': List<dynamic>.from(indices.map((x) => x)),
      'url': url,
      'unwound': unwound.toMap(),
    };
  }

  @override
  String toString() {
    return '_Url(displayUrl: $displayUrl, expandedUrl: $expandedUrl, indices: $indices, url: $url, unwound: $unwound)';
  }

  static _Url fromJson(String source) => fromMap(json.decode(source));

  static _Url fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return _Url(
      displayUrl: map['display_url'],
      expandedUrl: map['expanded_url'],
      indices: List<int>.from(map['indices']),
      url: map['url'],
      unwound: _UnwoundUrl.fromMap(map['unwound']),
    );
  }
}
