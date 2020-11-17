import 'package:after_layout/after_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado/libs/auth.dart';
import 'package:flutter_avanzado/page/home/home_page.dart';
import 'package:flutter_avanzado/page/login/login_page.dart';

class SplashPage extends StatefulWidget {
  static final routeName='splash';
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {

  @override
  void afterFirstLayout(BuildContext context) {
    final user= Auth.instance.user;
      if(user!=null){
        Navigator.pushReplacementNamed(context, HomePage.routeName);//el pushReplacementNamed elimina la pagina del historial de pagina en este caso el splash.dart
      }else{
        Navigator.pushReplacementNamed(context, LoginPage.routeName); //el pushReplacementNamed elimina la pagina del historial de pagina en este caso el splash.dart
      }
    }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}