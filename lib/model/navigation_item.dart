import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/texts.dart';
import 'package:flutter_app/ui/berezka_icons.dart';

part 'navigation_item.g.dart';

abstract class NavigationItem
    implements Built<NavigationItem, NavigationItemBuilder> {
  static Serializer<NavigationItem> get serializer =>
      _$navigationItemSerializer;

  static final home = NavigationItem._create(
    value: 0,
    icon: BerezkaIcons.home,
  );

  static final schedule = NavigationItem._create(
    value: 1,
    icon: BerezkaIcons.schedule,
  );

  static final info = NavigationItem._create(
    value: 2,
    icon: BerezkaIcons.info,
  );

  int get value;

  String get icon;

  NavigationItem._();

  static final values = [
    home,
    schedule,
    info,
  ];

  factory NavigationItem._create({
    @required int value,
    @required String icon,
  }) {
    return _$NavigationItem((b) => b
      ..value = value
      ..icon = icon);
  }

  factory NavigationItem.fromValue(int value) {
    for (final val in values) {
      if (val.value == value) {
        return val;
      }
    }

    throw UnsupportedError("Unsupported PlaceType value");
  }
}
