import 'package:amc_hack/Pages/MainPage/HistoryScreen.dart';
import 'package:amc_hack/Pages/MainPage/HomeScreen.dart';
import 'package:amc_hack/Res/Ticket.dart';
import 'package:amc_hack/Widgets/ElementList.dart';
import 'package:amc_hack/Widgets/NavigationBar.dart';
import 'package:amc_hack/Widgets/TaskBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {

  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {

  ElementListController elementListController = ElementListController();
  ElementListController elementListController_h = ElementListController();
  TaskBarController taskBarController = new TaskBarController();

  List<Widget> screens = [];
  int currentIndex = 0;
  int toolBarWait = 0;
  int toolBarSent = 0;

  void initState() {
    super.initState();

    screens = [
      HomeScreen(
        elementListController: elementListController,
        taskBarController: taskBarController,
      ),
      HistoryScreen(
        elementListController: elementListController_h,
      )
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        items: [
          "assets/icons/bookmark-line 1.svg",
          "assets/icons/home-line 1.svg",
        ],
        currentIndex: currentIndex,
        onTap: (int i) => setState(() => currentIndex = i),
        onPressed: () {
          Navigator.pushNamed(context, "/CameraPage").then((value){
            if (value != null) {
              Navigator.pushNamed(context, "/TicketPage").then((value){
                if (value != null) {
                  send(value);
                }
              });
            }
          });
        },
      )
    );
  }

  void send(Ticket value) {
    elementListController.add(value);
    taskBarController.countWait = ++toolBarWait;

    Future.delayed(Duration(milliseconds: 1000), ()
    {
      elementListController_h.add(
          elementListController.tickets[elementListController.tickets.length -
              1]);
      elementListController.remove(elementListController.tickets.length - 1);

      taskBarController.countWait = --toolBarWait;
      taskBarController.countSent = ++toolBarSent;
    });
  }
}