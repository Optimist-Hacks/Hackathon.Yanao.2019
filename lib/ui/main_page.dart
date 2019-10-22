import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/main_bloc.dart';
import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/state/main_state.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:rxdart/rxdart.dart';

const _tag = "main_page";

class MainPage extends StatefulWidget {
  static const routeName = '/main';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CompositeSubscription _subscriptions = CompositeSubscription();
  MainBloc _mainBloc;
  MainState _state;

  @override
  void didChangeDependencies() {
    if (_mainBloc == null) {
      _mainBloc = MainBloc();
      StreamSubscription subscription = _mainBloc.state.listen((state) {
        setState(() => _state = state);
      });
      _subscriptions.add(subscription);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_state == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      key: _scaffoldKey,
      body: _body(),
      backgroundColor: BerezkaColors.white,
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 130.0),
            _avatar(),
            SizedBox(height: 20.0),
            _title(),
            SizedBox(height: 5.0),
            _subtitle(),
            SizedBox(height: 70.0),
            _dayFilters(),
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
          onPressed: () => _onClick(dayFilter),
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
              fontSize: 15.0,
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

  Widget _avatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(36),
      child: CachedNetworkImage(
        imageUrl: "https://www.dropbox.com/s/e41zuwyrnnzxatp/preview.png?raw=1",
        alignment: Alignment.center,
        width: 86.0,
        height: 86.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _title() {
    return Text(
      "Александра",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: BerezkaColors.title,
        fontSize: 28.0,
        height: 1.115,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _subtitle() {
    return Text(
      "Александра",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: BerezkaColors.title,
        fontSize: 15.0,
        height: 1.115,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  void _onClick(DayFilter dayFilter) {
    Log.d(_tag, "Click day filter $dayFilter");
    _mainBloc.onClickDayFilter(dayFilter);
  }
}
