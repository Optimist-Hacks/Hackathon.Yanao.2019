import 'package:flutter/material.dart';
import 'package:flutter_app/service/api_service.dart';
import 'package:flutter_app/service/preferences_service.dart';
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
          routes: {
            LoginPage.routeName: (context) => LoginPage(),
            MainPage.routeName: (context) => MainPage(),
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
