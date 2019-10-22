import 'package:flutter_app/model/state/login_state.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _stateSubject = BehaviorSubject<LoginState>();
  LoginState initState;

  Stream<LoginState> get state => _stateSubject;

  LoginBloc() {
    initState = LoginState((b) => b..buttonEnabled = false);
    _stateSubject.add(initState);
  }

  void onChangeTokenLength(int length) {
    _updateState((b) => b..buttonEnabled = length > 1);
  }

  void _updateState(updates(LoginStateBuilder builder)) {
    _stateSubject.add(_stateSubject.value.rebuild(updates));
  }
}
