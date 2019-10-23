import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/ui/berezka_icons.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Stack(
      children: <Widget>[
        _photo(),
        _exit(),
      ],
    );
  }

  Widget _photo() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        CachedNetworkImage(
          imageUrl: widget._url,
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }

  Widget _exit() {
    return Padding(
      padding: EdgeInsets.only(top: 55.0, left: 20.0),
      child: SizedBox(
        width: 49.0,
        height: 49.0,
        child: RaisedButton(
          padding: EdgeInsets.zero,
          elevation: 0.0,
          onPressed: _onBackClick,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          color: BerezkaColors.black.withOpacity(0.2),
          child: SvgPicture.asset(
            BerezkaIcons.exit,
            width: 20.0,
            height: 20.0,
            fit: BoxFit.cover,
            color: BerezkaColors.white,
          ),
        ),
      ),
    );
  }

  void _onBackClick() {
    Log.d(_tag, "On click back");
    Navigator.pop(context);
  }
}
