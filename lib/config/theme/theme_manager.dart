import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorManager.background,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: ColorManager.primaryBlue,
      ),
    ),
   
  );
  static final ThemeData dark = ThemeData();
}
