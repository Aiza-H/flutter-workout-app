import 'package:flutter/material.dart';
import 'package:workouttrackerapps/dashboardd/pages/main_page.dart';
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
      menu: (context) => MainPage(),
    };
  }
}
