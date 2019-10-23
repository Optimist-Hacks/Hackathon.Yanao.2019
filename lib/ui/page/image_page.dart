import 'package:flutter/material.dart';
import 'package:flutter_app/ui/berezka_colors.dart';

const _tag = "image_page";

class ImagePage extends StatefulWidget {
  static const routeName = '/image';
  final String _url;

  const ImagePage(this._url);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
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
      backgroundColor: BerezkaColors.white,
    );
  }

  Widget _body() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget._url),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
