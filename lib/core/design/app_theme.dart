import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(1, 166, 139, 1);
  static const Color backgroundColor = Color(0xfff0f4f4);
  static const Color orange = Color.fromRGBO(242, 92, 34, 1);
  static ThemeData themeData = ThemeData(
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    backgroundColor: backgroundColor,
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      headline2: TextStyle(fontSize: 40, color: Colors.white),
      headline4: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      bodyText1: TextStyle(
        color: Colors.green,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primaryColor)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColor,
    ),
  );
}
