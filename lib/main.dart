import 'package:flutter/material.dart';
import 'Const.dart';
import 'Pages/MainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Const.updateStatusBarDark();

    return MaterialApp(
      title: 'amc_hack',
      theme: ThemeData(
        primarySwatch: Const.MaterialThemeColor,
        primaryColor: Const.MaterialThemeColor,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/MainPage",
      routes: {
        "/MainPage":(BuildContext context) => MainPage(),
      },
    );
  }
}
