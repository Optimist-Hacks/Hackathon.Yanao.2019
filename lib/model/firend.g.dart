// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firend.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Friend> _$friendSerializer = new _$FriendSerializer();

class _$FriendSerializer implements StructuredSerializer<Friend> {
  @override
  final Iterable<Type> types = const [Friend, _$Friend];
  @override
  final String wireName = 'Friend';

  @override
  Iterable<Object> serialize(Serializers serializers, Friend object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'duration',
      serializers.serialize(object.duration,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Friend deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FriendBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Friend extends Friend {
  @override
  final String icon;
  @override
  final String name;
  @override
  final String duration;

  factory _$Friend([void Function(FriendBuilder) updates]) =>
      (new FriendBuilder()..update(updates)).build();

  _$Friend._({this.icon, this.name, this.duration}) : super._() {
    if (icon == null) {
      throw new BuiltValueNullFieldError('Friend', 'icon');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Friend', 'name');
    }
    if (duration == null) {
      throw new BuiltValueNullFieldError('Friend', 'duration');
    }
  }

  @override
  Friend rebuild(void Function(FriendBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FriendBuilder toBuilder() => new FriendBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Friend &&
        icon == other.icon &&
        name == other.name &&
        duration == other.duration;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, icon.hashCode), name.hashCode), duration.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Friend')
          ..add('icon', icon)
          ..add('name', name)
          ..add('duration', duration))
        .toString();
  }
}

class FriendBuilder implements Builder<Friend, FriendBuilder> {
  _$Friend _$v;

  String _icon;
  String get icon => _$this._icon;
  set icon(String icon) => _$this._icon = icon;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _duration;
  String get duration => _$this._duration;
  set duration(String duration) => _$this._duration = duration;

  FriendBuilder();

  FriendBuilder get _$this {
    if (_$v != null) {
      _icon = _$v.icon;
      _name = _$v.name;
      _duration = _$v.duration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Friend other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Friend;
  }

  @override
  void update(void Function(FriendBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Friend build() {
    final _$result =
        _$v ?? new _$Friend._(icon: icon, name: name, duration: duration);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
