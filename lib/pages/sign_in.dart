import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rankprof/pages/custom_raised_button.dart';
import 'package:rankprof/pages/home.dart';
import 'package:rankprof/services/auth.dart';


class SignInPage extends StatefulWidget {
  final AuthBase auth;
  SignInPage({@required this.auth});

 
  @override
  State<StatefulWidget> createState() {
    return _SignInPageState();
  }
}

class _SignInPageState extends State<SignInPage> {
  Future<void> _signInWithGoogle() async {
    try {
      await widget.auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 120),
            Container(
              height: 150,
              child: logo(),
            ),
            SizedBox(height: 120),
            CustomRaisedButton(
              height: 50,
              width: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('images/google-logo.png'),
                  Text(
                    'Sign In with Google',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 20,
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Image.asset('images/google-logo.png'),
                  ),
                ],
              ),
              color: Colors.blue[200],
              radius: 2,
              onPressed: () {
                _signInWithGoogle().whenComplete(() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return HomePage(auth: Auth(),);
                  }));
                });
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      constraints: BoxConstraints.expand(
        height: 200,
      ),
      child: Image.asset(
        'images/rankprof-logo.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
