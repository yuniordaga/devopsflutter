import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado/libs/auth.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _getAlias(String displayName){
    final List<String>tmp =displayName.split(" ");
    String alias="";
    if(tmp.length>0){
      alias =tmp[0][0];
      if(tmp.length==2){
        alias +=tmp[1][0];
        }
        }
        return Center(
          child: Text(
            alias,
            style: TextStyle(fontSize:30),
            ),
            );
    }
  @override
  Widget build(BuildContext context) {
    final user=Auth.instance.user;
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child:ListView(
                 children: [
                   SizedBox(height: 10,),
                   CircleAvatar(
                     radius: 40,
                     child:user.photoURL!=null?
                     ClipOval(
                       child: Image.network(
                         user.photoURL,
                         width: 75,
                         height: 75,
                         fit:BoxFit.contain,
                       ),
                     ):_getAlias(user.displayName),
                   ),
                   SizedBox(height: 10,),
                   Text(user.displayName,
                   textAlign: TextAlign.center,
                   style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                   ),
                   Text(user.email,
                   textAlign: TextAlign.center,
                   style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                   ),
                   SizedBox(height: 10,),
                   CupertinoButton( 
                     child: Text("Sign Out"),
                     color: Colors.blue,
                   onPressed: (){
                     Auth.instance.logOut(context);
                   },)
                 ],
               )
          ,
      ),
    ));
  }
}
