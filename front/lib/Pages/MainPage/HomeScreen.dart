import 'package:amc_hack/Res/Const.dart';
import 'package:amc_hack/Widgets/BackgroundImage.dart';
import 'package:amc_hack/Widgets/ElevatedCard.dart';
import 'package:amc_hack/Widgets/ListElement.dart';
import 'package:amc_hack/Widgets/TaskBar.dart';
import 'package:amc_hack/Widgets/TitleSubtitle.dart';
import 'package:flutter/material.dart';

import '../LocalMemory.dart';

class HomeScreen extends StatefulWidget {

  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with SingleTickerProviderStateMixin{

  int i = LocalMemory.listOfActive.length;
  int b = LocalMemory.history.length;
  TaskBarController taskBarController = new TaskBarController();

  void initState() {
    Future.delayed(Duration(milliseconds: 2000), () {
      taskBarController.countSent = 2;
      taskBarController.countWait = 4;
      print(taskBarController.wait);
    });
  }

  Widget build(BuildContext context) {
    return BackgroundImage(
      image: Image.asset("assets/background.png", fit: BoxFit.fitWidth,),
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 10, right: 10, top: 60),
        children: [

          TitleSubtitle(
              title: "Здравствуйте,",
              subtitle: "Вот главная информация за неделю"
          ),
          Padding(
            padding: EdgeInsets.only(top: 45),
            child: TaskBar(taskBarController: taskBarController),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: ElevatedCard(
              boxShadow:  BoxShadow(
                  spreadRadius: -18,
                  blurRadius: 28,
                  color: Color(0x41000000)
              ),
              borderRadius: 30,
              color: Const.colorTicketBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Текущие заявки", style: Const.textStyleTicketTitle,),
                  ListElement(title: "sdsdsd", subtitle: "dsdsdv",)
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}