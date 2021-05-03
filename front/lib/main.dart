import 'package:amc_hack/Pages/CameraPage.dart';
import 'package:flutter/material.dart';
import 'Pages/AuthenticationPage.dart';
import 'Res/Const.dart';
import 'Pages/MainPage.dart';
import 'Pages/TicketPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Const.updateStatusBarDark();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(this);
    super.dispose();
  }

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
        fontFamily: "NonitoSans"
      ),
      initialRoute: "/AuthPage",

      routes: {
        "/AuthPage":(BuildContext context) => AuthenticationPage(),
        "/MainPage":(BuildContext context) => MainPage(),
        "/CameraPage":(BuildContext context) => CameraPage(),
        "/TicketPage":(BuildContext context) => TicketPage(),
      },
    );
  }
}
