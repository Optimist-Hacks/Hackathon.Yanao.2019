import 'package:built_value/built_value.dart';
import 'package:flutter_app/model/navigation_item.dart';

part 'main_state.g.dart';

abstract class MainState implements Built<MainState, MainStateBuilder> {
  NavigationItem get activeNavigationItem;

  MainState._();

  factory MainState([void Function(MainStateBuilder) updates]) = _$MainState;
}
