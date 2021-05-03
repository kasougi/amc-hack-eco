import 'package:amc_hack/Res/Const.dart';
import 'package:amc_hack/Widgets/ElevatedCard.dart';
import 'package:flutter/material.dart';

class TaskBar extends StatefulWidget {

  TaskBarController taskBarController;

  TaskBar({@required this.taskBarController});

  @override
  _TaskBarState createState() => _TaskBarState();
}

class _TaskBarState extends State<TaskBar> with SingleTickerProviderStateMixin {

  int total = 0;
  int sent = 0;
  int wait = 0;

  @override
  void initState() {
    widget.taskBarController.addListener(() {
      setState(() {
        total = widget.taskBarController.total;
        sent = widget.taskBarController.sent;
        wait = widget.taskBarController.wait;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      color: Const.colorTicketBackground,
      borderRadius: 30,
      boxShadow: BoxShadow(
          spreadRadius: -18,
          blurRadius: 28,
          color: Color(0x41000000)
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ваши запросы", style: Const.textStyleTicketTitle,),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          (total).toString(),
                          style: TextStyle(
                              fontSize: 90,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader =  LinearGradient(
                                colors: <Color>[
                                  Color(0xff8f9ffd),
                                  Color(0xffff9f77)],
                              ).createShader(
                                  Rect.fromLTWH(0.0, 200, 200.0, 0)
                              )
                          ),
                        ),
                        Text(
                            "Всего",
                            style: Const.textStyleTicketSubtitle),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          "История",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight:
                              FontWeight.normal,
                              fontFamily: "NonitoSans"
                          ),
                        ),
                        Text(
                          (sent).toString(),
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFC19FC1)
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),

                        Text(
                          "В очереди",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              fontFamily: "NonitoSans"
                          ),
                        ),

                        Text(
                          (wait).toString(),
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFC19FC1)
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TaskBarController extends ChangeNotifier{
  int total = 0;
  int wait = 0;
  int sent = 0;

  void set countWait(int wait) {
    this.wait = wait;
    total = wait+sent;
    notifyListeners();
  }

  void set countSent(int sent) {
    this.sent = sent;
    total = wait+sent;
    notifyListeners();
  }
}
