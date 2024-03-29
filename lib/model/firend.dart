import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'firend.g.dart';

abstract class Friend implements Built<Friend, FriendBuilder> {
  static Serializer<Friend> get serializer => _$friendSerializer;

  String get name;

  String get photoUrl;

  double get timeTogether;

  Friend._();

  factory Friend([void Function(FriendBuilder) updates]) = _$Friend;
}
