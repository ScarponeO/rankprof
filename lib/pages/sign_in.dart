import 'package:flutter/material.dart';
import 'package:rankprof/pages/custom_raised_button.dart';
import 'package:rankprof/pages/home.dart';
import 'package:rankprof/services/auth.dart';

class SignInPage extends StatefulWidget {
  SignInPage({@required this.auth});
  final AuthBase auth;
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
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 120),
            Container(
              height: 150,
              child: logo(),
            ),
            SizedBox(height: 50),
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
              height: 50,
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
                    child:Image.asset('images/google-logo.png'),
                  ),
                ],
              ),
              color: Colors.white,
              radius: 2,
              onPressed: () {
                _signInWithGoogle().whenComplete(() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                });
              },
            ),
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
