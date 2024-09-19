import 'package:flutter/material.dart';
import 'package:portfolio/Components/theme_provider.dart'; // Adjust the path as needed
import 'package:provider/provider.dart';
import 'package:portfolio/pages/home.dart'; // Import your HomePage

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme, // Use the current theme
          home: HomePage(
            onThemeChanged: (bool isDarkMode) {
              // Optional: Handle theme changes if needed
            },
          ),
        );
      },
    );
  }
}
