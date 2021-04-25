import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget{
  final String asset;
  final double size;

  SvgIcon(this.asset, {this.size = 22});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      child: SvgPicture.asset(asset,),
    );
  }


}