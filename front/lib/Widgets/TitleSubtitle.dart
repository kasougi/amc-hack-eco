import 'package:amc_hack/Res/Const.dart';
import 'package:flutter/cupertino.dart';

class TitleSubtitle extends StatelessWidget {
  final String title, subtitle;

  TitleSubtitle({ @required this.title,@required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Const.textTitleSubtitleTitle,),
        Text(subtitle, style: Const.textTitleSubtitleSubtitle,)
      ],
    );
  }

}