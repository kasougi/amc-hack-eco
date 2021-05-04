import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LocalMemory {
  static List<Widget> listOfActive = [];
  static List<Widget> history = [];
  static User gUser;
}
