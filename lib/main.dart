import 'package:flutter/material.dart';
import 'package:rankprof/pages/login.dart';
import 'package:rankprof/pages/register.dart';
import 'package:rankprof/routes.dart';
import 'package:rankprof/theme.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TodoAppState();

}


class _TodoAppState extends State<TodoApp> {

  Widget rootPage = LoginPage();


  @override
  Widget build(BuildContext context) {

     return MaterialApp(
       title: 'Todos app',
       home:  rootPage,
       routes: buildAppRoutes(),
       theme: buildAppTheme(),
     );
  }

}

