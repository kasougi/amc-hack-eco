import 'package:amc_hack/Res/Ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ListElement.dart';

class ElementList extends StatefulWidget{

  ElementListController elementListController;
  bool shrinkWrap;
  ElementList({@required this.elementListController, this.shrinkWrap = true});

  @override
  _ElementListState createState() => _ElementListState();
}

class _ElementListState extends State<ElementList> {

  @override
  void initState() {
    super.initState();

    widget.elementListController.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return widget.elementListController.tickets.length > 0? ListView.builder(
      shrinkWrap: widget.shrinkWrap,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(0),
      itemCount: widget.elementListController.tickets.length,
      itemBuilder: (context, index) {
        return ListElement(
          ticket: widget.elementListController.tickets[index],
        );
      },
    ) : Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text("Ничего нет", style: TextStyle(color: Colors.grey),
          ),
        )
    );
  }
}

class ElementListController extends ChangeNotifier{
  List<Ticket> tickets = [];

  void add(Ticket ticket) {
    tickets.add(ticket);
    notifyListeners();
  }

  void remove(int id) {
    tickets.removeAt(id);
    notifyListeners();
  }
}
