import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/domain/schedule_bloc.dart';
import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/state/schedule_state.dart';
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
          ],
        ),
      ),
    );
  }

  Widget _dayFilters() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 50.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        color: BerezkaColors.passive,
      ),
      child: Row(
        children: <Widget>[
          _dayFilter(DayFilter.day),
          _dayFilter(DayFilter.week),
          _dayFilter(DayFilter.period),
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
              fontWeight: FontWeight.w500,
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
