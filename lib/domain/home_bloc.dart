import 'package:flutter_app/model/activity_item.dart';
import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/firend.dart';
import 'package:flutter_app/model/mood.dart';
import 'package:flutter_app/model/server/child_response.dart';
import 'package:flutter_app/model/state/home_state.dart';
import 'package:flutter_app/service/api_service.dart';
import 'package:flutter_app/service/preferences_service.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:built_collection/built_collection.dart';

const _tag = "home_bloc";

class HomeBloc {
  final _stateSubject = BehaviorSubject<HomeState>();
  final ApiService _apiService;
  final PreferencesService _preferencesService;
  HomeState initState;

  Stream<HomeState> get state => _stateSubject;

  HomeBloc(this._apiService, this._preferencesService) {
    initState = HomeState(
      (b) => b
        ..name = ""
        ..squad = ""
        ..km = ""
        ..actionDuration = ""
        ..energy = ""
        ..rating = ""
        ..activeDayFilter = DayFilter.day.toBuilder()
        ..activityItems = SetBuilder<ActivityItem>()
        ..moods = MapBuilder<Mood, int>()
        ..friends = BuiltSet<Friend>().toBuilder(),
    );
    _stateSubject.add(initState);
    _apiService.childStats(_preferencesService.getChild()).then(_onResponse);
  }

  void _onResponse(ChildResponse response) {
    Log.d(_tag, "On response $response");

    final countFormat = NumberFormat("#,###.##", "ru");
    final km = countFormat.format(response.distance / 1000.0);
    final actionDuration =
        (response.actionDuration / 60000.0).ceil().toString();
    final energy = countFormat.format(response.energy);
    final rating = response.rating.toString();
    final activityItems = response.actionTimetable
        .map((action) => ActivityItem.fromValue(action))
        .toSet();

    final moods = BuiltMap<Mood, int>({
      Mood.funny:
          (response.emotions.happiness + response.emotions.surprise).ceil(),
      Mood.calm: response.emotions.neutral.ceil(),
      Mood.sad: (response.emotions.contempt +
              response.emotions.disgust +
              response.emotions.sadness)
          .ceil(),
      Mood.angry: (response.emotions.anger + response.emotions.fear).ceil(),
    }).toBuilder();

    _updateState((b) => b
      ..name = response.name
      ..squad = response.squad
      ..km = km
      ..actionDuration = actionDuration
      ..energy = energy
      ..rating = rating
      ..activityItems = SetBuilder<ActivityItem>(activityItems)
      ..moods = moods
      ..friends = response.bestFriends.toBuilder());
  }

  void onClickDayFilter(DayFilter dayFilter) {
    _updateState((b) => b..activeDayFilter = dayFilter.toBuilder());
  }

  void _updateState(updates(HomeStateBuilder builder)) {
    _stateSubject.add(
      _stateSubject.value.rebuild(updates),
    );
  }
}
