//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// Media.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mrtcndnlr/dartwitter/master/LICENSE
//
// Created:  2020-04-21T13:52:09.631Z
// Modified: 2020-04-21T14:43:19.461Z
//

class Media {
  int id;
  List<int> indices;
  String mediaUrl;
  String displayUrl;
  String expandedUrl;
  String mediaUrlHttps;
  MediaSize sizes;
  int sourceStatusId;
  String type;
  String url;
}

class MediaSize {
  Size thumb;
  Size large;
  Size medium;
  Size small;
}

class Size {
  int w;
  int h;
  String resize;
  String url;
}
