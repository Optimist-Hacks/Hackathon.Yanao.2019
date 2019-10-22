// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Child> _$childSerializer = new _$ChildSerializer();

class _$ChildSerializer implements StructuredSerializer<Child> {
  @override
  final Iterable<Type> types = const [Child, _$Child];
  @override
  final String wireName = 'Child';

  @override
  Iterable<Object> serialize(Serializers serializers, Child object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'photoCount',
      serializers.serialize(object.photoCount,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Child deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChildBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoCount':
          result.photoCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Child extends Child {
  @override
  final String id;
  @override
  final int photoCount;

  factory _$Child([void Function(ChildBuilder) updates]) =>
      (new ChildBuilder()..update(updates)).build();

  _$Child._({this.id, this.photoCount}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Child', 'id');
    }
    if (photoCount == null) {
      throw new BuiltValueNullFieldError('Child', 'photoCount');
    }
  }

  @override
  Child rebuild(void Function(ChildBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChildBuilder toBuilder() => new ChildBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Child && id == other.id && photoCount == other.photoCount;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), photoCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Child')
          ..add('id', id)
          ..add('photoCount', photoCount))
        .toString();
  }
}

class ChildBuilder implements Builder<Child, ChildBuilder> {
  _$Child _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  int _photoCount;
  int get photoCount => _$this._photoCount;
  set photoCount(int photoCount) => _$this._photoCount = photoCount;

  ChildBuilder();

  ChildBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _photoCount = _$v.photoCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Child other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Child;
  }

  @override
  void update(void Function(ChildBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Child build() {
    final _$result = _$v ?? new _$Child._(id: id, photoCount: photoCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
