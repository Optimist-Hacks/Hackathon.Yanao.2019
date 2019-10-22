import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/navigation_item.dart';
import 'package:flutter_app/model/state/home_state.dart';
import 'package:flutter_app/model/state/main_state.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _stateSubject = BehaviorSubject<HomeState>();
  HomeState initState;

  Stream<HomeState> get state => _stateSubject;

  HomeBloc() {
    initState =
        HomeState((b) => b..activeDayFilter = DayFilter.day.toBuilder());
    _stateSubject.add(initState);
  }

  void onClickDayFilter(DayFilter dayFilter) {
    _updateState((b) => b..activeDayFilter = dayFilter.toBuilder());
  }

  void _updateState(updates(HomeStateBuilder builder)) {
    _stateSubject.add(
      _stateSubject.value.rebuild(updates),
    );
  }
}
