// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_filter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DayFilter> _$dayFilterSerializer = new _$DayFilterSerializer();

class _$DayFilterSerializer implements StructuredSerializer<DayFilter> {
  @override
  final Iterable<Type> types = const [DayFilter, _$DayFilter];
  @override
  final String wireName = 'DayFilter';

  @override
  Iterable<Object> serialize(Serializers serializers, DayFilter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DayFilter deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DayFilterBuilder();

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
      }
    }

    return result.build();
  }
}

class _$DayFilter extends DayFilter {
  @override
  final int value;
  @override
  final String name;

  factory _$DayFilter([void Function(DayFilterBuilder) updates]) =>
      (new DayFilterBuilder()..update(updates)).build();

  _$DayFilter._({this.value, this.name}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('DayFilter', 'value');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('DayFilter', 'name');
    }
  }

  @override
  DayFilter rebuild(void Function(DayFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DayFilterBuilder toBuilder() => new DayFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DayFilter && value == other.value && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, value.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DayFilter')
          ..add('value', value)
          ..add('name', name))
        .toString();
  }
}

class DayFilterBuilder implements Builder<DayFilter, DayFilterBuilder> {
  _$DayFilter _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  DayFilterBuilder();

  DayFilterBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DayFilter other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DayFilter;
  }

  @override
  void update(void Function(DayFilterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DayFilter build() {
    final _$result = _$v ?? new _$DayFilter._(value: value, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
