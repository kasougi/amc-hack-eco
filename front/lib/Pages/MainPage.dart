import 'file:///C:/Users/gennadyalheev/IdeaProjects/AMC_Hack_Eco_Work/front/lib/Res/Const.dart';
import 'package:amc_hack/Pages/CameraPage.dart';
import 'package:amc_hack/Pages/MainPage/HistoryScreen.dart';
import 'package:amc_hack/Pages/MainPage/HomeScreen.dart';
import 'package:amc_hack/Widgets/NavigationBar.dart';
import 'package:amc_hack/Widgets/SvgIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainPage extends StatefulWidget {

  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {

  List screens = [
    HomeScreen(),
    HistoryScreen()
  ];

  int currentIndex = 0;

  Widget build(BuildContext context) {

    Const.updateStatusBarDark();

    return Scaffold(
      extendBody: true,
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: NavigationBar(
        items: [
          "assets/icons/bookmark-line 1.svg",
          "assets/icons/home-line 1.svg",
        ],
        currentIndex: currentIndex,
        onTap: (int i) => setState(() => currentIndex = i),
        onPressed: () {Navigator.pushNamed(context, "/CameraPage");},
      )
    );
  }
}