// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginState extends LoginState {
  @override
  final bool buttonEnabled;
  @override
  final bool processing;

  factory _$LoginState([void Function(LoginStateBuilder) updates]) =>
      (new LoginStateBuilder()..update(updates)).build();

  _$LoginState._({this.buttonEnabled, this.processing}) : super._() {
    if (buttonEnabled == null) {
      throw new BuiltValueNullFieldError('LoginState', 'buttonEnabled');
    }
    if (processing == null) {
      throw new BuiltValueNullFieldError('LoginState', 'processing');
    }
  }

  @override
  LoginState rebuild(void Function(LoginStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginStateBuilder toBuilder() => new LoginStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginState &&
        buttonEnabled == other.buttonEnabled &&
        processing == other.processing;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, buttonEnabled.hashCode), processing.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginState')
          ..add('buttonEnabled', buttonEnabled)
          ..add('processing', processing))
        .toString();
  }
}

class LoginStateBuilder implements Builder<LoginState, LoginStateBuilder> {
  _$LoginState _$v;

  bool _buttonEnabled;
  bool get buttonEnabled => _$this._buttonEnabled;
  set buttonEnabled(bool buttonEnabled) =>
      _$this._buttonEnabled = buttonEnabled;

  bool _processing;
  bool get processing => _$this._processing;
  set processing(bool processing) => _$this._processing = processing;

  LoginStateBuilder();

  LoginStateBuilder get _$this {
    if (_$v != null) {
      _buttonEnabled = _$v.buttonEnabled;
      _processing = _$v.processing;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginState;
  }

  @override
  void update(void Function(LoginStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginState build() {
    final _$result = _$v ??
        new _$LoginState._(
            buttonEnabled: buttonEnabled, processing: processing);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
