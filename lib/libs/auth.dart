import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_avanzado/page/login/login_page.dart';
import 'package:flutter_avanzado/utils/dialogs.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  Auth._interna(); //con esto crea un singleton
  static Auth get instance => Auth._interna(); //con esto crea un singleton

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User get user  {
    return _firebaseAuth.currentUser;
  }

  Future<User> facebook(BuildContext context) async{
    ProgressDialog progressDialog=ProgressDialog(context);
    try{      
      progressDialog.show();
      final LoginResult result=await FacebookAuth.instance.login();
      if(result.status==200){
        print("facebook login Ok");
        final AuthCredential credential=FacebookAuthProvider.credential(result.accessToken.token);
        final UserCredential userCredential=await _firebaseAuth.signInWithCredential(credential);
        final User user=userCredential.user;
        print("facebook username:${user.displayName}");
        //final userData = await FacebookAuth.instance.getUserData();
        //print(userData);  
        progressDialog.dismiss();
        return user;     
      }else if(result.status==403){
        print("facebook login cancelado");
      }else{
        print("login fallido");
      }
      progressDialog.dismiss();
      return null;
    }catch (e){
      print(e);
      progressDialog.dismiss();
      return null;
    }             
  }

  Future<User> google(BuildContext context) async {
    ProgressDialog progressDialog=ProgressDialog(context);
    try {
      progressDialog.show();
      final GoogleSignInAccount googleuser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication authentication =
          await googleuser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(idToken:authentication.idToken,accessToken: authentication.accessToken);

     final UserCredential userCredential =await _firebaseAuth.signInWithCredential(credential);

     final User user=userCredential.user; 

     print("username: ${user.displayName}");
     progressDialog.dismiss();

     return user;

    } catch (e) {
      print(e);
      progressDialog.dismiss();
      return null;
    }
  }
  Future<void> logOut(BuildContext context) async {
   final List<UserInfo> providers = (await user).providerData;
   String providerId ="firebase"; 
   for(final p in providers){
     if (p.providerId!='firebase'){
       providerId=p.providerId;
       break;
     }
     
   } 
   print("providerId : $providerId");
   switch (providerId){
     case "facebook.com":
       await FacebookAuth.instance.logOut();
       break;
     case "google.com":
       await _googleSignIn.signOut(); 
       break;
     case "password":
       break;
     case "phone":
       break;    

   }
   await _firebaseAuth.signOut();
   Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName,(_) => false); // con esto se elimina todo el historial de apginas y luego se va hacia el loginpage
  }
}
