import 'package:flutter_app/model/activity_item.dart';
import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/firend.dart';
import 'package:flutter_app/model/mood.dart';
import 'package:flutter_app/model/server/child_response.dart';
import 'package:flutter_app/model/state/home_state.dart';
import 'package:flutter_app/service/api_service.dart';
import 'package:flutter_app/service/preferences_service.dart';
import 'package:flutter_app/ui/berezka_icons.dart';
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
        ..activityItems = BuiltSet<ActivityItem>([
          ActivityItem((b) => b
            ..icon = BerezkaIcons.basketball
            ..name = "Сейчас играет в баскетбол"
            ..duration = "30-45 минут")
        ]).toBuilder()
        ..moods = BuiltMap<Mood, double>({
          Mood.funny: 45.0,
          Mood.calm: 34.0,
          Mood.sad: 17.0,
          Mood.angry: 12.0
        }).toBuilder()
        ..friends = BuiltSet<Friend>().toBuilder(),
    );
//    initState = HomeState(
//      (b) => b
//        ..activeDayFilter = DayFilter.day.toBuilder()
//        ..activityItems = BuiltSet<ActivityItem>([
//          ActivityItem((b) => b
//            ..icon = BerezkaIcons.basketball
//            ..name = "Сейчас играет в баскетбол"
//            ..duration = "30-45 минут")
//        ]).toBuilder()
//        ..moods = BuiltMap<Mood, double>({
//          Mood.funny: 45.0,
//          Mood.calm: 34.0,
//          Mood.sad: 17.0,
//          Mood.angry: 12.0
//        }).toBuilder()
//        ..friends = BuiltSet<Friend>([
//          Friend((b) => b
//            ..icon =
//                "https://www.dropbox.com/s/e41zuwyrnnzxatp/preview.png?raw=1"
//            ..name = "Алина Кладикова"
//            ..duration = "1ч"),
//          Friend((b) => b
//            ..icon =
//                "https://www.dropbox.com/s/e41zuwyrnnzxatp/preview.png?raw=1"
//            ..name = "Андрей Алексеев"
//            ..duration = "2ч"),
//          Friend((b) => b
//            ..icon =
//                "https://www.dropbox.com/s/e41zuwyrnnzxatp/preview.png?raw=1"
//            ..name = "ПОКУПКИНС"
//            ..duration = "3ч")
//        ]).toBuilder(),
//    );
    _stateSubject.add(initState);

    _apiService.childStats(_preferencesService.getChild()).then(_onResponse);
  }

  void _onResponse(ChildResponse response) {
    Log.d(_tag, "On response $response");

    final countFormat = NumberFormat("#,###.##", "ru");
    final km = countFormat.format(response.distance / 1000.0).toString();
    final actionDuration =
        countFormat.format(response.actionDuration / 60000.0).toString();
    final energy = countFormat.format(response.energy).toString();
    final rating = response.rating.toString();

    _updateState((b) => b
      ..name = response.name
      ..squad = response.squad
      ..km = km
      ..actionDuration = actionDuration
      ..energy = energy
      ..rating = rating);
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
