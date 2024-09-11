import 'package:flutter/material.dart';
import 'package:portfolio/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(), // Default to light theme
      home: const HomePage(), // Removed theme-related parameters
    );
  }
}

