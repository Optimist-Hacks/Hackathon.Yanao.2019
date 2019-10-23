import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_app/model/firend.dart';
import 'package:flutter_app/model/server/emotions.dart';

part 'child_response.g.dart';

abstract class ChildResponse
    implements Built<ChildResponse, ChildResponseBuilder> {
  static Serializer<ChildResponse> get serializer => _$childResponseSerializer;

  int get actionDuration;

  BuiltSet<int> get actionTimetable;

  BuiltSet<Friend> get bestFriends;

  int get distance;

  Emotions get emotions;

  int get energy;

  String get name;

  String get photoUrl;

  int get rating;

  String get squad;

  @nullable
  BuiltSet<String> get lastPhotos;

  ChildResponse._();

  factory ChildResponse([void Function(ChildResponseBuilder) updates]) =
      _$ChildResponse;
}
