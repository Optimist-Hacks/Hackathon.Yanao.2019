import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/berezka_colors.dart';

const _tag = "main_page";

class MainPage extends StatefulWidget {
  static const routeName = '/main';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
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
      backgroundColor: BerezkaColors.background,
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
          ],
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
}
