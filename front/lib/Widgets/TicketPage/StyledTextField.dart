import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget{

  TextEditingController textController;
  FocusNode focusNode;

  StyledTextField({@required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextField(
          autofocus: true,
          minLines: 18,
          maxLines: 18,
          controller: textController,
          decoration: InputDecoration(
              hintText: "Комментарий"
          ),

        ),
      ),
    );
  }

}