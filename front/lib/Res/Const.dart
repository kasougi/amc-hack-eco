import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'ColorGenerator.dart';

class Const {

  static final Color ThemeColor = Color(0xFF8F9FFD);
  static final MaterialColor MaterialThemeColor = ColorGenerator.GenerateMaterialColor(ThemeColor);

  static final ThemeGreen = Color(0xFF8F9FFD);

  static final colorTicketBackground = Color(0xFFEDF4F7);

  static final textStyleTicketTitle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  static final textStyleTicketSubtitle = TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black);

  static final textTitleSubtitleTitle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF7F98E7));
  static final textTitleSubtitleSubtitle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  static final textSliderWidget = TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white);

  static void updateStatusBar(){
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
  }

  static void updateStatusBarDark(){
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.white);
  }
}