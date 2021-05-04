import 'package:amc_hack/Res/Const.dart';
import 'package:amc_hack/Res/Ticket.dart';
import 'package:amc_hack/Widgets/ElevatedCard.dart';
import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {

  Ticket ticket;

  ListElement({
    this.ticket
  });


  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      color: Const.colorTicketBackground,
      borderRadius: 20,
      internalPadding: 0,
      boxShadow: BoxShadow(
          spreadRadius: -18,
          blurRadius: 28,
          color: Color(0x41000000)
      ),

      child: TextButton(
        onPressed: (){},
        child:  Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticket.title,
                style: Const.textStyleTicketTitle),
              Text(
                ticket.subtitle,
                style: Const.textStyleTicketSubtitle),
            ],
          ),
        ),
      ),
    );
  }
}