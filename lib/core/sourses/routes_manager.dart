import 'package:evently/features/add_event/add_event.dart';
import 'package:evently/features/auth/forget_password/forget_password.dart';
import 'package:evently/features/auth/login/login_screen.dart';
import 'package:evently/features/auth/register/register_screen.dart';
import 'package:evently/features/onbording/onbording.dart';
import 'package:evently/features/main_layout/main_layout.dart';
import 'package:flutter/widgets.dart';

class RoutesManager {
  static const onboarding = "/onboadring";
  static const loginScreen = "/loginScreen";
  static const registerScreen = "/registerScreen";
  static const forgetPasswordScreen = "/forgetPasswordScreen";
  static const mainLayout = "/mainLayout";
  static const addEventScreen = "/addEventScreen";
  static Map<String, WidgetBuilder> routes = {
    onboarding: (context) => onbording(),
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    forgetPasswordScreen: (context) => ForgetPasswordScreen(),
    mainLayout: (context) => MainLayout(),
    addEventScreen: (context) => AddEventScreen(),
  };
}
