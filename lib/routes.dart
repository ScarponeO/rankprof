import 'package:flutter/material.dart';
import 'package:rankprof/pages/forgotPassword.dart';
import 'package:rankprof/pages/login.dart';
import 'package:rankprof/pages/mainTabs.dart';
import 'package:rankprof/pages/register.dart';
import 'package:rankprof/pages/home.dart';
import 'package:rankprof/pages/starfeedback.dart';
import 'package:rankprof/pages/starfeedback2.dart';
import 'package:rankprof/pages/starfeedback3.dart';
import 'package:rankprof/pages/starfeedback4.dart';
import 'package:rankprof/pages/starfeedback5.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return{
    '/login': (BuildContext context) =>  LoginPage(),
    '/register': (BuildContext context) =>  RegisterPage(),
    '/forgotpassword': (BuildContext context) =>  ForgotPasswordPage(),
    '/home': (BuildContext context) =>  HomePage(),
    '/maintabs': (BuildContext context) =>  MainTabsPage(),
    '/starfeedback': (BuildContext context) => StarFeedback(),
    '/starfeedback2': (BuildContext context) => StarFeedback2(),
    '/starfeedback3': (BuildContext context) => StarFeedback3(),
    '/starfeedback4': (BuildContext context) => StarFeedback4(),
    '/starfeedback5': (BuildContext context) => StarFeedback5(),
  } ;
}