import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButtom extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const RoundedButtom({Key key, @required this.onPressed, @required this.label})
      : assert(label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero, //esto elimina el padding de este buttom
      child: Container(
        child: Text(this.label,
        style: TextStyle(color: Colors.white,fontFamily: 'sans'),),
        padding: EdgeInsets.symmetric(horizontal:30,vertical:10),
        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(30)),
        
      ),
      onPressed: this.onPressed,
    );
  }
}
