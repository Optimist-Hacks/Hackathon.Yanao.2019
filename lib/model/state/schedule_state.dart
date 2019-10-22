import 'package:built_value/built_value.dart';
import 'package:flutter_app/model/day_filter.dart';

part 'schedule_state.g.dart';

abstract class ScheduleState
    implements Built<ScheduleState, ScheduleStateBuilder> {
  DayFilter get activeDayFilter;

  ScheduleState._();

  factory ScheduleState([void Function(ScheduleStateBuilder) updates]) =
      _$ScheduleState;
}
