import 'package:built_value/built_value.dart';
import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/navigation_item.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  DayFilter get activeDayFilter;

  HomeState._();

  factory HomeState([void Function(HomeStateBuilder) updates]) = _$HomeState;
}
