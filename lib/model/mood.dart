import 'dart:ui';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/texts.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/ui/berezka_icons.dart';

part 'mood.g.dart';

abstract class Mood implements Built<Mood, MoodBuilder> {
  static Serializer<Mood> get serializer => _$moodSerializer;

  static final funny = Mood._create(
    value: 0,
    name: Texts.funny,
    path: BerezkaIcons.funny,
    color: BerezkaColors.funny,
  );

  static final calm = Mood._create(
    value: 1,
    name: Texts.calm,
    path: BerezkaIcons.calm,
    color: BerezkaColors.calm,
  );

  static final sad = Mood._create(
    value: 2,
    name: Texts.sad,
    path: BerezkaIcons.sad,
    color: BerezkaColors.sad,
  );

  static final angry = Mood._create(
    value: 3,
    name: Texts.angry,
    path: BerezkaIcons.angry,
    color: BerezkaColors.angry,
  );

  int get value;

  String get name;

  String get path;

  Color get color;

  Mood._();

  static final values = [
    funny,
    calm,
    sad,
    angry,
  ];

  factory Mood._create({
    @required int value,
    @required String name,
    @required String path,
    @required Color color,
  }) {
    return _$Mood((b) => b
      ..value = value
      ..name = name
      ..path = path
      ..color = color);
  }

  factory Mood.fromValue(int value) {
    for (final val in values) {
      if (val.value == value) {
        return val;
      }
    }

    throw UnsupportedError("Unsupported Mood value");
  }
}
