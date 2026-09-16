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
      labelSmall: TextStyle(
        color: ColorManager.darkGray,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
  static final ThemeData dark = ThemeData();
}
