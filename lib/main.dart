import 'package:flutter/material.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/Theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState(); // Removed the underscore to make it public
}

class MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  // Method to toggle the theme
  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(
        toggleTheme: _toggleTheme,
        isDarkMode: _isDarkMode,
      ),
    );
  }
}
