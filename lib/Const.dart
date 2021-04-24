import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'ColorGenerator.dart';

class Const {

  static final Color ThemeColor = Color(0xFF30BFB3);
  static final MaterialColor MaterialThemeColor = ColorGenerator.GenerateMaterialColor(ThemeColor);

  static final ThemeGreen = Color(0xFF80E220);

  static void updateStatusBar(){
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
  }

  static void updateStatusBarDark(){
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
  }
}