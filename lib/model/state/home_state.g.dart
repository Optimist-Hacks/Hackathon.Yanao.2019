// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final String name;
  @override
  final String squad;
  @override
  final String km;
  @override
  final String actionDuration;
  @override
  final String energy;
  @override
  final String rating;
  @override
  final DayFilter activeDayFilter;
  @override
  final BuiltSet<ActivityItem> activityItems;
  @override
  final BuiltMap<Mood, double> moods;
  @override
  final BuiltSet<Friend> friends;

  factory _$HomeState([void Function(HomeStateBuilder) updates]) =>
      (new HomeStateBuilder()..update(updates)).build();

  _$HomeState._(
      {this.name,
      this.squad,
      this.km,
      this.actionDuration,
      this.energy,
      this.rating,
      this.activeDayFilter,
      this.activityItems,
      this.moods,
      this.friends})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('HomeState', 'name');
    }
    if (squad == null) {
      throw new BuiltValueNullFieldError('HomeState', 'squad');
    }
    if (km == null) {
      throw new BuiltValueNullFieldError('HomeState', 'km');
    }
    if (actionDuration == null) {
      throw new BuiltValueNullFieldError('HomeState', 'actionDuration');
    }
    if (energy == null) {
      throw new BuiltValueNullFieldError('HomeState', 'energy');
    }
    if (rating == null) {
      throw new BuiltValueNullFieldError('HomeState', 'rating');
    }
    if (activeDayFilter == null) {
      throw new BuiltValueNullFieldError('HomeState', 'activeDayFilter');
    }
    if (activityItems == null) {
      throw new BuiltValueNullFieldError('HomeState', 'activityItems');
    }
    if (moods == null) {
      throw new BuiltValueNullFieldError('HomeState', 'moods');
    }
    if (friends == null) {
      throw new BuiltValueNullFieldError('HomeState', 'friends');
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
        name == other.name &&
        squad == other.squad &&
        km == other.km &&
        actionDuration == other.actionDuration &&
        energy == other.energy &&
        rating == other.rating &&
        activeDayFilter == other.activeDayFilter &&
        activityItems == other.activityItems &&
        moods == other.moods &&
        friends == other.friends;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, name.hashCode), squad.hashCode),
                                    km.hashCode),
                                actionDuration.hashCode),
                            energy.hashCode),
                        rating.hashCode),
                    activeDayFilter.hashCode),
                activityItems.hashCode),
            moods.hashCode),
        friends.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeState')
          ..add('name', name)
          ..add('squad', squad)
          ..add('km', km)
          ..add('actionDuration', actionDuration)
          ..add('energy', energy)
          ..add('rating', rating)
          ..add('activeDayFilter', activeDayFilter)
          ..add('activityItems', activityItems)
          ..add('moods', moods)
          ..add('friends', friends))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _squad;
  String get squad => _$this._squad;
  set squad(String squad) => _$this._squad = squad;

  String _km;
  String get km => _$this._km;
  set km(String km) => _$this._km = km;

  String _actionDuration;
  String get actionDuration => _$this._actionDuration;
  set actionDuration(String actionDuration) =>
      _$this._actionDuration = actionDuration;

  String _energy;
  String get energy => _$this._energy;
  set energy(String energy) => _$this._energy = energy;

  String _rating;
  String get rating => _$this._rating;
  set rating(String rating) => _$this._rating = rating;

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

  MapBuilder<Mood, double> _moods;
  MapBuilder<Mood, double> get moods =>
      _$this._moods ??= new MapBuilder<Mood, double>();
  set moods(MapBuilder<Mood, double> moods) => _$this._moods = moods;

  SetBuilder<Friend> _friends;
  SetBuilder<Friend> get friends =>
      _$this._friends ??= new SetBuilder<Friend>();
  set friends(SetBuilder<Friend> friends) => _$this._friends = friends;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _squad = _$v.squad;
      _km = _$v.km;
      _actionDuration = _$v.actionDuration;
      _energy = _$v.energy;
      _rating = _$v.rating;
      _activeDayFilter = _$v.activeDayFilter?.toBuilder();
      _activityItems = _$v.activityItems?.toBuilder();
      _moods = _$v.moods?.toBuilder();
      _friends = _$v.friends?.toBuilder();
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
              name: name,
              squad: squad,
              km: km,
              actionDuration: actionDuration,
              energy: energy,
              rating: rating,
              activeDayFilter: activeDayFilter.build(),
              activityItems: activityItems.build(),
              moods: moods.build(),
              friends: friends.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activeDayFilter';
        activeDayFilter.build();
        _$failedField = 'activityItems';
        activityItems.build();
        _$failedField = 'moods';
        moods.build();
        _$failedField = 'friends';
        friends.build();
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
