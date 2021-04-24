import 'package:amc_hack/Const.dart';
import 'package:amc_hack/Pages/MainPage/HomeScreen.dart';
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
        screens: [
          HomeScreen(),
          null,
          Container(child: Center(child: Text("ffffff"),),),
        ],
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.home),
            activeColorPrimary: Const.ThemeGreen,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.add, color: Colors.white,),
            onPressed: (context) {},
            title: (""),
            activeColorPrimary: Const.ThemeGreen,
            inactiveColorPrimary: CupertinoColors.systemGrey,

          ),
          PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.list_bullet),
            activeColorPrimary: Const.ThemeGreen,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),

        ],
      navBarStyle: NavBarStyle.style17,
    );
  }
}