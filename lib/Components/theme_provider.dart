import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // Method to update the theme
  void updateTheme(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    notifyListeners();
  }

  // Getter to determine the scaffold background color based on the current theme
  Color get scaffoldBackgroundColor {
    return _isDarkMode ? Colors.black : Colors.white;
  }

  // Getter for AppBar color or other theme-related properties
  Color get appBarColor {
    return _isDarkMode ? Colors.grey[900]! : Colors.white;
  }
}
