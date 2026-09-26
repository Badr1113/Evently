import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // observer
  ThemeMode currentTheme = ThemeMode.light;
  bool get isDark => currentTheme == ThemeMode.dark;
  void changeCurrentTheme() {
    if (currentTheme == ThemeMode.light) {
      currentTheme = ThemeMode.dark;
    } else {
      currentTheme = ThemeMode.light;
    }
    notifyListeners(); // this notify the observers
  }
}
