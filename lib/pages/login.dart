import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rankprof/behaviors/hiddenScrollBehavior.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  @override
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  String _password;

  bool _isLogginIn = false;

  _login() async {
    //Navigator.of(context).pushNamed('/home');
    if(_isLogginIn) return;
    setState(() {
      _isLogginIn = true;
    });

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Logeando usuario') ,
    ));

    final form = _formKey.currentState;


    if (!form.validate())
    {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      setState(() {
        _isLogginIn = false;
      });
      return;

    }

    form.save();
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context).pushNamed('/home');
    } catch(e){
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content:  Text(e),
        duration: Duration(seconds: 10) ,
        action: SnackBarAction(
          label: 'Dismiss' ,
          onPressed: (){
            _scaffoldKey.currentState.hideCurrentSnackBar();
          } ,
        ),
      ));
    } finally {
      setState(() {
        _isLogginIn = false;
      });
    }
  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey ,
      appBar: AppBar(
        title: Text('Login'),

      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: ScrollConfiguration(
            behavior: HiddenScrollBehavior(),
            child: Form(
              key: _formKey,
              child:  ListView(
                children: <Widget>[
                  FlutterLogo(
                    style: FlutterLogoStyle.markOnly ,
                    size: 200.0,
                  ),
                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress ,
                    decoration: InputDecoration(labelText: 'Email'),
                      validator: (val){
                        if (val.isEmpty){
                          return 'Por favor ingrese un correo valido';
                        } else{
                          return null;
                        }
                      },
                      onSaved: (val){
                        setState(() {
                          _email = val;
                        });
                      }

                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                      validator: (val){
                        if (val.isEmpty){
                          return 'Por favor ingrese la contraseña';
                        } else{
                          return null;
                        }
                      },
                      onSaved: (val){
                        setState(() {
                          _password = val;
                        });
                      }
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                        'Welcome' ,style: TextStyle(color: Color.fromARGB(255, 200, 200, 200))),
                  ) ,

                ],
              ),
            ) ,
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _login();
        } ,
        child: Icon(Icons.account_circle),
      ) ,
      persistentFooterButtons: <Widget>[
        FlatButton(onPressed: (){
          Navigator.of(context).pushNamed('/register');
        }, child: Text('No tengo una cuenta') ,)
      ],
    );
  }

}