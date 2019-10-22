// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ScheduleState extends ScheduleState {
  @override
  final DayFilter activeDayFilter;

  factory _$ScheduleState([void Function(ScheduleStateBuilder) updates]) =>
      (new ScheduleStateBuilder()..update(updates)).build();

  _$ScheduleState._({this.activeDayFilter}) : super._() {
    if (activeDayFilter == null) {
      throw new BuiltValueNullFieldError('ScheduleState', 'activeDayFilter');
    }
  }

  @override
  ScheduleState rebuild(void Function(ScheduleStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleStateBuilder toBuilder() => new ScheduleStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleState && activeDayFilter == other.activeDayFilter;
  }

  @override
  int get hashCode {
    return $jf($jc(0, activeDayFilter.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ScheduleState')
          ..add('activeDayFilter', activeDayFilter))
        .toString();
  }
}

class ScheduleStateBuilder
    implements Builder<ScheduleState, ScheduleStateBuilder> {
  _$ScheduleState _$v;

  DayFilterBuilder _activeDayFilter;
  DayFilterBuilder get activeDayFilter =>
      _$this._activeDayFilter ??= new DayFilterBuilder();
  set activeDayFilter(DayFilterBuilder activeDayFilter) =>
      _$this._activeDayFilter = activeDayFilter;

  ScheduleStateBuilder();

  ScheduleStateBuilder get _$this {
    if (_$v != null) {
      _activeDayFilter = _$v.activeDayFilter?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduleState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ScheduleState;
  }

  @override
  void update(void Function(ScheduleStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ScheduleState build() {
    _$ScheduleState _$result;
    try {
      _$result = _$v ??
          new _$ScheduleState._(activeDayFilter: activeDayFilter.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activeDayFilter';
        activeDayFilter.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ScheduleState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
