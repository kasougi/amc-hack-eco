import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
            color: Color(0xFFEDF4F7),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  spreadRadius: -18,
                  blurRadius: 28,
                  color: Color(0x41000000)
              )
            ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Название заявки", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text("Описание", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            ],
          ),
        )
    );
  }

}