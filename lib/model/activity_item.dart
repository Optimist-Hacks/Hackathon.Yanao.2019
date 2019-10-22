import 'dart:ui';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_app/texts.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/ui/berezka_icons.dart';

part 'activity_item.g.dart';

abstract class ActivityItem
    implements Built<ActivityItem, ActivityItemBuilder> {
  static Serializer<ActivityItem> get serializer => _$activityItemSerializer;

  static final walk = ActivityItem._create(
    value: 0,
    icon: BerezkaIcons.walk,
    name: Texts.walk,
    duration: "30-45 минут",
    color: BerezkaColors.walk,
  );

  static final sport = ActivityItem._create(
    value: 1,
    icon: BerezkaIcons.sport,
    name: Texts.sport,
    duration: "30-45 минут",
    color: BerezkaColors.sport,
  );

  static final chill = ActivityItem._create(
    value: 2,
    icon: BerezkaIcons.chill,
    name: Texts.chill,
    duration: "30-45 минут",
    color: BerezkaColors.chill,
  );

  static final eat = ActivityItem._create(
    value: 3,
    icon: BerezkaIcons.eat,
    name: Texts.eat,
    duration: "30-45 минут",
    color: BerezkaColors.eat,
  );

  int get value;

  String get icon;

  String get name;

  String get duration;

  Color get color;

  ActivityItem._();

  static final values = [
    walk,
    sport,
    chill,
    eat,
  ];

  factory ActivityItem._create({
    @material.required int value,
    @material.required String icon,
    @material.required String name,
    @material.required String duration,
    @material.required Color color,
  }) {
    return _$ActivityItem((b) => b
      ..value = value
      ..icon = icon
      ..name = name
      ..duration = duration
      ..color = color);
  }

  factory ActivityItem.fromValue(int value) {
    for (final val in values) {
      if (val.value == value) {
        return val;
      }
    }

    throw UnsupportedError("Unsupported ActivityItem value");
  }
}
