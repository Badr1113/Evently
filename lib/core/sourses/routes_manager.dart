import 'package:evently/features/intro_screen/intro.dart';
import 'package:flutter/widgets.dart';

class RoutesManager {
  static const onboarding = "/introScreen";
  static Map<String, WidgetBuilder> routes = {
    onboarding: (context) => Intro()
    };
}
