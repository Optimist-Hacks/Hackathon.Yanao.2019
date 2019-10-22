import 'package:built_value/built_value.dart';
import 'package:flutter_app/model/navigation_item.dart';

part 'camera_state.g.dart';

abstract class CameraState implements Built<CameraState, CameraStateBuilder> {
  int get photoCount;

  bool get processing;

  CameraState._();

  factory CameraState([void Function(CameraStateBuilder) updates]) =
      _$CameraState;
}
