import 'package:flutter/material.dart';
import 'package:rankprof/pages/forgotPassword.dart';
import 'package:rankprof/pages/login.dart';
import 'package:rankprof/pages/register.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return{
    '/login': (BuildContext context) => new LoginPage(),
    '/register': (BuildContext context) => new RegisterPage(),
    '/forgotpassword': (BuildContext context) => new ForgotPasswordPage(),

  } ;
}