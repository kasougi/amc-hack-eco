import 'package:amc_hack/Widgets/ListElement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LocalMemory {
  static List<Widget> listOfActive = [];
  static List<Widget> history = [ListElement(), ListElement(), ListElement()];
  static User gUser;
}
