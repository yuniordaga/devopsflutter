import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado/libs/auth.dart';
import 'package:flutter_avanzado/page/home/home_page.dart';
import 'package:flutter_avanzado/page/login/widgets/input_text_login.dart';
import 'package:flutter_avanzado/utils/responsive.dart';
import 'package:flutter_avanzado/widgets/circle_buttom.dart';
import 'package:flutter_avanzado/widgets/rounded_buttom.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback onGoToLogin;
  const RegisterForm({Key key,@required this.onGoToLogin}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
            padding: EdgeInsets.symmetric(horizontal:15),
            color: Colors.white,      
            constraints: BoxConstraints(
              maxWidth: 400,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
              Text("New Account",style: TextStyle(color: Colors.cyan[900],fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'raleway'),),
              Text("Lorem ipsum dolor sit amet,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",style: TextStyle(fontWeight: FontWeight.w300),),
              SizedBox(height:responsive.ip(2)),
              InputTextLogin(iconpath: Icon(Icons.person_outline), placeholder:"Username"),
              SizedBox(height:responsive.ip(2)),
               InputTextLogin(iconpath: Icon(Icons.email), placeholder:"Email"),
               SizedBox(height:responsive.ip(2)),
               InputTextLogin(iconpath: Icon(Icons.lock), placeholder:"Password"),             
                SizedBox(height:responsive.ip(0.8)),
                InputTextLogin(iconpath: Icon(Icons.lock), placeholder:"Confirmar Password"),
                SizedBox(height:responsive.ip(0.8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(onPressed: widget.onGoToLogin, child: Text("Back to Log in")),
                    SizedBox(width: 10,),
                    RoundedButtom(onPressed: (){}, label: "Sing Up "),
                  ],
                ),
                SizedBox(height:responsive.ip(2)),                 
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}