import 'package:flutter_app/model/state/camera_state.dart';
import 'package:rxdart/rxdart.dart';

class CameraBloc {
  final _stateSubject = BehaviorSubject<CameraState>();
  CameraState initState;

  Stream<CameraState> get state => _stateSubject;

  CameraBloc() {
    initState = CameraState((b) => b
      ..photoCount = 0
      ..processing = false);
    _stateSubject.add(initState);
  }

  void increasePhoto() {
    _updateState((b) => b..photoCount = _stateSubject.value.photoCount + 1);
  }

  void setProcessing(bool processing) {
    _updateState((b) => b..processing = processing);
  }

  void _updateState(updates(CameraStateBuilder builder)) {
    _stateSubject.add(_stateSubject.value.rebuild(updates));
  }
}
