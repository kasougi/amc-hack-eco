import 'file:///C:/Users/gennadyalheev/IdeaProjects/AMC_Hack_Eco_Work/front/lib/Res/Const.dart';
import 'package:amc_hack/Pages/CameraPage.dart';
import 'file:///C:/Users/gennadyalheev/IdeaProjects/AMC_Hack_Eco_Work/front/lib/Res/LocalMemory.dart';
import 'package:amc_hack/Pages/MainPage/HistoryScreen.dart';
import 'package:amc_hack/Pages/MainPage/HomeScreen.dart';
import 'package:amc_hack/Res/Ticket.dart';
import 'package:amc_hack/Widgets/BackgroundImage.dart';
import 'package:amc_hack/Widgets/ListElement.dart';
import 'package:amc_hack/Widgets/TicketPage/SliderWidget.dart';
import 'package:amc_hack/Widgets/TicketPage/StyledDropDown.dart';
import 'package:amc_hack/Widgets/TicketPage/StyledTextField.dart';
import 'package:amc_hack/Widgets/TitleSubtitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DetailsPage extends StatefulWidget {

  State<StatefulWidget> createState() => _DetailsPage();
}

class _DetailsPage extends State<DetailsPage> with WidgetsBindingObserver  {


  Widget build(BuildContext context) {

    final Ticket ticket = ModalRoute.of(context).settings.arguments as Ticket;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              Text(ticket.title),
              Text(ticket.subtitle),
              Text(ticket.radius.toString())
            ],
          ),
        )
    );
  }
}