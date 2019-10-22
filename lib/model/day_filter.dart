import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/texts.dart';

part 'day_filter.g.dart';

abstract class DayFilter implements Built<DayFilter, DayFilterBuilder> {
  static Serializer<DayFilter> get serializer => _$dayFilterSerializer;

  static final day = DayFilter._create(
    value: 0,
    name: Texts.day,
  );

  static final week = DayFilter._create(
    value: 1,
    name: Texts.week,
  );

  static final period = DayFilter._create(
    value: 2,
    name: Texts.period,
  );

  static final today = DayFilter._create(
    value: 3,
    name: Texts.today,
  );

  static final tomorrow = DayFilter._create(
    value: 4,
    name: Texts.tomorrow,
  );

  int get value;

  String get name;

  DayFilter._();

  static final values = [
    day,
    week,
    period,
  ];

  factory DayFilter._create({
    @required int value,
    @required String name,
  }) {
    return _$DayFilter((b) => b
      ..value = value
      ..name = name);
  }

  factory DayFilter.fromValue(int value) {
    for (final val in values) {
      if (val.value == value) {
        return val;
      }
    }

    throw UnsupportedError("Unsupported DayFilter value");
  }
}
