import 'package:flutter/material.dart';

class ThemeProvider extends StatefulWidget {
  final Widget child;

  const ThemeProvider({Key? key, required this.child}) : super(key: key);

  @override
  _ThemeProviderState createState() => _ThemeProviderState();

  static _ThemeProviderState of(BuildContext context) {
    return context.findAncestorStateOfType<_ThemeProviderState>()!;
  }
}

class _ThemeProviderState extends State<ThemeProvider> {
  bool _isDarkMode = false;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: widget.child,
    );
  }
}
