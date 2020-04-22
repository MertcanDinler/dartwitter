//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// media.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T13:52:09.631Z
// Modified: 2020-04-21T20:43:22.254Z
//

class Media {
  /// ID of the media expressed as a 64-bit integer.
  int id;

  /// An array of integers indicating the offsets within the Tweet text where
  /// the URL begins and ends. The first integer represents the location of the
  /// first character of the URL in the Tweet text. The second integer
  /// represents the location of the first non-URL character occurring after the
  ///  URL (or the end of the string if the URL is the last part of the
  /// Tweet text).
  List<int> indices;

  /// An http:// URL pointing directly to the uploaded media file.
  String mediaUrl;

  /// An https:// URL pointing directly to the uploaded media file, for
  /// embedding on https pages.
  String mediaUrlHttps;

  /// URL of the media to display to clients.
  String displayUrl;

  /// An expanded version of display_url. Links to the media display page.
  String expandedUrl;

  /// An object showing available sizes for the media file.
  MediaSize sizes;

  /// Nullable. For Tweets containing media that was originally associated with
  /// a different tweet, this ID points to the original Tweet.
  int sourceStatusId;

  /// Type of uploaded media. Possible types include photo, video, and
  /// animated_gif.
  String type;

  /// Wrapped URL for the media link. This corresponds with the URL embedded
  /// directly into the raw Tweet text, and the values for the indices
  /// parameter.
  String url;
  Media();
  factory Media.fromMap(Map<String, dynamic> map) {
    return Media()
      ..id = (map['id'] as int)
      ..indices = (map['indices'] as List<int>)
      ..mediaUrl = (map['media_url'] as String)
      ..mediaUrlHttps = (map['media_url_https'] as String)
      ..displayUrl = (map['display_url'] as String)
      ..expandedUrl = (map['expanded_url'] as String)
      ..sizes = MediaSize(map['sizes'], map['media_url_https'])
      ..sourceStatusId = (map['source_status_id'] as int)
      ..type = (map['type'] as String)
      ..url = (map['url'] as String);
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'indices': indices,
      'media_url': mediaUrl,
      'media_url_https': mediaUrlHttps,
      'display_url': displayUrl,
      'expanded_url': expandedUrl,
      'sizes': sizes.toMap(),
      'source_status_id': sourceStatusId,
      'type': type,
      'url': url
    };
  }
}

class MediaSize {
  /// Information for a thumbnail-sized version of the media.
  Size thumb;

  /// Information for a large-sized version of the media.
  Size large;

  /// Information for a medium-sized version of the media.
  Size medium;

  /// Information for a small-sized version of the media.
  Size small;

  MediaSize(Map<String, Map<String, dynamic>> sizes, String url) {
    if (sizes.containsKey('thumb')) {
      thumb = Size(sizes['thumb']['w'], sizes['thumb']['h'],
          sizes['thumb']['resize'], url, 'thumb');
    }
    if (sizes.containsKey('large')) {
      large = Size(sizes['large']['w'], sizes['large']['h'],
          sizes['large']['resize'], url, 'large');
    }
    if (sizes.containsKey('medium')) {
      medium = Size(sizes['medium']['w'], sizes['medium']['h'],
          sizes['medium']['resize'], url, 'medium');
    }
    if (sizes.containsKey('small')) {
      small = Size(sizes['small']['w'], sizes['small']['h'],
          sizes['small']['resize'], url, 'small');
    }
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thumb': thumb?.toMap(),
      'large': large?.toMap(),
      'medium': medium?.toMap(),
      'small': small?.toMap()
    };
  }
}

class Size {
  /// Width in pixels of this size.
  int w;

  /// Height in pixels of this size.
  int h;

  /// Resizing method used to obtain this size. A value of fit means that the
  /// media was resized to fit one dimension, keeping its native aspect ratio.
  /// A value of crop means that the media was cropped in order to fit a
  /// specific resolution.
  String resize;

  /// Sized media url
  String url;
  Size(this.w, this.h, this.resize, String url, String size) {
    var ext = url.split('.').last;
    this.url = url.replaceAll('.$ext', '') + '?format=$ext&name=$size';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'w': w, 'h': h, 'resize': resize, 'url': url};
  }
}
