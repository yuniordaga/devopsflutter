import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado/libs/auth.dart';
import 'package:flutter_avanzado/page/home/home_page.dart';
import 'package:flutter_avanzado/page/login/widgets/input_text_login.dart';
import 'package:flutter_avanzado/utils/responsive.dart';
import 'package:flutter_avanzado/widgets/circle_buttom.dart';
import 'package:flutter_avanzado/widgets/rounded_buttom.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback onGoToRegister,onGoToForgotPassword;


  const LoginForm({Key key,@required this.onGoToRegister,@required this.onGoToForgotPassword}) : super(key: key);

  void _goTo(BuildContext context ,User user){
    if(user!=null){
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }else{
      print("login failed");
    }
    
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
        child: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,      
            width: 330,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
               InputTextLogin(iconpath: Icon(Icons.alternate_email), placeholder:"Email"),
               SizedBox(height:responsive.ip(2)),
               InputTextLogin(iconpath: Icon(Icons.vpn_key), placeholder:"Password"),
               Container(
                 width: double.infinity,
                 alignment: Alignment.centerRight,
                 child: CupertinoButton(
                 padding: EdgeInsets.symmetric(vertical:15),
                 child: Text("Forogot password",style: TextStyle(fontSize: 13),),onPressed: onGoToForgotPassword,
                 ),
               ),
                SizedBox(height:responsive.ip(0.8)),
                 RoundedButtom(onPressed: (){}, label: "Sing In "),
                  SizedBox(height:responsive.ip(1)),
                  Text("Or with"),
                  SizedBox(height: responsive.ip(0.7),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleButtom(
                        iconpath: 'assets/pages/login/fb.svg',
                        backgrouncolor: Colors.blue,    
                        onPressed: () async {
                          final user =await Auth.instance.facebook(context);  
                          _goTo(context, user);
                          print("listo");                                             
                        },                
                      ),
                      SizedBox(width: 15,),
                      CircleButtom(
                        iconpath: 'assets/pages/login/g+.svg',
                        backgrouncolor: Colors.red,
                        onPressed: ()async {
                         final user = await Auth.instance.google(context);
                          _goTo(context, user);
                          print("listo");
                        },
                      ),
                    ],
                  ), 
                  SizedBox(height: responsive.ip(0.2)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("no tiene cuenta?"),
                      CupertinoButton(
                        child: Text("Sing Up"),
                        onPressed:onGoToRegister,
                      ),
                    ],
                  ),
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}