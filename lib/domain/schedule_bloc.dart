import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/state/schedule_state.dart';
import 'package:rxdart/rxdart.dart';

class ScheduleBloc {
  final _stateSubject = BehaviorSubject<ScheduleState>();
  ScheduleState initState;

  Stream<ScheduleState> get state => _stateSubject;

  ScheduleBloc() {
    initState =
        ScheduleState((b) => b..activeDayFilter = DayFilter.today.toBuilder());
    _stateSubject.add(initState);
  }

  void onClickDayFilter(DayFilter dayFilter) {
    _updateState((b) => b..activeDayFilter = dayFilter.toBuilder());
  }

  void _updateState(updates(ScheduleStateBuilder builder)) {
    _stateSubject.add(_stateSubject.value.rebuild(updates));
  }
}
