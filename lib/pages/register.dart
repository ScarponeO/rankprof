import 'package:flutter/material.dart';
import 'package:rankprof/behaviors/hiddenScrollBehavior.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {


  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),

      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: ScrollConfiguration(
            behavior: HiddenScrollBehavior(),
            child: ListView(
              children: <Widget>[
                FlutterLogo(
                  style: FlutterLogoStyle.markOnly ,
                size: 200.0,)
              ],
            ) ,
          )
      ),
    );
  }

}