import 'package:flutter/material.dart';

class CustomTheme {
  // Method to get text style based on the theme (dark or light)
  static TextStyle getTextStyle(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      color: isDarkMode ? Colors.white : Colors.black, // White for dark mode, black for light mode
      fontSize: 22,
    );
  }
}