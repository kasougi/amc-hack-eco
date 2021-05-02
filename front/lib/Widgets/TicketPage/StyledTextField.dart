import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget{

  TextEditingController textController;
  FocusNode focusNode;

  StyledTextField({@required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextField(
          autofocus: true,
          minLines: 18,
          maxLines: 18,
          controller: textController,

        ),
      ),
    );
  }

}