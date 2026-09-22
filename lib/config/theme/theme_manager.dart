import 'package:evently/core/sourses/color_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.light(
      onSurface: ColorManager.primaryBlue,
      surface: ColorManager.background,
      onPrimary: ColorManager.white,
      primary: ColorManager.black,
      onSecondary: ColorManager.white,
      secondary: ColorManager.primaryBlue,
      surfaceContainer: ColorManager.offWhite,
    ),
    scaffoldBackgroundColor: ColorManager.background,
    primaryColor: ColorManager.white,
    dividerColor: ColorManager.offWhite,
    appBarTheme: AppBarThemeData(
      backgroundColor: ColorManager.background,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorManager.black,
      ),
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        decoration: TextDecoration.underline,
        decorationColor: ColorManager.primaryBlue,
        color: ColorManager.primaryBlue,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
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
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorManager.black,
      ),
      displayMedium: TextStyle(
        color: ColorManager.black,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primaryBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
    ),
    iconTheme: IconThemeData(color: ColorManager.primaryBlue),
    inputDecorationTheme: InputDecorationThemeData(
      hintStyle: TextStyle(color: ColorManager.darkGray),
      prefixIconColor: ColorManager.lightGray,
      suffixIconColor: ColorManager.lightGray,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorManager.offWhite),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorManager.primaryBlue),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.red),
        borderRadius: BorderRadius.circular(16),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorManager.lightGray),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme.dark(
      onSurface: ColorManager.brightBlue,
      surface: ColorManager.navyBlue,
      onPrimary: ColorManager.white,
      primary: ColorManager.white,
      onSecondary: ColorManager.white,
      secondary: ColorManager.brightBlue,
      surfaceContainer: ColorManager.darkBlue,
    ),
    scaffoldBackgroundColor: ColorManager.darkModeBackground,
    primaryColor: ColorManager.navyBlue,
    dividerColor: ColorManager.darkBlue,
    appBarTheme: AppBarThemeData(
      backgroundColor: ColorManager.darkModeBackground,
      foregroundColor: ColorManager.offWhite,
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        decoration: TextDecoration.underline,
        decorationColor: ColorManager.brightBlue,
        color: ColorManager.brightBlue,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: ColorManager.brightBlue,
      ),

      labelSmall: TextStyle(
        color: ColorManager.darkModeLightGray,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorManager.white,
      ),
      displayMedium: TextStyle(
        color: ColorManager.white,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    ),
    iconTheme: IconThemeData(color: ColorManager.brightBlue),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.brightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      hintStyle: TextStyle(color: ColorManager.darkModeLightGray),
      prefixIconColor: ColorManager.darkModeLightGray,
      suffixIconColor: ColorManager.darkModeLightGray,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorManager.darkBlue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorManager.darkModeLightGray),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.red),
        borderRadius: BorderRadius.circular(16),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: ColorManager.brightBlue),
      ),
    ),
  );
}
