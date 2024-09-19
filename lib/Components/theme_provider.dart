import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? _darkTheme : _lightTheme;

  ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1C0E1C), // Corrected syntax
   scaffoldBackgroundColor: const Color(0xFF1C0E1C), // Corrected syntax
    // Add other dark theme properties
  );

  ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFFF0FFFF), // Corrected syntax
    scaffoldBackgroundColor: const Color(0xFFF0FFFF), // Corrected syntax
    // Add other light theme properties
  );

  void updateTheme(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    notifyListeners(); // Notify the app to rebuild with the new theme
  }
}
