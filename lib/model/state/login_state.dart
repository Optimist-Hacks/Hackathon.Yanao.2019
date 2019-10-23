import 'package:built_value/built_value.dart';
import 'package:flutter_app/model/navigation_item.dart';

part 'login_state.g.dart';

abstract class LoginState implements Built<LoginState, LoginStateBuilder> {
  bool get buttonEnabled;

  bool get processing;

  LoginState._();

  factory LoginState([void Function(LoginStateBuilder) updates]) = _$LoginState;
}
