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
        Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 60, left: 10, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Здравствуйте,", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    Text("Вот главная информация за неделю", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  ],
                )
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
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
                          children: [
                            Column(
                              children: [
                                Text("289", style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),),
                              ],
                            )
                          ],
                        ),
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