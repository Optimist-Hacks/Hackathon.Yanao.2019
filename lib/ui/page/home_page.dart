import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/home_bloc.dart';
import 'package:flutter_app/model/activity_item.dart';
import 'package:flutter_app/model/day_filter.dart';
import 'package:flutter_app/model/firend.dart';
import 'package:flutter_app/model/mood.dart';
import 'package:flutter_app/model/state/home_state.dart';
import 'package:flutter_app/service/api_service.dart';
import 'package:flutter_app/service/preferences_service.dart';
import 'package:flutter_app/texts.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/ui/berezka_icons.dart';
import 'package:flutter_app/ui/page/image_page.dart';
import 'package:flutter_app/ui/widget/dash.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

const _tag = "home_page";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CompositeSubscription _subscriptions = CompositeSubscription();
  final ScrollController _scheduleController = ScrollController();
  HomeBloc _homeBloc;
  HomeState _state;
  bool scrolled = false;
  Timer _timer;

  @override
  void didChangeDependencies() {
    if (_homeBloc == null) {
      _homeBloc = HomeBloc(
        Provider.of<ApiService>(context),
        Provider.of<PreferencesService>(context),
      );
      StreamSubscription subscription = _homeBloc.state.listen((state) {
        setState(() => _state = state);
      });
      _subscriptions.add(subscription);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _subscriptions.dispose();
    _scheduleController.dispose();
    _homeBloc?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_state == null) {
      return Center(child: CircularProgressIndicator());
    }

    if (!scrolled && _state.activityItems.isNotEmpty) {
      Timer(
        Duration(milliseconds: 500),
        () => _scheduleController.animateTo(
          _scheduleController.position.maxScrollExtent,
          curve: Curves.easeInOutQuad,
          duration: Duration(milliseconds: 300),
        ),
      );
      scrolled = true;
    }

    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 74.0),
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
            SizedBox(height: 21.0),
            _title(),
            SizedBox(height: 5.0),
            _subtitle(),
            SizedBox(height: 60.0),
            _dayFilters(),
            SizedBox(height: 30.0),
            _activityStats(),
            SizedBox(height: 30.0),
            _schedule(),
            SizedBox(height: 30.0),
            _dash(),
            SizedBox(height: 30.0),
            _emotionStats(),
            SizedBox(height: 30.0),
            _dash(),
            SizedBox(height: 30.0),
            _friends(),
            SizedBox(height: 30.0),
            _dash(),
            SizedBox(height: 30.0),
            _photos(),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Container _dash() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Dash(color: BerezkaColors.black.withOpacity(0.12)),
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

  Widget _avatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(36),
      child: CachedNetworkImage(
        imageUrl: _state.photoUrl,
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
      _state.name,
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
      _state.squad,
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
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  "активнее ${_state.rating}% отряда",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.115,
                    color: BerezkaColors.title,
                    fontWeight: FontWeight.w600,
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
          _state.km,
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
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _activity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _stat(_state.actionDuration, Texts.min, Texts.duration),
        Container(
          color: BerezkaColors.title.withOpacity(0.12),
          width: 1.0,
          height: 52.0,
        ),
        _stat(_state.energy, Texts.kkal, Texts.calorie),
      ],
    );
  }

  Widget _stat(String value, String name, String description) {
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
              value,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: BerezkaColors.title,
                fontSize: 24.0,
                height: 1.115,
                fontWeight: FontWeight.w600,
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
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10.0),
        controller: _scheduleController,
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
      width: 360,
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: activityItem.color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Image.asset(
              activityItem.icon,
              width: 74.0,
              height: 74.0,
              fit: BoxFit.cover,
            ),
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
                  fontWeight: FontWeight.w600,
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
                      fontWeight: FontWeight.w600,
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
          SizedBox(width: 20.0),
        ],
      ),
    );
  }

  Widget _emotionStats() {
    if (_state.moods.isEmpty) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: BerezkaColors.passive,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              Texts.mood,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: BerezkaColors.title,
                fontSize: 24.0,
                height: 1.114,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            height: 210,
            width: double.maxFinite,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) =>
                  _moodItem(_state.moods.entries.elementAt(index)),
              itemCount: _state.moods.length,
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _moodItem(MapEntry<Mood, int> entry) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 38.0,
                height: 38.0,
                decoration: BoxDecoration(
                  color: entry.key.color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
              Image.asset(
                entry.key.path,
                width: 22.0,
                height: 22.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(width: 17.0),
          Text(
            entry.key.name,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: BerezkaColors.title,
              fontSize: 16,
              height: 1.115,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Container(
            alignment: Alignment.center,
            width: 56.0,
            height: 28.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: BerezkaColors.title.withOpacity(0.05),
            ),
            child: Text(
              "${entry.value}%",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: BerezkaColors.title,
                fontSize: 16,
                height: 1.115,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _friends() {
    if (_state.friends.isEmpty) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: BerezkaColors.passive,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              Texts.bestFriends,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: BerezkaColors.title,
                fontSize: 24.0,
                height: 1.114,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.maxFinite,
            height: 180.0,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) =>
                  _friendItem(_state.friends.elementAt(index)),
              itemCount: _state.friends.length,
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _friendItem(Friend friend) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: friend.photoUrl,
              alignment: Alignment.center,
              width: 44.0,
              height: 44.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 25.0),
          Text(
            friend.name,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: BerezkaColors.title,
              fontSize: 16,
              height: 1.115,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Container(
            alignment: Alignment.center,
            width: 56.0,
            height: 28.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: BerezkaColors.title.withOpacity(0.05),
            ),
            child: Text(
              (friend.timeTogether / 60000.0).ceil().toString() + Texts.hour,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: BerezkaColors.title,
                fontSize: 16,
                height: 1.115,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _photos() {
    if (_state.lastPhotos.isEmpty) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: BerezkaColors.passive,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              Texts.lastPhotos,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: BerezkaColors.title,
                fontSize: 24.0,
                height: 1.114,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.maxFinite,
            height: 84.0,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 10.0),
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) =>
                  _photoItem(_state.lastPhotos.elementAt(index)),
              itemCount: _state.lastPhotos.length,
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _photoItem(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: RaisedButton(
        padding: EdgeInsets.zero,
        elevation: 0.0,
        onPressed: () => _onClickPhoto(url),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: BerezkaColors.chill,
        child: CachedNetworkImage(
          imageUrl: url,
          alignment: Alignment.center,
          width: 84.0,
          height: 84.0,
          fit: BoxFit.cover,
        ),
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

  void _onClickPhoto(String url) {
    Log.d(_tag, "Click photo $url");
    Navigator.pushNamed(context, ImagePage.routeName, arguments: url);
  }
}
