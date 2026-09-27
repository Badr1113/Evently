import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static String _themeKey = "storedTheme";
  static String _langKey = "storedLang";
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void storeTheme(ThemeMode themeMode) async {
    if (themeMode == ThemeMode.light) {
      _prefs.setString(_themeKey, "Light");
    } else {
      _prefs.setString(_themeKey, "Dark");
    }
  }

  static ThemeMode? get getTheme {
    String? savedTheme = _prefs.getString(_themeKey);
    if (savedTheme == "Light") {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  static void storeLang(Locale locale) {
    if (locale == Locale("en")) {
      _prefs.setString(_langKey, "en");
    } else if (locale == Locale("ar")) {
      _prefs.setString(_langKey, "ar");
    }
  }

  static Locale? get getLang {
    String? savedLang = _prefs.getString(_langKey);
    if (savedLang == "en") {
      return Locale("en");
    } else if (savedLang == "ar") {
      return Locale("ar");
    }
  }
}
