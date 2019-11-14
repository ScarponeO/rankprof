// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rankprof/pages/home.dart';
import 'package:rankprof/pages/sign_in.dart';
import 'package:rankprof/services/auth.dart';

class LandingPage extends StatelessWidget {
  
  LandingPage({@required this.auth});
  final AuthBase auth;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged, 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if(user == null) {
            return SignInPage(auth: auth,);
          }
          return HomePage(
            auth: auth,
          );

        } else{
          return Scaffold(
            body: Center(child: CircularProgressIndicator())
          );
        }
      }
    );
  }
}