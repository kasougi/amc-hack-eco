import 'package:amc_hack/Res/Const.dart';
import 'package:amc_hack/Widgets/BackgroundImage.dart';
import 'package:amc_hack/Widgets/ElementList.dart';
import 'package:amc_hack/Widgets/ElevatedCard.dart';
import 'package:amc_hack/Widgets/TaskBar.dart';
import 'package:amc_hack/Widgets/TitleSubtitle.dart';
import 'package:flutter/material.dart';

import '../../Res/LocalMemory.dart';

class HomeScreen extends StatefulWidget {

  ElementListController elementListController;
  TaskBarController taskBarController;

  HomeScreen({@required this.elementListController, @required this.taskBarController});

  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with SingleTickerProviderStateMixin{

  void initState() {
    super.initState();
  }

  String a = LocalMemory.gUser.displayName;

  Widget build(BuildContext context) {

    return BackgroundImage(
        image: Image.asset("assets/background.png", fit: BoxFit.fitWidth,),
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 10, right: 10, top: 60),
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleSubtitle(
                    title: "Здравствуйте,",
                    subtitle: a
                ),
                SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                      child: Image.network(
                        LocalMemory.gUser.photoURL,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 45),
              child: TaskBar(taskBarController: widget.taskBarController),
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
                    ElementList(elementListController: widget.elementListController)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
            )
          ],
        )
    );
  }
}