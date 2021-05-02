import 'package:amc_hack/Res/Authentication.dart';
import 'package:amc_hack/Res/Const.dart';
import 'package:amc_hack/Widgets/BackgroundImage.dart';
import 'package:amc_hack/Widgets/ElevatedCard.dart';
import 'package:amc_hack/Widgets/ListElement.dart';
import 'package:amc_hack/Widgets/TaskBar.dart';
import 'package:amc_hack/Widgets/TitleSubtitle.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  bool _isSigningIn = false;

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
                  ListElement(title: "Пожар в сковородке", subtitle: "Вроде горит",),
                  ListElement(title: "Разлив нефтепродуктов", subtitle: "В ванной",),
                  ListElement(title: "Мусор в мусорке", subtitle: "В урне ли?",),
                ],
              ),
            ),
          ),
          FutureBuilder(
            future: Authentication.initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error initializing Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _isSigningIn
                      ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                      : OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                      onPressed: () async {
                        setState(() {
                          _isSigningIn = true;
                        });

                        User user =
                        await Authentication.signInWithGoogle(context: context);

                        setState(() {
                          _isSigningIn = false;
                        });
                      },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/google_logo.png"),
                            height: 35.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.orange
                ),
              );
            },
          ),
        ],
      )
    );
  }
}