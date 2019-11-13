import 'package:flutter/material.dart';
import 'package:rankprof/pages/department.dart';
import 'package:rankprof/pages/login.dart';
import 'package:rankprof/pages/mainTabs.dart';
import 'package:rankprof/pages/profesor.dart';
import 'package:rankprof/pages/home.dart';
import 'package:rankprof/pages/sign_in.dart';
import 'package:rankprof/pages/starfeedback2.dart';
import 'package:rankprof/services/auth.dart';
import 'package:rankprof/pages/listMateria.dart';
import 'package:rankprof/pages/listProf.dart';


Map<String, WidgetBuilder> buildAppRoutes() {
  return{
    '/home': (BuildContext context) =>  HomePage(auth: Auth(),),
    '/login': (BuildContext context) =>  LoginPage(),
    '/profesor': (BuildContext context) =>  Profesor(),
    '/department': (BuildContext context) =>  Department(auth: Auth()),
    '/maintabs': (BuildContext context) =>  MainTabsPage(),
    '/starfeedback2': (BuildContext context) => StarFeedback2(),
    '/signin': (BuildContext context) => SignInPage(auth: Auth()),
    '/materia': (BuildContext context) =>  ListMateriaPageState(),
    '/prof': (BuildContext context) =>  ListProfPage(),

  } ;
}