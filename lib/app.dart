import 'package:flutter/material.dart';
import 'package:flutter_app/service/api_service.dart';
import 'package:flutter_app/service/preferences_service.dart';
import 'package:flutter_app/ui/page/camera_page.dart';
import 'package:flutter_app/ui/page/image_page.dart';
import 'package:flutter_app/ui/page/login_page.dart';
import 'package:flutter_app/ui/page/main_page.dart';
import 'package:flutter_app/texts.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final preferencesService = PreferencesService();
    final apiService = ApiService(preferencesService);
    return MultiProvider(
      providers: [
        Provider.value(value: preferencesService),
        Provider.value(value: apiService),
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          onGenerateTitle: (BuildContext context) => Texts.appName,
          theme: ThemeData(
            canvasColor: Colors.transparent,
            accentColor: Color(0xFF567AF3),
            buttonTheme: ButtonThemeData(
              buttonColor: Color(0xFF567AF3),
              textTheme: ButtonTextTheme.primary,
            ),
            appBarTheme: AppBarTheme(color: Colors.grey[50]),
            fontFamily: 'Averta CY',
          ),
          onGenerateRoute: (settings) {
            if (settings.name == LoginPage.routeName) {
              return MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              );
            } else if (settings.name == MainPage.routeName) {
              return MaterialPageRoute(
                builder: (context) {
                  return MainPage();
                },
              );
            } else if (settings.name == CameraPage.routeName) {
              return MaterialPageRoute(
                builder: (context) {
                  return CameraPage();
                },
              );
            } else if (settings.name == ImagePage.routeName) {
              return MaterialPageRoute(
                builder: (context) {
                  return ImagePage(settings.arguments);
                },
              );
            } else {
              return MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              );
            }
          },
          home: Texts.isEmpty(
                  Provider.of<PreferencesService>(context).getCurrentUser())
              ? LoginPage()
              : MainPage(),
        ),
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  final Widget child;

  RestartWidget({this.child});

  static restartApp(BuildContext context) {
    final _RestartWidgetState state =
        context.ancestorStateOfType(const TypeMatcher<_RestartWidgetState>());
    state.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    this.setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}
