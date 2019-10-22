import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/home_bloc.dart';
import 'package:flutter_app/model/activity_item.dart';
import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/state/home_state.dart';
import 'package:flutter_app/texts.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/ui/berezka_icons.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';

const _tag = "main_page";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CompositeSubscription _subscriptions = CompositeSubscription();
  HomeBloc _homeBloc;
  HomeState _state;

  @override
  void didChangeDependencies() {
    if (_homeBloc == null) {
      _homeBloc = HomeBloc();
      StreamSubscription subscription = _homeBloc.state.listen((state) {
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

    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 70.0),
            Stack(
              children: <Widget>[
                Center(child: _avatar()),
                Positioned(
                  right: 80.0,
                  top: 20.0,
                  child: _phone(),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            _title(),
            SizedBox(height: 5.0),
            _subtitle(),
            SizedBox(height: 60.0),
            _dayFilters(),
            SizedBox(height: 30.0),
            _activityStats(),
            SizedBox(height: 30.0),
            _schedule(),
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

  Widget _phone() {
    return SizedBox(
      width: 49.0,
      height: 49.0,
      child: RaisedButton(
        padding: EdgeInsets.zero,
        elevation: 0.0,
        onPressed: () => _onClickPhone,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: BerezkaColors.passive,
        child: SvgPicture.asset(
          BerezkaIcons.phone,
          width: 17.0,
          height: 17.0,
          fit: BoxFit.cover,
          color: BerezkaColors.active,
        ),
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
      "Отряд 12-14 лет",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: BerezkaColors.title,
        fontSize: 15.0,
        height: 1.115,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _activityStats() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: BerezkaColors.passive,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30.0),
          _distance(),
          SizedBox(height: 40.0),
          _activity(),
          SizedBox(height: 30.0),
          Container(
            height: 50.0,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: BerezkaColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  Texts.today,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.115,
                    color: BerezkaColors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  "активнее 67% отряда",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.115,
                    color: BerezkaColors.title,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _distance() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          5.78.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: BerezkaColors.title,
            fontSize: 60.0,
            height: 1.115,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 5.0),
        Text(
          Texts.km,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: BerezkaColors.title.withOpacity(0.4),
            fontSize: 23.0,
            height: 1.115,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _activity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _stat(163, Texts.min, Texts.duration),
        Container(
          color: BerezkaColors.title.withOpacity(0.12),
          width: 1.0,
          height: 52.0,
        ),
        _stat(1456, Texts.kkal, Texts.calorie),
      ],
    );
  }

  Widget _stat(double value, String name, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              value.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: BerezkaColors.title,
                fontSize: 24.0,
                height: 1.115,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 5.0),
            Text(
              name,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: BerezkaColors.title.withOpacity(0.4),
                fontSize: 15.0,
                height: 1.115,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Text(
          description,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: BerezkaColors.title.withOpacity(0.4),
            fontSize: 15.0,
            height: 1.115,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _schedule() {
    return SizedBox(
      height: 94,
      width: double.maxFinite,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) =>
            _activityItem(_state.activityItems.elementAt(index)),
        itemCount: _state.activityItems.length,
      ),
    );
  }

  Widget _activityItem(ActivityItem activityItem) {
    return Container(
      width: 370,
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: BerezkaColors.orange,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10.0),
          Image.asset(
            activityItem.icon,
            width: 74.0,
            height: 74.0,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                activityItem.name,
                textAlign: TextAlign.start,
                maxLines: 2,
                style: TextStyle(
                  color: BerezkaColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  height: 1.17,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 95.0,
                height: 23.0,
                child: Center(
                  child: Text(
                    activityItem.duration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: BerezkaColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 1.12,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: BerezkaColors.white.withOpacity(0.2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onClickDayFilter(DayFilter dayFilter) {
    Log.d(_tag, "Click day filter $dayFilter");
    _homeBloc.onClickDayFilter(dayFilter);
  }

  void _onClickPhone() {
    Log.d(_tag, "Click phone");
  }
}
