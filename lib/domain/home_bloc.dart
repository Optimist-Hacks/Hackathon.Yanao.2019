import 'package:flutter_app/model/activity_item.dart';
import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/state/home_state.dart';
import 'package:flutter_app/ui/berezka_icons.dart';
import 'package:rxdart/rxdart.dart';
import 'package:built_collection/built_collection.dart';

class HomeBloc {
  final _stateSubject = BehaviorSubject<HomeState>();
  HomeState initState;

  Stream<HomeState> get state => _stateSubject;

  HomeBloc() {
    initState = HomeState((b) => b
      ..activeDayFilter = DayFilter.day.toBuilder()
      ..activityItems = BuiltSet<ActivityItem>([
        ActivityItem((b) => b
          ..icon = BerezkaIcons.basketball
          ..name = "Сейчас играет в баскетбол"
          ..duration = "30-45 минут")
      ]).toBuilder());
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
