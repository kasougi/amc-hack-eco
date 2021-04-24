import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen(){

  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Center(
            child: Container(
              width: double.infinity,
              child: Image.asset("assets/background.png", fit: BoxFit.fitWidth,),
            ),
          ),
        ),

      ],
    );
  }
}