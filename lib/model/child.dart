import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'child.g.dart';

abstract class Child implements Built<Child, ChildBuilder> {
  static Serializer<Child> get serializer => _$childSerializer;

  String get id;

  int get photoCount;

  Child._();

  factory Child([void Function(ChildBuilder) updates]) = _$Child;
}
