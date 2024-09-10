// home.dart
import 'package:flutter/material.dart';
import 'package:portfolio/Components/assistanceButtonComponent.dart';
import 'package:portfolio/Components/bannerComponent.dart';
import 'package:portfolio/Components/groupContactComponent.dart';
import 'package:portfolio/Components/statsComponent.dart';
import 'package:portfolio/Components/accordionComponent.dart';
import 'package:portfolio/models/accordion_model.dart';
import 'package:portfolio/Components/teamBannerComponent.dart';
import 'package:portfolio/models/profile_model.dart';
import 'package:portfolio/Theme/theme.dart';
import 'package:portfolio/Components/menubarComponent.dart'; // Ensure this import is correct

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme; // Use VoidCallback for the function type
  final bool isDarkMode;

  const HomePage({
    Key? key,
    required this.toggleTheme,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AccordionModel> genAccordionData = [];
  List<ProfileModel> profiles = [];

  @override
  void initState() {
    super.initState();
    _getAccordionData();
  }

  void _getAccordionData() {
    setState(() {
      genAccordionData = AccordionModel.genData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      color: widget.isDarkMode ? Colors.black : Colors.white,
      child: Scaffold(
        appBar: MenuBarComponent(
          isDarkMode: widget.isDarkMode,
          toggleTheme: widget.toggleTheme, // Access widget.toggleTheme
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AssistanceButton(),
              HeroBanner(),
              Stats(),
              AccordionComponent(accordionData: genAccordionData),
              TeamBannerComponent(),
              GroupContactComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
