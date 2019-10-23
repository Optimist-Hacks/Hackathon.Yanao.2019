import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/domain/schedule_bloc.dart';
import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/state/schedule_state.dart';
import 'package:flutter_app/texts.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/ui/berezka_icons.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:rxdart/rxdart.dart';

const _tag = "schedule_page";

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final CompositeSubscription _subscriptions = CompositeSubscription();
  ScheduleBloc _scheduleBloc;
  ScheduleState _state;

  @override
  void didChangeDependencies() {
    if (_scheduleBloc == null) {
      _scheduleBloc = ScheduleBloc();
      StreamSubscription subscription = _scheduleBloc.state.listen((state) {
        setState(() => _state = state);
      });
      _subscriptions.add(subscription);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _subscriptions.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_state == null) {
      return Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 70.0),
            Image.asset(
              BerezkaIcons.logo,
              width: 86.0,
              height: 86.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.0),
            Text(
              Texts.camp,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.0,
                height: 1.115,
                fontWeight: FontWeight.bold,
                color: BerezkaColors.title,
              ),
            ),
            SizedBox(height: 50.0),
            _dayFilters(),
            SizedBox(height: 30.0),
            _title(Texts.morning),
            SizedBox(height: 15.0),
            _row("8:00", " – Подъем, умывание"),
            SizedBox(height: 15.0),
            _row("8:15", " – Зарядка"),
            SizedBox(height: 15.0),
            _row("8:30", " – Уборка кроватей, комнат"),
            SizedBox(height: 15.0),
            _row("9:00", " – Завтрак"),
            SizedBox(height: 30.0),
            _title(Texts.day),
            SizedBox(height: 15.0),
            _row("10:00 – 10:30", " – Свободное время"),
            SizedBox(height: 15.0),
            _row("10:30 – 12:30",
                " – Активный отдых, оздоровительные процедуры: купание, солнечные ванны, развлекательные мероприятия"),
            SizedBox(height: 15.0),
            _row("12:30", " – Обед"),
            SizedBox(height: 15.0),
            _row("13:30", " – Тихий час"),
            SizedBox(height: 15.0),
            _row("15:00 – 16:00", " – Свободное время"),
            SizedBox(height: 15.0),
            _row("16:00", " – Полдник"),
            SizedBox(height: 15.0),
            _row("16:00 – 19:00",
                " – Купание, солнечные ванны, развлекательные мероприятия"),
            SizedBox(height: 30.0),
            _title(Texts.evening),
            SizedBox(height: 15.0),
            _row("19:00", " – Ужин"),
            SizedBox(height: 15.0),
            _row("20:00", " – Равлекательные мероприятия"),
            SizedBox(height: 15.0),
            _row("21:45", " – Второй ужин"),
            SizedBox(height: 15.0),
            _row("22:00", " – Подготовка ко сну"),
            SizedBox(height: 15.0),
            _row("22:30", " – Сон"),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Text _title(String name) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24.0,
        height: 1.114,
        fontWeight: FontWeight.bold,
        color: BerezkaColors.title,
      ),
    );
  }

  Widget _row(String time, String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: time,
                style: TextStyle(
                  fontSize: 18.0,
                  height: 1.23,
                  fontWeight: FontWeight.normal,
                  color: BerezkaColors.orange,
                ),
              ),
              TextSpan(
                text: name,
                style: TextStyle(
                  fontSize: 18.0,
                  height: 1.23,
                  fontWeight: FontWeight.normal,
                  color: BerezkaColors.title,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dayFilters() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0),
      height: 50.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        color: BerezkaColors.passive,
      ),
      child: Row(
        children: <Widget>[
          _dayFilter(DayFilter.today),
          _dayFilter(DayFilter.tomorrow),
        ],
      ),
    );
  }

  Widget _dayFilter(DayFilter dayFilter) {
    return Expanded(
      child: SizedBox(
        height: 50.0,
        child: RaisedButton(
          elevation: 0.0,
          onPressed: () => _onClickDayFilter(dayFilter),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          color: _state.activeDayFilter == dayFilter
              ? BerezkaColors.active
              : BerezkaColors.passive,
          child: Text(
            dayFilter.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              height: 1.115,
              fontWeight: FontWeight.w600,
              color: _state.activeDayFilter == dayFilter
                  ? BerezkaColors.white
                  : BerezkaColors.title,
            ),
          ),
        ),
      ),
    );
  }

  void _onClickDayFilter(DayFilter dayFilter) {
    Log.d(_tag, "Click day filter $dayFilter");
    _scheduleBloc.onClickDayFilter(dayFilter);
  }
}
