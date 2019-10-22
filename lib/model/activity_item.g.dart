// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActivityItem> _$activityItemSerializer =
    new _$ActivityItemSerializer();

class _$ActivityItemSerializer implements StructuredSerializer<ActivityItem> {
  @override
  final Iterable<Type> types = const [ActivityItem, _$ActivityItem];
  @override
  final String wireName = 'ActivityItem';

  @override
  Iterable<Object> serialize(Serializers serializers, ActivityItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'duration',
      serializers.serialize(object.duration,
          specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(Color)),
    ];

    return result;
  }

  @override
  ActivityItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityItemBuilder();

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
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(Color)) as Color;
          break;
      }
    }

    return result.build();
  }
}

class _$ActivityItem extends ActivityItem {
  @override
  final int value;
  @override
  final String icon;
  @override
  final String name;
  @override
  final String duration;
  @override
  final Color color;

  factory _$ActivityItem([void Function(ActivityItemBuilder) updates]) =>
      (new ActivityItemBuilder()..update(updates)).build();

  _$ActivityItem._(
      {this.value, this.icon, this.name, this.duration, this.color})
      : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('ActivityItem', 'value');
    }
    if (icon == null) {
      throw new BuiltValueNullFieldError('ActivityItem', 'icon');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('ActivityItem', 'name');
    }
    if (duration == null) {
      throw new BuiltValueNullFieldError('ActivityItem', 'duration');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('ActivityItem', 'color');
    }
  }

  @override
  ActivityItem rebuild(void Function(ActivityItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityItemBuilder toBuilder() => new ActivityItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityItem &&
        value == other.value &&
        icon == other.icon &&
        name == other.name &&
        duration == other.duration &&
        color == other.color;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, value.hashCode), icon.hashCode), name.hashCode),
            duration.hashCode),
        color.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActivityItem')
          ..add('value', value)
          ..add('icon', icon)
          ..add('name', name)
          ..add('duration', duration)
          ..add('color', color))
        .toString();
  }
}

class ActivityItemBuilder
    implements Builder<ActivityItem, ActivityItemBuilder> {
  _$ActivityItem _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  String _icon;
  String get icon => _$this._icon;
  set icon(String icon) => _$this._icon = icon;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _duration;
  String get duration => _$this._duration;
  set duration(String duration) => _$this._duration = duration;

  Color _color;
  Color get color => _$this._color;
  set color(Color color) => _$this._color = color;

  ActivityItemBuilder();

  ActivityItemBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _icon = _$v.icon;
      _name = _$v.name;
      _duration = _$v.duration;
      _color = _$v.color;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ActivityItem;
  }

  @override
  void update(void Function(ActivityItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ActivityItem build() {
    final _$result = _$v ??
        new _$ActivityItem._(
            value: value,
            icon: icon,
            name: name,
            duration: duration,
            color: color);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
