import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rankprof/pages/custom_raised_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInPageState();
  }
}

class _SignInPageState extends State<SignInPage> {
  @override
  bool _isLoggedIn;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;

  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
      Navigator.of(context).pushNamed('/home');
    } catch (err) {
      print(err);
    }
  }

  _logout() async {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        centerTitle: true,
        elevation: 2.0,
        title: Text(
          'RankProf',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 200),
            Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 50.0),
            CustomRaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('images/google-logo.png'),
                  Text(
                    'Sign In with Google',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Image.asset('images/google-logo.png'),
                  ),
                ],
              ),
              color: Colors.white,
              radius: 2,
              onPressed: () {
                _login();
              },
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
