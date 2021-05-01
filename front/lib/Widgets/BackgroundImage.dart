import 'package:flutter/material.dart';

class BackgroundImage extends StatefulWidget {

  Image image;
  Widget child;

  BackgroundImage({this.image, this.child});

  @override
  _BackgroundImageState createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            child: widget.image,
          ),
        ),
        widget.child
      ],
    );
  }
}

