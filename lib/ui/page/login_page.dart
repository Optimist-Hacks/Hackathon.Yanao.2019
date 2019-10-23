import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/domain/login_bloc.dart';
import 'package:flutter_app/model/state/login_state.dart';
import 'package:flutter_app/service/api_service.dart';
import 'package:flutter_app/service/preferences_service.dart';
import 'package:flutter_app/texts.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/ui/berezka_icons.dart';
import 'package:flutter_app/ui/page/camera_page.dart';
import 'package:flutter_app/ui/page/main_page.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

const _tag = "login_page";

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CompositeSubscription _subscriptions = CompositeSubscription();
  LoginBloc _loginBloc;
  LoginState _state;
  ApiService _apiService;
  TextEditingController _textController;
  PreferencesService _preferencesService;

  @override
  void didChangeDependencies() {
    _apiService ??= Provider.of<ApiService>(context);
    _preferencesService ??= Provider.of<PreferencesService>(context);
    if (_loginBloc == null) {
      _loginBloc = LoginBloc();
      StreamSubscription subscription = _loginBloc.state.listen((state) {
        setState(() => _state = state);
      });
      _subscriptions.add(subscription);
    }
    if (_textController == null) {
      _textController = TextEditingController();
      _textController.addListener(_onTextChange);
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
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.0),
          Image.asset(
            BerezkaIcons.welcome,
            width: 302,
            height: 226,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 24.0),
          TextField(
            autofocus: true,
            maxLines: 1,
            controller: _textController,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: BerezkaColors.title,
              height: 1.115,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
          Container(
            width: 210.0,
            height: 2.0,
            color: BerezkaColors.title.withOpacity(0.1),
          ),
          SizedBox(height: 17.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              Texts.inviteDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: BerezkaColors.title.withOpacity(0.5),
                fontSize: 17,
                height: 1.11,
              ),
            ),
          ),
          SizedBox(height: 44.0),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                width: 212.0,
                height: 50.0,
                child: RaisedButton(
                  elevation: _state.buttonEnabled ? 2 : 0,
                  color: _state.buttonEnabled
                      ? BerezkaColors.active
                      : BerezkaColors.passive,
                  onPressed: _onClickLogin,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  child: Text(
                    Texts.enter,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.115,
                      fontWeight: FontWeight.w500,
                      color: BerezkaColors.white,
                    ),
                  ),
                ),
              ),
              _state.processing
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  void _onTextChange() {
    Log.d(_tag, "onTextChange. Token = ${_getToken()}");
    _loginBloc.onChangeTokenLength(_getToken().length);
  }

  void _onClickLogin() async {
    Log.d(_tag, "On click login. Token = ${_getToken()}");
    _loginBloc.setProcessing(true);
    final result = await _apiService.login(_getToken());
    if (result == null) {
      Log.e(_tag, "Login failed");
    } else {
      Log.d(_tag, "Login success $result");
      _preferencesService.setCurrentUser(result.token);
      _preferencesService.setChild(result.children.elementAt(0).id);
      if (result.children.elementAt(0).photoCount > 0) {
        Navigator.popAndPushNamed(context, MainPage.routeName);
      } else {
        Navigator.popAndPushNamed(context, CameraPage.routeName);
      }
    }
    _loginBloc.setProcessing(false);
  }

  String _getToken() {
    final text = _textController.text;
    if (text == null) {
      return "";
    } else {
      return text.trim();
    }
  }
}
