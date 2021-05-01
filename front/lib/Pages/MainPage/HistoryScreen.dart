import 'package:amc_hack/Pages/LocalMemory.dart';
import 'package:amc_hack/Widgets/BackgroundImage.dart';
import 'package:amc_hack/Widgets/ListElement.dart';
import 'package:amc_hack/Widgets/TitleSubtitle.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget{

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: Image.asset("assets/background.png", fit: BoxFit.fitWidth,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 60),
              child:  TitleSubtitle(
                  title: "История заявок,",
                  subtitle: "Тут вся исторя заявок"
              ),
            ),
          ),
          Expanded(
            flex: 13,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
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
                  children:[ListElement(title: "sdsdsd", subtitle: "dsdsdv",)]
              ),
            ),
          ),
        ],
      ),
    );
  }
}