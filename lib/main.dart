import 'package:flutter/material.dart';
import 'package:rankprof/pages/landingPage.dart';
import 'package:rankprof/routes.dart';
import 'package:rankprof/services/auth.dart';
import 'package:rankprof/src/providers/push_notificacions_provider.dart';
import 'package:rankprof/theme.dart';
import 'package:provider/provider.dart';


void main() => runApp(new TodoApp());

class TodoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();

    pushProvider.mensajes.listen((data) {
      //Navigator.pushNamed(context, routeName);
      print('Argumento del Push');
      print(data);

      navigatorKey.currentState.pushNamed('/home', arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBase>(builder: (context) => Auth(),),
        Provider<User>(builder: (context) => User(displayName: null, email: null, photoUrl: null, uid: null)),
      ],

       
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Todos app',
      home: LandingPage(),
      routes: buildAppRoutes(),
      theme: buildAppTheme(),
    ),
    );
    
    
  }
}
