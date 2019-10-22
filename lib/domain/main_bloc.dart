import 'package:flutter_app/model/navigation_item.dart';
import 'package:flutter_app/model/state/main_state.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc {
  final _stateSubject = BehaviorSubject<MainState>();
  MainState initState;

  Stream<MainState> get state => _stateSubject;

  MainBloc() {
    initState = MainState(
      (b) => b..activeNavigationItem = NavigationItem.home.toBuilder(),
    );
    _stateSubject.add(initState);
  }

  void onClickNavigation(int index) {
    _updateState((b) =>
        b..activeNavigationItem = NavigationItem.fromValue(index).toBuilder());
  }

  void _updateState(updates(MainStateBuilder builder)) {
    _stateSubject.add(
      _stateSubject.value.rebuild(updates),
    );
  }
}
