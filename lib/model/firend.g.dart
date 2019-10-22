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
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'photoUrl',
      serializers.serialize(object.photoUrl,
          specifiedType: const FullType(String)),
      'timeTogether',
      serializers.serialize(object.timeTogether,
          specifiedType: const FullType(double)),
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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timeTogether':
          result.timeTogether = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$Friend extends Friend {
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final double timeTogether;

  factory _$Friend([void Function(FriendBuilder) updates]) =>
      (new FriendBuilder()..update(updates)).build();

  _$Friend._({this.name, this.photoUrl, this.timeTogether}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Friend', 'name');
    }
    if (photoUrl == null) {
      throw new BuiltValueNullFieldError('Friend', 'photoUrl');
    }
    if (timeTogether == null) {
      throw new BuiltValueNullFieldError('Friend', 'timeTogether');
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
        name == other.name &&
        photoUrl == other.photoUrl &&
        timeTogether == other.timeTogether;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, name.hashCode), photoUrl.hashCode), timeTogether.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Friend')
          ..add('name', name)
          ..add('photoUrl', photoUrl)
          ..add('timeTogether', timeTogether))
        .toString();
  }
}

class FriendBuilder implements Builder<Friend, FriendBuilder> {
  _$Friend _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  double _timeTogether;
  double get timeTogether => _$this._timeTogether;
  set timeTogether(double timeTogether) => _$this._timeTogether = timeTogether;

  FriendBuilder();

  FriendBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _photoUrl = _$v.photoUrl;
      _timeTogether = _$v.timeTogether;
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
    final _$result = _$v ??
        new _$Friend._(
            name: name, photoUrl: photoUrl, timeTogether: timeTogether);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
