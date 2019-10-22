import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/texts.dart';
import 'package:flutter_app/ui/berezka_icons.dart';

part 'activity_item.g.dart';

abstract class ActivityItem
    implements Built<ActivityItem, ActivityItemBuilder> {
  static Serializer<ActivityItem> get serializer => _$activityItemSerializer;

  String get icon;

  String get name;

  String get duration;

  ActivityItem._();

  factory ActivityItem([void Function(ActivityItemBuilder) updates]) =
      _$ActivityItem;
}
