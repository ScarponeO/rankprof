import 'package:flutter/material.dart';
import 'package:rankprof/pages/department.dart';
import 'package:rankprof/pages/forgotPassword.dart';
import 'package:rankprof/pages/login.dart';
import 'package:rankprof/pages/mainTabs.dart';
import 'package:rankprof/pages/profesor.dart';
import 'package:rankprof/pages/register.dart';
import 'package:rankprof/pages/home.dart';
import 'package:rankprof/pages/sign_in.dart';
import 'package:rankprof/pages/starfeedback2.dart';
import 'package:rankprof/services/auth.dart';
import 'package:rankprof/pages/listap.dart';


Map<String, WidgetBuilder> buildAppRoutes() {
  return{
    '/login': (BuildContext context) =>  LoginPage(),
    '/register': (BuildContext context) =>  RegisterPage(),
    '/forgotpassword': (BuildContext context) =>  ForgotPasswordPage(),
    '/home': (BuildContext context) =>  HomePage(),
    '/profesor': (BuildContext context) =>  Profesor(),
    '/department': (BuildContext context) =>  Department(),
    '/maintabs': (BuildContext context) =>  MainTabsPage(),
    '/starfeedback2': (BuildContext context) => StarFeedback2(),
    '/signin': (BuildContext context) => SignInPage(auth: Auth()),
    '/listap': (BuildContext context) => Listap(),

  } ;
}