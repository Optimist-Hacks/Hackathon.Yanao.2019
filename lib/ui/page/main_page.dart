import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/domain/main_bloc.dart';
import 'package:flutter_app/model/navigation_item.dart';
import 'package:flutter_app/model/state/main_state.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/ui/page/home_page.dart';
import 'package:flutter_app/ui/page/info_page.dart';
import 'package:flutter_app/ui/page/schedule_page.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    _subscriptions.dispose();
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: BerezkaColors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _navigationIcon(NavigationItem.schedule),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: _navigationIcon(NavigationItem.home),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: _navigationIcon(NavigationItem.info),
            title: Container(),
          ),
        ],
        currentIndex: _state.activeNavigationItem.value,
        onTap: _onClickNavigation,
      ),
    );
  }

  Widget _navigationIcon(NavigationItem navigationItem) {
    return SvgPicture.asset(
      navigationItem.icon,
      width: 34,
      height: 34,
      color: navigationItem == _state.activeNavigationItem
          ? BerezkaColors.orange
          : BerezkaColors.navigation,
      fit: BoxFit.cover,
    );
  }

  Widget _body() {
    if (_state.activeNavigationItem == NavigationItem.home) {
      return HomePage();
    } else if (_state.activeNavigationItem == NavigationItem.schedule) {
      return SchedulePage();
    } else if (_state.activeNavigationItem == NavigationItem.info) {
      return InfoPage();
    } else {
      throw UnsupportedError("Unsupported NavigationItem value");
    }
  }

  void _onClickNavigation(int index) {
    Log.d(_tag, "Click navigation $index");
    _mainBloc.onClickNavigation(index);
  }
}
