import 'package:built_value/built_value.dart';
import 'package:flutter_app/model/day_filter.dart';

part 'main_state.g.dart';

abstract class MainState implements Built<MainState, MainStateBuilder> {
  DayFilter get activeDayFilter;

  MainState._();

  factory MainState([void Function(MainStateBuilder) updates]) = _$MainState;
}
