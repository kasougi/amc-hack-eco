import 'file:///C:/Users/gennadyalheev/IdeaProjects/AMC_Hack_Eco_Work/front/lib/Res/Const.dart';
import 'package:amc_hack/Pages/CameraPage.dart';
import 'package:amc_hack/Pages/LocalMemory.dart';
import 'package:amc_hack/Pages/MainPage/HistoryScreen.dart';
import 'package:amc_hack/Pages/MainPage/HomeScreen.dart';
import 'package:amc_hack/Widgets/BackgroundImage.dart';
import 'package:amc_hack/Widgets/ListElement.dart';
import 'package:amc_hack/Widgets/TicketPage/SliderWidget.dart';
import 'package:amc_hack/Widgets/TicketPage/StyledTextField.dart';
import 'package:amc_hack/Widgets/TitleSubtitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TicketPage extends StatefulWidget {

  State<StatefulWidget> createState() => _TicketPage();
}

class _TicketPage extends State<TicketPage> with WidgetsBindingObserver  {

  double value = 0;
  TextEditingController textCon = TextEditingController();
  FocusScopeNode inputFocusNode = FocusScopeNode();

  @override


  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    inputFocusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild.unfocus();
          }
        },
        child: BackgroundImage(
          image: Image.asset("assets/t_background.png", fit: BoxFit.fitWidth,),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(top: 150, left: 10),
                        child: TitleSubtitle(title: "Мы готовы создать заявку", subtitle: "Необходимо еще пару деталей"),
                      )
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
                              child: StyledTextField(textController: textCon,),
                            ),
                            Text("Размер (метры)", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),),

                            SliderWidget(value: value),
                          ],
                        )
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
                    onPressed: (){Navigator.pop(context);
                    LocalMemory.listOfActive.add(ListElement());},
                    child: Text("Отправить", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFCAB3E3)),),
                  ),
                )
              )
            ],
          )
        ),
      )
    );
  }
}