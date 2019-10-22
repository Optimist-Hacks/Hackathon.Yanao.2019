// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Mood> _$moodSerializer = new _$MoodSerializer();

class _$MoodSerializer implements StructuredSerializer<Mood> {
  @override
  final Iterable<Type> types = const [Mood, _$Mood];
  @override
  final String wireName = 'Mood';

  @override
  Iterable<Object> serialize(Serializers serializers, Mood object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(Color)),
    ];

    return result;
  }

  @override
  Mood deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoodBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'path':
          result.path = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(Color)) as Color;
          break;
      }
    }

    return result.build();
  }
}

class _$Mood extends Mood {
  @override
  final int value;
  @override
  final String name;
  @override
  final String path;
  @override
  final Color color;

  factory _$Mood([void Function(MoodBuilder) updates]) =>
      (new MoodBuilder()..update(updates)).build();

  _$Mood._({this.value, this.name, this.path, this.color}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('Mood', 'value');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Mood', 'name');
    }
    if (path == null) {
      throw new BuiltValueNullFieldError('Mood', 'path');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('Mood', 'color');
    }
  }

  @override
  Mood rebuild(void Function(MoodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoodBuilder toBuilder() => new MoodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Mood &&
        value == other.value &&
        name == other.name &&
        path == other.path &&
        color == other.color;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, value.hashCode), name.hashCode), path.hashCode),
        color.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Mood')
          ..add('value', value)
          ..add('name', name)
          ..add('path', path)
          ..add('color', color))
        .toString();
  }
}

class MoodBuilder implements Builder<Mood, MoodBuilder> {
  _$Mood _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _path;
  String get path => _$this._path;
  set path(String path) => _$this._path = path;

  Color _color;
  Color get color => _$this._color;
  set color(Color color) => _$this._color = color;

  MoodBuilder();

  MoodBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _name = _$v.name;
      _path = _$v.path;
      _color = _$v.color;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Mood other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Mood;
  }

  @override
  void update(void Function(MoodBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Mood build() {
    final _$result =
        _$v ?? new _$Mood._(value: value, name: name, path: path, color: color);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
