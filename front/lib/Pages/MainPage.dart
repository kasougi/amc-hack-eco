import 'package:amc_hack/Const.dart';
import 'package:amc_hack/Pages/CameraPage.dart';
import 'package:amc_hack/Pages/MainPage/HistoryScreen.dart';
import 'package:amc_hack/Pages/MainPage/HomeScreen.dart';
import 'package:amc_hack/Widgets/SvgIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainPage extends StatefulWidget {

  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  int g = 0;

  Widget build(BuildContext context) {

    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
        context,
        controller: _controller,
        navBarHeight: 80,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(22.0),

          colorBehindNavBar: Colors.white,
        ),
        screenTransitionAnimation:  ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        screens: [
          HomeScreen(),
          null,
          HistoryScreen(),
        ],
        items: [
          PersistentBottomNavBarItem(
            icon: SvgIcon("assets/icons/home-line 1.svg"),
            activeColorPrimary: Const.ThemeGreen,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.add, color: Colors.white,),
            onPressed: (context) {pushNewScreen(
              context,
              screen: CameraPage(),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );},
            title: (""),
            activeColorPrimary: Const.ThemeGreen,
            inactiveColorPrimary: CupertinoColors.systemGrey,

          ),
          PersistentBottomNavBarItem(
            icon: SvgIcon("assets/icons/bookmark-line 1.svg"),
            activeColorPrimary: Const.ThemeGreen,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),

        ],
      navBarStyle: NavBarStyle.style17,
    );
  }
}