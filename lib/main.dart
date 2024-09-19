import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/Components/theme_provider.dart'; // Import your ThemeProvider
import 'package:portfolio/pages/home.dart'; // Update with the correct import

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        // Add other providers if necessary
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio',
        theme: ThemeData.light(), // Example light theme
        darkTheme: ThemeData.dark(), // Example dark theme
        themeMode: ThemeMode.system, // Change as needed
        home: HomePage(
          onThemeChanged: (isDarkMode) {
            // Handle theme change
          },
        ),
      ),
    );
  }
}
