import 'package:flutter/material.dart';

class CustomTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Color(0xffF0FFFF),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffF0FFFF),
      foregroundColor: Colors.black,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Color(0xff1C0E1C),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff1C0E1C),
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(color: Colors.white),
  );

  // Method to get text style based on the theme
  static TextStyle getTextStyle(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: isDarkMode ? Colors.white : Colors.black,
      fontSize: 22,
    );
  }
}
