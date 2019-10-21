import 'package:flutter/material.dart';
import 'package:flutter_app/ui/main_page.dart';
import 'package:flutter_app/texts.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
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
          routes: {
            MainPage.routeName: (context) => MainPage(),
          },
          home: MainPage(),
        ),
      ),
    );
  }
}
