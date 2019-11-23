import 'package:flutter/material.dart';
import 'package:rankprof/pages/department.dart';
import 'package:rankprof/pages/home.dart';
import 'package:rankprof/pages/sign_in.dart';
import 'package:rankprof/services/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  LandingPage();
 

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignInPage();
              
            }
            return  Provider<User>.value(
              value: user,
              child: HomePage(),
            );

          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
