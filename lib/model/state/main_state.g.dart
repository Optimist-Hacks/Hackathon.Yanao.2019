// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MainState extends MainState {
  @override
  final NavigationItem activeNavigationItem;

  factory _$MainState([void Function(MainStateBuilder) updates]) =>
      (new MainStateBuilder()..update(updates)).build();

  _$MainState._({this.activeNavigationItem}) : super._() {
    if (activeNavigationItem == null) {
      throw new BuiltValueNullFieldError('MainState', 'activeNavigationItem');
    }
  }

  @override
  MainState rebuild(void Function(MainStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainStateBuilder toBuilder() => new MainStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainState &&
        activeNavigationItem == other.activeNavigationItem;
  }

  @override
  int get hashCode {
    return $jf($jc(0, activeNavigationItem.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MainState')
          ..add('activeNavigationItem', activeNavigationItem))
        .toString();
  }
}

class MainStateBuilder implements Builder<MainState, MainStateBuilder> {
  _$MainState _$v;

  NavigationItemBuilder _activeNavigationItem;
  NavigationItemBuilder get activeNavigationItem =>
      _$this._activeNavigationItem ??= new NavigationItemBuilder();
  set activeNavigationItem(NavigationItemBuilder activeNavigationItem) =>
      _$this._activeNavigationItem = activeNavigationItem;

  MainStateBuilder();

  MainStateBuilder get _$this {
    if (_$v != null) {
      _activeNavigationItem = _$v.activeNavigationItem?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MainState;
  }

  @override
  void update(void Function(MainStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MainState build() {
    _$MainState _$result;
    try {
      _$result = _$v ??
          new _$MainState._(activeNavigationItem: activeNavigationItem.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activeNavigationItem';
        activeNavigationItem.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MainState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
