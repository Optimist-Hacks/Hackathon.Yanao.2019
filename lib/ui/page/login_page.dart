import 'package:flutter/material.dart';
import 'package:flutter_app/domain/login_bloc.dart';
import 'package:flutter_app/texts.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/ui/berezka_icons.dart';

const _tag = "login_page";

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LoginBloc _loginBloc;

  @override
  void didChangeDependencies() {
    _loginBloc ??= LoginBloc();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _body(),
      backgroundColor: BerezkaColors.white,
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        SizedBox(height: 50.0),
        Image.asset(
          BerezkaIcons.welcome,
          width: 302,
          height: 226,
          fit: BoxFit.cover,
        ),
        TextField(
          maxLines: 1,
        ),
        Text(
          Texts.inviteDescription,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: BerezkaColors.title.withOpacity(0.5),
            fontSize: 17,
            height: 1.11,
          ),
        ),
      ],
    );
  }
}
