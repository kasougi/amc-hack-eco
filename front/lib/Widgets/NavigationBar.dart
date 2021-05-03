
import 'dart:ui';

import 'package:amc_hack/Res/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class NavigationBar extends StatefulWidget {

  List<String> items;
  int currentIndex;
  void Function(int val) onTap;
  void Function() onPressed;

  NavigationBar({
    Key key,
    this.items,
    this.currentIndex,
    this.onTap,
    this.onPressed
  });

  State<StatefulWidget> createState() => _NavigationBar();
}
class _NavigationBar extends State<NavigationBar> with SingleTickerProviderStateMixin {

  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xE8FFFFFF),
                        Color(0xFFFFFFFF)
                      ]
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft:  Radius.circular(18),
                    topRight:  Radius.circular(18),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Element(
                      onTap: widget.onTap,
                      id: 0,
                      asset: widget.items[0],
                      currentIndex: widget.currentIndex,
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: new BoxDecoration(
                        color: Const.ThemeColor,
                        shape: BoxShape.circle,
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: widget.onPressed,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      )
                    ),
                    Element(
                      onTap: widget.onTap,
                      id: 1,
                      asset: widget.items[1],
                      currentIndex: widget.currentIndex,
                    )
                  ]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Element extends StatelessWidget{

  void Function(int val) onTap;
  int id, currentIndex;
  String asset;

  Element({
    this.onTap,
    this.id,
    this.asset,
    this.currentIndex
  });


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
          ),
          child: TextButton(
              onPressed: () {
                onTap(id);
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Column(
                children: [
                  Container(
                    width: 24,
                    padding: EdgeInsets.only(bottom: 2),
                    child:  SvgPicture.asset(
                      asset,
                      color: Colors.black,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 5,
                    height: 2,
                    decoration: BoxDecoration(
                        color: currentIndex == id? Const.ThemeColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(3)
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }

}