import 'package:flutter/material.dart';
import 'package:rankprof/pages/MiUsuario.dart';
import 'package:rankprof/pages/department.dart';
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
    '/home': (BuildContext context) =>  HomePage(),
    '/profesor': (BuildContext context) =>  Profesor(),
    '/department': (BuildContext context) =>  Department(),
    '/maintabs': (BuildContext context) =>  MainTabsPage(),
    '/starfeedback2': (BuildContext context) => StarFeedback2(),
    '/signin': (BuildContext context) => SignInPage(),
    '/materia': (BuildContext context) =>  ListMateriaPageState(),
    '/prof': (BuildContext context) =>  ListProfPage(),
    '/user': (BuildContext context) =>  MiUsuario(),

  } ;
}