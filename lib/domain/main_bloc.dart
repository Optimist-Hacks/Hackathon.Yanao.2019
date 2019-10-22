import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/state/main_state.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc {
  final _stateSubject = BehaviorSubject<MainState>();
  MainState initState;

  Stream<MainState> get state => _stateSubject;

  MainBloc() {
    initState = MainState(
      (b) => b..activeDayFilter = DayFilter.day.toBuilder(),
    );
    _stateSubject.add(initState);
  }

  void onClickDayFilter(DayFilter dayFilter) {
    _updateState((b) => b..activeDayFilter = dayFilter.toBuilder());
  }

  void _updateState(updates(MainStateBuilder builder)) {
    _stateSubject.add(
      _stateSubject.value.rebuild(updates),
    );
  }
}
