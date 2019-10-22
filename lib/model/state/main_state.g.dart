// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MainState extends MainState {
  @override
  final DayFilter activeDayFilter;

  factory _$MainState([void Function(MainStateBuilder) updates]) =>
      (new MainStateBuilder()..update(updates)).build();

  _$MainState._({this.activeDayFilter}) : super._() {
    if (activeDayFilter == null) {
      throw new BuiltValueNullFieldError('MainState', 'activeDayFilter');
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
    return other is MainState && activeDayFilter == other.activeDayFilter;
  }

  @override
  int get hashCode {
    return $jf($jc(0, activeDayFilter.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MainState')
          ..add('activeDayFilter', activeDayFilter))
        .toString();
  }
}

class MainStateBuilder implements Builder<MainState, MainStateBuilder> {
  _$MainState _$v;

  DayFilterBuilder _activeDayFilter;
  DayFilterBuilder get activeDayFilter =>
      _$this._activeDayFilter ??= new DayFilterBuilder();
  set activeDayFilter(DayFilterBuilder activeDayFilter) =>
      _$this._activeDayFilter = activeDayFilter;

  MainStateBuilder();

  MainStateBuilder get _$this {
    if (_$v != null) {
      _activeDayFilter = _$v.activeDayFilter?.toBuilder();
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
      _$result =
          _$v ?? new _$MainState._(activeDayFilter: activeDayFilter.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activeDayFilter';
        activeDayFilter.build();
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
