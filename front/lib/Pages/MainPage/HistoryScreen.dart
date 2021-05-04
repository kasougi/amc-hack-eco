import 'file:///C:/Users/gennadyalheev/IdeaProjects/AMC_Hack_Eco_Work/front/lib/Res/LocalMemory.dart';
import 'package:amc_hack/Widgets/BackgroundImage.dart';
import 'package:amc_hack/Widgets/ElementList.dart';
import 'package:amc_hack/Widgets/ListElement.dart';
import 'package:amc_hack/Widgets/TitleSubtitle.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget{

  ElementListController elementListController;

  HistoryScreen({@required this.elementListController});


  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: Image.asset("assets/background.png", fit: BoxFit.fitWidth,),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, bottom: 45),
            child:  TitleSubtitle(
                title: "История заявок,",
                subtitle: "Тут вся исторя заявок"
            ),
          ),
          ElementList(
            elementListController: widget.elementListController,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 60),
          )
        ],
      )
    );
  }
}