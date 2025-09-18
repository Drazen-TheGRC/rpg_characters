import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromRGBO(162, 29, 19, 1);
  static const Color primaryAccent = Color.fromRGBO(120, 14, 14, 1);
  static const Color secondaryColor = Color.fromRGBO(45, 45, 45, 1);
  static const Color secondaryAccent = Color.fromRGBO(35, 35, 35, 1);

  static const Color titleColor = Color.fromRGBO(200, 200, 200, 1);
  static const Color textColor = Color.fromRGBO(150, 150, 150, 1);
  static const Color successColor = Color.fromRGBO(9, 149, 110, 1);
  static const Color highlightColor = Color.fromRGBO(212, 172, 13, 1);
}

ThemeData primaryTheme = ThemeData(
  // Seed color
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

  // Scaffold color
  scaffoldBackgroundColor: AppColors.secondaryAccent,

  // AppBar theme colors
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    surfaceTintColor: Colors.transparent,

    centerTitle: true,
  ),

  // Text theme
  textTheme: TextTheme().copyWith(
    titleMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
    bodyMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
  ),

  // Card theme
  cardTheme: CardThemeData(
    color: AppColors.secondaryColor.withValues(alpha: 0.5),
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(4),
    ),
    margin: EdgeInsets.only(bottom: 16),
    shadowColor: Colors.transparent,
  ),

  // Input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: AppColors.textColor,
    filled: true,
    fillColor: AppColors.secondaryColor.withValues(alpha: 0.5),
    border: InputBorder.none,
    labelStyle: TextStyle(color: AppColors.textColor),
  ),

  textSelectionTheme: TextSelectionThemeData(
    selectionColor: AppColors.textColor.withValues(alpha: 0.25),
    selectionHandleColor: AppColors.textColor,
  ),
);
