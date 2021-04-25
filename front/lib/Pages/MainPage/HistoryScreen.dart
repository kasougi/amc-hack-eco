import 'package:amc_hack/Pages/LocalMemory.dart';
import 'package:amc_hack/Widgets/ListElement.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget{
  HistoryScreen(){}

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 60, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("История заявок,", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF7F98E7)),),
                    Text("Тут вся исторя заявок", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  ],
                )
              ),
            ),
            Expanded(
              flex: 13,
              child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFEDF4F7),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: -18,
                            blurRadius: 28,
                            color: Color(0x41000000)
                        )
                      ]
                  ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children:LocalMemory.history
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}