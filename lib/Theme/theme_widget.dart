import 'package:flutter/material.dart';
import 'package:portfolio/Components/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemedWidget extends StatelessWidget {
  const ThemedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      color: themeProvider.currentTheme.scaffoldBackgroundColor, // Use scaffoldBackgroundColor for background color
      child: Center(
        child: Text(
          'Themed Widget',
          style: themeProvider.currentTheme.textTheme.headlineMedium, // Use headlineMedium instead of headline4
        ),
      ),
    );
  }
}
