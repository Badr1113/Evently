import 'package:evently/features/auth/login/login_screen.dart';
import 'package:evently/features/intro_screen/intro.dart';
import 'package:flutter/widgets.dart';

class RoutesManager {
  static const onboarding = "/introScreen";
  static const loginScreen = "/loginScreen";
  static Map<String, WidgetBuilder> routes = {
    onboarding: (context) => Intro(),
    loginScreen: (context) => LoginScreen(),
  };
}
