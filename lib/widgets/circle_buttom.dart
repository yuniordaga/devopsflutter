import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleButtom extends StatelessWidget {
  final String iconpath;
  final double size;
  final Color backgrouncolor;
  final VoidCallback onPressed;
  const CircleButtom(
      {Key key, this.size = 40,
      this.backgrouncolor, 
      @required this.onPressed,
      this.iconpath})
      : assert(iconpath != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        width: this.size,
        height: this.size,
        child: SvgPicture.asset(
          iconpath,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
          color: this.backgrouncolor ?? Colors.white,
          shape: BoxShape.circle,
        ),
      ),
      onPressed:this.onPressed,
    );
  }
}
