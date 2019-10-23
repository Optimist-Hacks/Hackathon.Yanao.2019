import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/service/preferences_service.dart';
import 'package:flutter_app/texts.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/ui/berezka_icons.dart';
import 'package:flutter_app/ui/widget/dash.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

const _tag = "info_page";

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  PreferencesService _preferencesService;

  @override
  void didChangeDependencies() {
    _preferencesService ??= Provider.of<PreferencesService>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                Texts.camp,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  height: 1.115,
                  fontWeight: FontWeight.bold,
                  color: BerezkaColors.title,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                Texts.info,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.117,
                  fontWeight: FontWeight.normal,
                  color: BerezkaColors.title,
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.centerLeft,
              width: double.maxFinite,
              height: 170.0,
              decoration: BoxDecoration(
                color: BerezkaColors.active,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "1 смена",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.17,
                          color: BerezkaColors.white,
                        ),
                      ),
                      Text(
                        "04 июня – 20 июня",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                          height: 1.17,
                          color: BerezkaColors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24.0),
                        child:
                            Dash(color: BerezkaColors.white.withOpacity(0.12)),
                      ),
                      Text(
                        "Вожатый",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.17,
                          color: BerezkaColors.white,
                        ),
                      ),
                      Text(
                        "Степан Кладиков",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                          height: 1.17,
                          color: BerezkaColors.white,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 49.0,
                      height: 49.0,
                      child: RaisedButton(
                        padding: EdgeInsets.zero,
                        elevation: 0.0,
                        onPressed: _onClickPhone,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: BerezkaColors.chill,
                        child: SvgPicture.asset(
                          BerezkaIcons.phone,
                          width: 17.0,
                          height: 17.0,
                          fit: BoxFit.cover,
                          color: BerezkaColors.active,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            _row("2 смена", "04 июня – 20 июня"),
            SizedBox(height: 15.0),
            _row("3 смена", "21 июня – 2 июл"),
            SizedBox(height: 15.0),
            _row("4 смена", "2 июля – 24 июля"),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.maxFinite,
                height: 50.0,
                child: RaisedButton(
                  padding: EdgeInsets.zero,
                  elevation: 0.0,
                  onPressed: _onClickExit,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: BerezkaColors.passive,
                  child: Text(
                    Texts.exit,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      height: 1.111,
                      color: BerezkaColors.active,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  Container _row(String row1, String row2) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.centerLeft,
      width: double.maxFinite,
      height: 80.0,
      decoration: BoxDecoration(
        color: BerezkaColors.passive,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                row1,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.17,
                  color: BerezkaColors.title.withOpacity(0.6),
                ),
              ),
              Text(
                row2,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  height: 1.17,
                  color: BerezkaColors.title.withOpacity(0.6),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 82.0,
              height: 44.0,
              child: RaisedButton(
                padding: EdgeInsets.zero,
                elevation: 0.0,
                onPressed: _onClickBuy,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: BerezkaColors.active,
                child: Text(
                  Texts.buy,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    height: 1.115,
                    color: BerezkaColors.passive,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onClickBuy() {
    Log.d(_tag, "Click buy");
  }

  void _onClickPhone() {
    Log.d(_tag, "Click phone");
  }

  void _onClickExit() {
    Log.d(_tag, "Click exit");
    _preferencesService.reset();
    RestartWidget.restartApp(context);
  }
}
