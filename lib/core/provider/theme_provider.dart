import 'package:evently/core/local_storage/prefs_manager.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // observer
  ThemeMode currentTheme =  PrefsManager.getTheme  ?? ThemeMode.light ;
  bool get isDark => currentTheme == ThemeMode.dark;
  void changeCurrentTheme() {
    if (currentTheme == ThemeMode.light) {
      currentTheme = ThemeMode.dark;
    } else {
      currentTheme = ThemeMode.light;
    }
    PrefsManager.storeTheme(currentTheme);
    notifyListeners(); // this notify the observers
  }
}
