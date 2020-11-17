import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextLogin extends StatelessWidget {
  final String placeholder;
  final Widget iconpath;

  const InputTextLogin(
      {Key key, @required this.iconpath, @required this.placeholder})
      :assert(iconpath!=null && placeholder!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      prefix: Container(
        width: 40,
        height: 30,
        padding: EdgeInsets.all(2),
        child: this.iconpath,
      ),
      placeholder: this.placeholder,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
    );
  }
}
