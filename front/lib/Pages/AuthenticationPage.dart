import 'file:///C:/Users/gennadyalheev/IdeaProjects/AMC_Hack_Eco_Work/front/lib/Res/Const.dart';
import 'package:amc_hack/Pages/CameraPage.dart';
import 'package:amc_hack/Pages/MainPage/HistoryScreen.dart';
import 'package:amc_hack/Pages/MainPage/HomeScreen.dart';
import 'package:amc_hack/Res/Authentication.dart';
import 'package:amc_hack/Res/LocalMemory.dart';
import 'package:amc_hack/Widgets/BackgroundImage.dart';
import 'package:amc_hack/Widgets/GoogleAuth.dart';
import 'package:amc_hack/Widgets/NavigationBar.dart';
import 'package:amc_hack/Widgets/SvgIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AuthenticationPage extends StatefulWidget {

  State<StatefulWidget> createState() => _AuthenticationPage();
}

class _AuthenticationPage extends State<AuthenticationPage> with SingleTickerProviderStateMixin {

  List screens = [
    HomeScreen(),
    HistoryScreen()
  ];

  int currentIndex = 0;

  Widget build(BuildContext context) {

    return Scaffold(
        extendBody: true,
        body: BackgroundImage(
          image: Image.asset("assets/a_background.png", fit: BoxFit.fitWidth,),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GoogleAuth()
                )
              ],
            ),
          )
        )
    );
  }
}