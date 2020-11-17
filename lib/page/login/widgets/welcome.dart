import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/responsive.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive.of(context);    


    return AspectRatio(
      aspectRatio: 16 / 11,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Container(
            child: Stack(
              children: [
                Positioned(
                  top: constraints.maxHeight * 0.7,
                  child: Column(
                    children: [
                      Container(
                        height: 3,
                        width: constraints.maxWidth,
                        color: Colors.grey,                        
                      ),
                      SizedBox(height: 15,),
                      Text(
                        "Welcome! \n to ... ",
                      style: TextStyle(
                        fontSize: responsive.ip(3),
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight*0.3,
                    child: SvgPicture.asset(
                      'assets/pages/login/programmer.svg',
                       width: constraints.maxWidth*0.35,
                       )
                       ),
                       Positioned(
                  top: constraints.maxHeight*0.3,
                  right: 10,
                    child: SvgPicture.asset(
                      'assets/pages/login/hacker.svg',
                       width: constraints.maxWidth*0.4,
                       )
                       ),
              ],
            ),
          );
        },
      ),
    );
  }
}
