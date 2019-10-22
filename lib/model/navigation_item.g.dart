// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NavigationItem> _$navigationItemSerializer =
    new _$NavigationItemSerializer();

class _$NavigationItemSerializer
    implements StructuredSerializer<NavigationItem> {
  @override
  final Iterable<Type> types = const [NavigationItem, _$NavigationItem];
  @override
  final String wireName = 'NavigationItem';

  @override
  Iterable<Object> serialize(Serializers serializers, NavigationItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NavigationItem deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NavigationItemBuilder();

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
      }
    }

    return result.build();
  }
}

class _$NavigationItem extends NavigationItem {
  @override
  final int value;
  @override
  final String icon;

  factory _$NavigationItem([void Function(NavigationItemBuilder) updates]) =>
      (new NavigationItemBuilder()..update(updates)).build();

  _$NavigationItem._({this.value, this.icon}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('NavigationItem', 'value');
    }
    if (icon == null) {
      throw new BuiltValueNullFieldError('NavigationItem', 'icon');
    }
  }

  @override
  NavigationItem rebuild(void Function(NavigationItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationItemBuilder toBuilder() =>
      new NavigationItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationItem &&
        value == other.value &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, value.hashCode), icon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationItem')
          ..add('value', value)
          ..add('icon', icon))
        .toString();
  }
}

class NavigationItemBuilder
    implements Builder<NavigationItem, NavigationItemBuilder> {
  _$NavigationItem _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  String _icon;
  String get icon => _$this._icon;
  set icon(String icon) => _$this._icon = icon;

  NavigationItemBuilder();

  NavigationItemBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _icon = _$v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigationItem;
  }

  @override
  void update(void Function(NavigationItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigationItem build() {
    final _$result = _$v ?? new _$NavigationItem._(value: value, icon: icon);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
