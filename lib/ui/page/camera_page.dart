import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/camera_bloc.dart';
import 'package:flutter_app/model/state/camera_state.dart';
import 'package:flutter_app/service/api_service.dart';
import 'package:flutter_app/service/preferences_service.dart';
import 'package:flutter_app/texts.dart';
import 'package:flutter_app/ui/berezka_colors.dart';
import 'package:flutter_app/ui/berezka_icons.dart';
import 'package:flutter_app/ui/page/main_page.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart' as pathDart;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

const _tag = "camera_page";

class CameraPage extends StatefulWidget {
  static const routeName = '/camera';

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final CompositeSubscription _subscriptions = CompositeSubscription();
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  Future<List<CameraDescription>> cameras = availableCameras();
  int cameraIndex = 0;
  CameraBloc _cameraBloc;
  CameraState _state;
  ApiService _apiService;
  PreferencesService _preferencesService;

  @override
  void didChangeDependencies() {
    _apiService ??= Provider.of<ApiService>(context);
    _preferencesService ??= Provider.of<PreferencesService>(context);
    if (_cameraBloc == null) {
      _cameraBloc = CameraBloc();
      StreamSubscription subscription = _cameraBloc.state.listen((state) {
        setState(() => _state = state);
      });
      _subscriptions.add(subscription);
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _subscriptions.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_state == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _camera(),
          _counter(),
          _border(),
          _bottomButtonsRow(),
          _progress(),
        ],
      ),
    );
  }

  Widget _progress() {
    if (_state.processing) {
      return Center(child: CircularProgressIndicator());
    }
    return Container();
  }

  Widget _border() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 55.0),
        width: 271.0,
        height: 403.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: BerezkaColors.border,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _counter() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 40.0),
        alignment: Alignment.center,
        width: 80.0,
        height: 66.0,
        decoration: BoxDecoration(
          color: BerezkaColors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              _state.photoCount.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: BerezkaColors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.w600,
                height: 1.115,
              ),
            ),
            Text(
              "/5",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: BerezkaColors.white.withOpacity(0.5),
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                height: 1.115,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _camera() {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview
          return Transform.scale(
            scale: 1 / _controller.value.aspectRatio,
            child: new Center(
              child: new AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: new CameraPreview(_controller)),
            ),
          );
        } else {
          // Otherwise, display a loading indicator
          return Container(
              color: Colors.black,
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  _bottomButtonsRow() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: BerezkaColors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              Texts.take5Photo,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                height: 1.115,
                color: BerezkaColors.white,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 122,
            color: BerezkaColors.black,
            width: double.maxFinite,
            child: IconButton(
              icon: SvgPicture.asset(
                BerezkaIcons.shot,
                width: 62,
                height: 62,
                fit: BoxFit.cover,
              ),
              onPressed: _onTakeClick,
            ),
          ),
        ],
      ),
    );
  }

  void _onTakeClick() async {
    Log.d(_tag, "Click take photo");
    if (_state.processing) {
      Log.d(_tag, "Processing. Ignore click");
      return;
    }
    _cameraBloc.setProcessing(true);
    final path = pathDart.join(
      (await getApplicationDocumentsDirectory()).path,
      '${DateTime.now()}.png',
    );
    await _controller.takePicture(path);
    File file = File(path);
    Log.d(_tag, "File $path exists = ${await file.exists()}");

    final photoResult = await _apiService.addChildPhoto(
      _preferencesService.getChild(),
      file,
    );
    Log.d(_tag, "Finish upload photo with result $photoResult");

    _cameraBloc.increasePhoto();
    _cameraBloc.setProcessing(false);

    Log.d(_tag, "photo count = ${_state.photoCount}");
    if (_state.photoCount >= 4) {
      Navigator.popAndPushNamed(context, MainPage.routeName);
    }
  }

  initializeCamera() {
    _initializeControllerFuture = cameras.then((cameras) async {
      await _controller?.dispose();

      _controller = CameraController(
          cameras.elementAt(cameraIndex), ResolutionPreset.high);

      // If the controller is updated then update the UI.
      _controller.addListener(() {
        if (mounted) setState(() {});
      });

      await _controller.initialize();

      if (mounted) {
        setState(() {});
      }
    });

    setState(() {});
  }
}

class Chronometer extends StatefulWidget {
  @override
  _ChronometerState createState() => _ChronometerState();
}

class _ChronometerState extends State<Chronometer> {
  DateTime startTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<void>(
      stream: Stream.periodic(Duration(seconds: 1)),
      builder: (context, _) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Color(0x77000000),
              borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  recordedTimeStr(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2),
              ),
              Icon(
                Icons.fiber_manual_record,
                color: Colors.red,
                size: 20,
              )
            ],
          ),
        );
      },
    );
  }

  String recordedTimeStr() {
    Duration recordTime = DateTime.now().difference(startTime);

    int minutes = recordTime.inMinutes;
    int seconds = recordTime.inSeconds % 60;

    String minutesStr;
    String secondsStr;

    if (minutes < 10) {
      minutesStr = "0$minutes";
    } else {
      minutesStr = "$minutes";
    }

    if (seconds < 10) {
      secondsStr = "0$seconds";
    } else {
      secondsStr = "$seconds";
    }

    return "$minutesStr:$secondsStr";
  }
}

enum Flash { OFF, ON, AUTO }
