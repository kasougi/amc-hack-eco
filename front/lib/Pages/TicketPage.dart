import 'file:///C:/Users/gennadyalheev/IdeaProjects/AMC_Hack_Eco_Work/front/lib/Res/Const.dart';
import 'package:amc_hack/Pages/CameraPage.dart';
import 'package:amc_hack/Pages/LocalMemory.dart';
import 'package:amc_hack/Pages/MainPage/HistoryScreen.dart';
import 'package:amc_hack/Pages/MainPage/HomeScreen.dart';
import 'package:amc_hack/Widgets/ListElement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TicketPage extends StatefulWidget {

  State<StatefulWidget> createState() => _TicketPage();
}

class _TicketPage extends State<TicketPage> with SingleTickerProviderStateMixin {

  double value = 0;

  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Container(
                width: double.infinity,
                child: Image.asset("assets/t_background.png", fit: BoxFit.fitWidth,),
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
                    padding: EdgeInsets.only(top: 150, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Мы готовы создать заявку", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF7F98E7)),),
                        Text("Для этого опишите проблему", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                      ],
                    )
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 60, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Опишите что случилось", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xFFEDF4F7),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: -18,
                                    blurRadius: 28,
                                    color: Color(0x329C9C9C)
                                )
                              ]
                          ),
                        ),
                        Text("Размер", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),),
                        Slider(
                          activeColor: Colors.white,
                          value: value,
                          min: 0,
                          max: 1000,
                          onChanged: (_value) {
                            setState(
                                  () {
                                    value = _value;
                              },
                            );
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: -18,
                                    blurRadius: 28,
                                    color: Color(0x329C9C9C)
                                )
                              ]
                          ),
                          child: TextButton(
                            onPressed: (){Navigator.pushReplacementNamed(context, "/MainPage");
                            LocalMemory.listOfActive.add(ListElement());},
                            child: Text("Отправить", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFCAB3E3)),),
                          ),
                        )
                      ],
                    )
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}