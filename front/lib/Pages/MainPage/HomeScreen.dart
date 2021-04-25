import 'dart:math';

import 'package:amc_hack/Widgets/ListElement.dart';
import 'package:flutter/material.dart';

import '../LocalMemory.dart';

class HomeScreen extends StatefulWidget {

  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with SingleTickerProviderStateMixin{


  void initState() {
    addListElement();
    addListElement();
    addListElement();
    addListElement();
    addListElement();
    addListElement();
  }


  int i = LocalMemory.listOfActive.length;
  int b = LocalMemory.history.length;

  void addListElement() {

    var r =Random();

    Future.delayed(Duration(milliseconds: 2000+r.nextInt(3000)), () {

      setState(() {
        LocalMemory.listOfActive.add(ListElement());
        i++;
      }
      );

      Future.delayed(Duration(milliseconds: 2000+r.nextInt(3000)), () {

        setState(() {
          LocalMemory.listOfActive.removeAt(i-1);
          LocalMemory.history.add(ListElement());
          i--;
          b++;
        });
      }
      );
    }
    );
  }

  Widget build(BuildContext context) {


    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            child: Image.asset("assets/background.png", fit: BoxFit.fitWidth,),
          ),
        ),
        ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 60, left: 10, bottom: 45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Здравствуйте,", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF7F98E7)),),
                    Text("Вот главная информация за неделю", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  ],
                )
            ),

            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
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
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Мои запросы", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text((i+b).toString(), style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold, foreground: Paint()..shader =  LinearGradient(
                                  colors: <Color>[Color(0xff8f9ffd), Color(
                                      0xffff9f77)],
                                ).createShader(Rect.fromLTWH(0.0, 200, 200.0, 0))
                                ),),
                                Text("Всего                                        ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, ),),
                              ],
                            ),

                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 18,
                                ),
                                Text("История", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, fontFamily: "NonitoSans"),),
                                Text((b).toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFFC19FC1)),),
                                SizedBox(
                                  height: 12,
                                ),
                                Text("В очереди", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, fontFamily: "NonitoSans"),),
                                Text("$i", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFFC19FC1)),),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 45),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFEDF4F7),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: -18,
                          blurRadius: 28,
                          color: Color(0x41000000)
                      )
                    ]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Текущие заявки", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Column(
                        children: LocalMemory.listOfActive.length > 0? LocalMemory.listOfActive : [Text("Ничего нет")],
                      ),
                    ],
                  ),
                )
            )
          ],
        )
      ],
    );
  }
}