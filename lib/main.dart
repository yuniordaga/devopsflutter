import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado/page/home/home_page.dart';
import 'package:flutter_avanzado/page/login/login_page.dart';
import 'package:flutter_avanzado/page/splash/splash.dart';

void main() {  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

   
  @override
  Widget build(BuildContext context) { 

    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot){

        if (snapshot.hasError) {
          return Center(child: Text("Firebase error"),);
        }
        if (snapshot.connectionState == ConnectionState.done){
          return MaterialApp(
                    title: 'Flutter',
                    debugShowCheckedModeBanner: false,      
                    home: SplashPage(),
                    routes: {
                      HomePage.routeName:(_)=>HomePage(),
                      SplashPage.routeName:(_)=>SplashPage(),
                      LoginPage.routeName:(_)=>LoginPage()
                      
                      },
                   );
        }
        return Center(
          child: CircularProgressIndicator(),
        );

      });   
    
  }
}
