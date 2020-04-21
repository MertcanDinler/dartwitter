//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// media.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T13:52:09.631Z
// Modified: 2020-04-21T15:09:23.686Z
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
}
