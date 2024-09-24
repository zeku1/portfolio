import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false; // default to light mode

  bool get isDarkMode => _isDarkMode;

  Color get menuButtonColor => isDarkMode ? Colors.white : Colors.black;

  Color get closeButtonColor => isDarkMode ? Colors.white : Colors.black;

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  // Example light theme
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF0FFFF),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1C0E1C),),
    ),
    // Add more properties as needed
  );

  // Example dark theme
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF1C0E1C),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFF0FFFF),),
    ),
    // Add more properties as needed
  );

  void updateTheme(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    notifyListeners();
  }
}
