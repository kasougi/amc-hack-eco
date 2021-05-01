import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {

  Widget child;
  BoxShadow boxShadow;
  Color color;
  double borderRadius;
  double internalPadding;

  ElevatedCard({
    this.child,
    this.boxShadow,
    this.borderRadius,
    this.color,
    this.internalPadding = 20
  });


  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              boxShadow
            ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: internalPadding, horizontal: internalPadding),
          child: child,
        )
    );
  }
}