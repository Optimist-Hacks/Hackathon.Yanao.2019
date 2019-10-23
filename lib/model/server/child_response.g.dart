// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChildResponse> _$childResponseSerializer =
    new _$ChildResponseSerializer();

class _$ChildResponseSerializer implements StructuredSerializer<ChildResponse> {
  @override
  final Iterable<Type> types = const [ChildResponse, _$ChildResponse];
  @override
  final String wireName = 'ChildResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, ChildResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'actionDuration',
      serializers.serialize(object.actionDuration,
          specifiedType: const FullType(int)),
      'actionTimetable',
      serializers.serialize(object.actionTimetable,
          specifiedType: const FullType(BuiltSet, const [const FullType(int)])),
      'bestFriends',
      serializers.serialize(object.bestFriends,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(Friend)])),
      'distance',
      serializers.serialize(object.distance,
          specifiedType: const FullType(int)),
      'emotions',
      serializers.serialize(object.emotions,
          specifiedType: const FullType(Emotions)),
      'energy',
      serializers.serialize(object.energy, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'photoUrl',
      serializers.serialize(object.photoUrl,
          specifiedType: const FullType(String)),
      'rating',
      serializers.serialize(object.rating, specifiedType: const FullType(int)),
      'squad',
      serializers.serialize(object.squad,
          specifiedType: const FullType(String)),
    ];
    if (object.lastPhotos != null) {
      result
        ..add('lastPhotos')
        ..add(serializers.serialize(object.lastPhotos,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(String)])));
    }
    return result;
  }

  @override
  ChildResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChildResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'actionDuration':
          result.actionDuration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'actionTimetable':
          result.actionTimetable.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(int)]))
              as BuiltSet<dynamic>);
          break;
        case 'bestFriends':
          result.bestFriends.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(Friend)]))
              as BuiltSet<dynamic>);
          break;
        case 'distance':
          result.distance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'emotions':
          result.emotions.replace(serializers.deserialize(value,
              specifiedType: const FullType(Emotions)) as Emotions);
          break;
        case 'energy':
          result.energy = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'squad':
          result.squad = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastPhotos':
          result.lastPhotos.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))
              as BuiltSet<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$ChildResponse extends ChildResponse {
  @override
  final int actionDuration;
  @override
  final BuiltSet<int> actionTimetable;
  @override
  final BuiltSet<Friend> bestFriends;
  @override
  final int distance;
  @override
  final Emotions emotions;
  @override
  final int energy;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final int rating;
  @override
  final String squad;
  @override
  final BuiltSet<String> lastPhotos;

  factory _$ChildResponse([void Function(ChildResponseBuilder) updates]) =>
      (new ChildResponseBuilder()..update(updates)).build();

  _$ChildResponse._(
      {this.actionDuration,
      this.actionTimetable,
      this.bestFriends,
      this.distance,
      this.emotions,
      this.energy,
      this.name,
      this.photoUrl,
      this.rating,
      this.squad,
      this.lastPhotos})
      : super._() {
    if (actionDuration == null) {
      throw new BuiltValueNullFieldError('ChildResponse', 'actionDuration');
    }
    if (actionTimetable == null) {
      throw new BuiltValueNullFieldError('ChildResponse', 'actionTimetable');
    }
    if (bestFriends == null) {
      throw new BuiltValueNullFieldError('ChildResponse', 'bestFriends');
    }
    if (distance == null) {
      throw new BuiltValueNullFieldError('ChildResponse', 'distance');
    }
    if (emotions == null) {
      throw new BuiltValueNullFieldError('ChildResponse', 'emotions');
    }
    if (energy == null) {
      throw new BuiltValueNullFieldError('ChildResponse', 'energy');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('ChildResponse', 'name');
    }
    if (photoUrl == null) {
      throw new BuiltValueNullFieldError('ChildResponse', 'photoUrl');
    }
    if (rating == null) {
      throw new BuiltValueNullFieldError('ChildResponse', 'rating');
    }
    if (squad == null) {
      throw new BuiltValueNullFieldError('ChildResponse', 'squad');
    }
  }

  @override
  ChildResponse rebuild(void Function(ChildResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChildResponseBuilder toBuilder() => new ChildResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChildResponse &&
        actionDuration == other.actionDuration &&
        actionTimetable == other.actionTimetable &&
        bestFriends == other.bestFriends &&
        distance == other.distance &&
        emotions == other.emotions &&
        energy == other.energy &&
        name == other.name &&
        photoUrl == other.photoUrl &&
        rating == other.rating &&
        squad == other.squad &&
        lastPhotos == other.lastPhotos;
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
                                $jc(
                                    $jc(
                                        $jc($jc(0, actionDuration.hashCode),
                                            actionTimetable.hashCode),
                                        bestFriends.hashCode),
                                    distance.hashCode),
                                emotions.hashCode),
                            energy.hashCode),
                        name.hashCode),
                    photoUrl.hashCode),
                rating.hashCode),
            squad.hashCode),
        lastPhotos.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChildResponse')
          ..add('actionDuration', actionDuration)
          ..add('actionTimetable', actionTimetable)
          ..add('bestFriends', bestFriends)
          ..add('distance', distance)
          ..add('emotions', emotions)
          ..add('energy', energy)
          ..add('name', name)
          ..add('photoUrl', photoUrl)
          ..add('rating', rating)
          ..add('squad', squad)
          ..add('lastPhotos', lastPhotos))
        .toString();
  }
}

class ChildResponseBuilder
    implements Builder<ChildResponse, ChildResponseBuilder> {
  _$ChildResponse _$v;

  int _actionDuration;
  int get actionDuration => _$this._actionDuration;
  set actionDuration(int actionDuration) =>
      _$this._actionDuration = actionDuration;

  SetBuilder<int> _actionTimetable;
  SetBuilder<int> get actionTimetable =>
      _$this._actionTimetable ??= new SetBuilder<int>();
  set actionTimetable(SetBuilder<int> actionTimetable) =>
      _$this._actionTimetable = actionTimetable;

  SetBuilder<Friend> _bestFriends;
  SetBuilder<Friend> get bestFriends =>
      _$this._bestFriends ??= new SetBuilder<Friend>();
  set bestFriends(SetBuilder<Friend> bestFriends) =>
      _$this._bestFriends = bestFriends;

  int _distance;
  int get distance => _$this._distance;
  set distance(int distance) => _$this._distance = distance;

  EmotionsBuilder _emotions;
  EmotionsBuilder get emotions => _$this._emotions ??= new EmotionsBuilder();
  set emotions(EmotionsBuilder emotions) => _$this._emotions = emotions;

  int _energy;
  int get energy => _$this._energy;
  set energy(int energy) => _$this._energy = energy;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  int _rating;
  int get rating => _$this._rating;
  set rating(int rating) => _$this._rating = rating;

  String _squad;
  String get squad => _$this._squad;
  set squad(String squad) => _$this._squad = squad;

  SetBuilder<String> _lastPhotos;
  SetBuilder<String> get lastPhotos =>
      _$this._lastPhotos ??= new SetBuilder<String>();
  set lastPhotos(SetBuilder<String> lastPhotos) =>
      _$this._lastPhotos = lastPhotos;

  ChildResponseBuilder();

  ChildResponseBuilder get _$this {
    if (_$v != null) {
      _actionDuration = _$v.actionDuration;
      _actionTimetable = _$v.actionTimetable?.toBuilder();
      _bestFriends = _$v.bestFriends?.toBuilder();
      _distance = _$v.distance;
      _emotions = _$v.emotions?.toBuilder();
      _energy = _$v.energy;
      _name = _$v.name;
      _photoUrl = _$v.photoUrl;
      _rating = _$v.rating;
      _squad = _$v.squad;
      _lastPhotos = _$v.lastPhotos?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChildResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChildResponse;
  }

  @override
  void update(void Function(ChildResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChildResponse build() {
    _$ChildResponse _$result;
    try {
      _$result = _$v ??
          new _$ChildResponse._(
              actionDuration: actionDuration,
              actionTimetable: actionTimetable.build(),
              bestFriends: bestFriends.build(),
              distance: distance,
              emotions: emotions.build(),
              energy: energy,
              name: name,
              photoUrl: photoUrl,
              rating: rating,
              squad: squad,
              lastPhotos: _lastPhotos?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'actionTimetable';
        actionTimetable.build();
        _$failedField = 'bestFriends';
        bestFriends.build();

        _$failedField = 'emotions';
        emotions.build();

        _$failedField = 'lastPhotos';
        _lastPhotos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChildResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
