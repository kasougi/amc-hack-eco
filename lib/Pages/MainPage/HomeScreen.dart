import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen(){

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
        Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 60, left: 10, bottom: 45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Здравствуйте,", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    Text("Вот главная информация за неделю", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  ],
                )
            ),

            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEDF4F7),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: -18,
                    blurRadius: 28,
                    color: Color(0x41000000)
                  )
                ]
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Запросы", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("289", style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),),
                                Text("Цифорок было написано", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
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
                                Text("Описание цифорки", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),),
                                Text("78", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                                SizedBox(
                                  height: 12,
                                ),
                                Text("Описание цифорки", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),),
                                Text("89", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
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
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    color: Color(0xFFEDF4F7),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: -18,
                          blurRadius: 28,
                          color: Color(0x41000000)
                      )
                    ]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Текущие заявки", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Column(
                            children: [],
                          )
                        ),
                      )
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