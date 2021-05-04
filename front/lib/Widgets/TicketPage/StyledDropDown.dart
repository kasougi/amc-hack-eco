import 'package:amc_hack/Res/Const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyledDropDown extends StatefulWidget{

  StyledDropDownData data;

  StyledDropDown({@required this.data});

  @override
  _StyledDropDownState createState() => _StyledDropDownState();
}

class _StyledDropDownState extends State<StyledDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButton<String>(
          value: widget.data.value,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Const.ThemeColor),
          underline: Container(
            height: 2,
            color: Const.ThemeColor,
          ),
          onChanged: (String newValue) {
            setState(() {
              widget.data.value = newValue;
            });
          },
          items: <String>['Нефтяное загрязнение', 'Пожар', 'Мусор']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class StyledDropDownData {
  String value;

  StyledDropDownData(this.value);

}