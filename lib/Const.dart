import 'dart:ui';
import 'package:flutter/material.dart';

import 'ColorGenerator.dart';

class Const {

  static final Color ThemeColor = Color(0xFF30BFB3);
  static final MaterialColor MaterialThemeColor = ColorGenerator.GenerateMaterialColor(ThemeColor);

  static final ThemeGreen = Color(0xFF80E220);
}