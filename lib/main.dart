import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rankprof/pages/login.dart';
import 'package:rankprof/pages/mainTabs.dart';
import 'package:rankprof/pages/register.dart';
import 'package:rankprof/pages/starfeedback.dart';
import 'package:rankprof/routes.dart';
import 'package:rankprof/src/providers/push_notificacions_provider.dart';
import 'package:rankprof/theme.dart';




void main() => runApp(new TodoApp());

class TodoApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  @override
  void initState(){
    super.initState();
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();

    pushProvider.mensajes.listen((data){

      //Navigator.pushNamed(context, routeName);
      print('Argumento del Push');
      print(data);

      navigatorKey.currentState.pushNamed('/home', arguments: data );
    });
  }
  Widget rootPage = LoginPage();  //---> Vista de arranque de la aplicacion

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       navigatorKey: navigatorKey,
       title: 'Todos app',
       home:  rootPage,
       routes: buildAppRoutes(),
       theme: buildAppTheme(),
     );
  }
}

