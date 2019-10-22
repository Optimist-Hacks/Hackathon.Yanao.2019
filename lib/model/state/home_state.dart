import 'package:built_value/built_value.dart';
import 'package:flutter_app/model/activity_item.dart';
import 'package:flutter_app/model/day_filter.dart';
import 'package:built_collection/built_collection.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  DayFilter get activeDayFilter;

  BuiltSet<ActivityItem> get activityItems;

  HomeState._();

  factory HomeState([void Function(HomeStateBuilder) updates]) = _$HomeState;
}
