import 'package:flutter/material.dart';
//import 'package:workouttrackerapps/register/signin.dart';
import 'package:workouttrackerapps/dashboard.dart';
import 'package:workouttrackerapps/register/views/login_screen.dart';
import 'package:workouttrackerapps/register/views/register.dart';

class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-login';
  static const String authRegister = '/auth-register';
  static const String menu = '/menu';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => Login(),
      authRegister: (context) => Register(),
      menu: (context) => Dashboard(),
    };
  }
}
