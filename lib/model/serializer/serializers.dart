import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_app/model/child.dart';
import 'package:flutter_app/model/firend.dart';
import 'package:flutter_app/model/server/child_response.dart';
import 'package:flutter_app/model/server/emotions.dart';
import 'package:flutter_app/model/server/login_response.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  LoginResponse,
  ChildResponse,
  Emotions,
  Child,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

T deserialize<T>(dynamic value) =>
    serializers.deserializeWith<T>(serializers.serializerForType(T), value);

BuiltList<T> deserializeListOf<T>(dynamic value) => BuiltList.from(
    value.map((value) => deserialize<T>(value)).toList(growable: false));

dynamic serialize<T>(T value) =>
    serializers.serializeWith(serializers.serializerForType(T), value);

dynamic serializeIterable<T>(Iterable<T> value) =>
    value.map((value) => serialize<T>(value)).toList();
