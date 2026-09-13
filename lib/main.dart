import 'package:evently/config/theme/theme_manager.dart';
import 'package:evently/core/sourses/routes_manager.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Evently());
}

class Evently extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.onboarding,
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.light ,
      locale: Locale('en'),
    );
  }
}