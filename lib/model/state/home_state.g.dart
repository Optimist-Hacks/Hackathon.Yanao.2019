// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final DayFilter activeDayFilter;
  @override
  final BuiltSet<ActivityItem> activityItems;

  factory _$HomeState([void Function(HomeStateBuilder) updates]) =>
      (new HomeStateBuilder()..update(updates)).build();

  _$HomeState._({this.activeDayFilter, this.activityItems}) : super._() {
    if (activeDayFilter == null) {
      throw new BuiltValueNullFieldError('HomeState', 'activeDayFilter');
    }
    if (activityItems == null) {
      throw new BuiltValueNullFieldError('HomeState', 'activityItems');
    }
  }

  @override
  HomeState rebuild(void Function(HomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStateBuilder toBuilder() => new HomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeState &&
        activeDayFilter == other.activeDayFilter &&
        activityItems == other.activityItems;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, activeDayFilter.hashCode), activityItems.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeState')
          ..add('activeDayFilter', activeDayFilter)
          ..add('activityItems', activityItems))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState _$v;

  DayFilterBuilder _activeDayFilter;
  DayFilterBuilder get activeDayFilter =>
      _$this._activeDayFilter ??= new DayFilterBuilder();
  set activeDayFilter(DayFilterBuilder activeDayFilter) =>
      _$this._activeDayFilter = activeDayFilter;

  SetBuilder<ActivityItem> _activityItems;
  SetBuilder<ActivityItem> get activityItems =>
      _$this._activityItems ??= new SetBuilder<ActivityItem>();
  set activityItems(SetBuilder<ActivityItem> activityItems) =>
      _$this._activityItems = activityItems;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    if (_$v != null) {
      _activeDayFilter = _$v.activeDayFilter?.toBuilder();
      _activityItems = _$v.activityItems?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomeState build() {
    _$HomeState _$result;
    try {
      _$result = _$v ??
          new _$HomeState._(
              activeDayFilter: activeDayFilter.build(),
              activityItems: activityItems.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activeDayFilter';
        activeDayFilter.build();
        _$failedField = 'activityItems';
        activityItems.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HomeState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
