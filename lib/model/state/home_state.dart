import 'package:built_value/built_value.dart';
import 'package:flutter_app/model/activity_item.dart';
import 'package:flutter_app/model/day_filter.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_app/model/firend.dart';
import 'package:flutter_app/model/mood.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  String get photoUrl;

  String get name;

  String get squad;

  String get km;

  String get actionDuration;

  String get energy;

  String get rating;

  DayFilter get activeDayFilter;

  BuiltSet<ActivityItem> get activityItems;

  BuiltMap<Mood, int> get moods;

  BuiltSet<Friend> get friends;

  BuiltSet<String> get lastPhotos;

  HomeState._();

  factory HomeState([void Function(HomeStateBuilder) updates]) = _$HomeState;
}
