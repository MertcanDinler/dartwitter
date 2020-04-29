//
// Author: Mertcan Dinler (mertdinlerin@gmail.com)
// cursor_response.dart (c) 2020
//
// This software is released under the MIT License.
// https://raw.githubusercontent.com/mertcandinler/dartwitter/master/LICENSE
//
// Created:  2020-04-22T21:06:36.334Z
// Modified: 2020-04-23T10:39:13.078Z
//

import 'dart:collection';
import 'dart:convert';

import 'user.dart';

class CursorResponse<T> extends IterableBase {
  List<T> data;
  int nextCursor = -1;
  int previousCursor = 0;
  CursorResponse({
    this.data,
    this.nextCursor,
    this.previousCursor,
  });

  @override
  Iterator get iterator => _CursorResponseIterator<T>(data);
  @override
  int get length => data.length;

  T operator [](int index) => data[index];

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    var data = [];
    if (T.runtimeType == User) {
      data = this.data.map((u) => (u as User).toMap()).toList();
    } else {
      data = this.data;
    }
    return {
      'data': data,
      'next_cursor': nextCursor,
      'previous_cursor': previousCursor,
    };
  }

  @override
  String toString() =>
      'CursorResponse(nextCursor: $nextCursor, previousCursor: $previousCursor)';

  static CursorResponse<T> fromJson<T>(String source) =>
      fromMap<T>(json.decode(source));

  static CursorResponse<T> fromMap<T>(Map<String, dynamic> map) {
    if (map == null) return null;
    var data = [];
    if (T == User) {
      data = List<User>.from(map['users']?.map((x) => User.fromMap(x)));
    } else if (T == int) {
      data = List<int>.from(map['ids']?.map((x) => (x as int)));
    } else {
      data = map['ids'];
    }
    return CursorResponse<T>(
      data: data,
      nextCursor: map['next_cursor'],
      previousCursor: map['previous_cursor'],
    );
  }
}

class _CursorResponseIterator<T> extends Iterator {
  List<T> data;
  T _current;
  int _index;
  _CursorResponseIterator(this.data);

  @override
  T get current => _current;

  @override
  bool moveNext() {
    if (_index == data.length) {
      _current = null;
      return false;
    } else {
      _current = data[_index++];
      return true;
    }
  }
}
