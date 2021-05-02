import 'package:amc_hack/Res/Const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget{

  double value;

  SliderWidget({@required this.value});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Text("0", style: Const.textSliderWidget, textAlign: TextAlign.right,),
          ),
          Expanded(
            flex: 12,
            child: Slider(
              activeColor: Colors.white,
              value: widget.value,
              min: 0,
              max: 1000,
              onChanged: (_value) {
                setState(
                      () {
                    widget.value = _value;
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Text("1000", style: Const.textSliderWidget, textAlign: TextAlign.left),
          ),
        ],
      ),
    );
  }
}