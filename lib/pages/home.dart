import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Components/assistanceButton.dart';
import 'package:portfolio/pages/banner.dart'; // Ensure this path is correct
import 'package:portfolio/Theme/theme.dart'; // Ensure this path is correct

class HomePage extends StatelessWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const HomePage({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500), // Smooth transition for background color
      curve: Curves.easeInOut,
      color: isDarkMode ? Colors.black : Colors.white, // Background color based on theme
      child: Scaffold(
        appBar: appBar(context),
        backgroundColor: Colors.transparent, // Make Scaffold background transparent to show the AnimatedContainer color
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeroBanner(),
            const AssistanceButton(),
            const SizedBox(height: 20),
            _buildThemeToggle(context), // Add the custom toggle button here
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 150.0,
      titleSpacing: 0,
      flexibleSpace: AnimatedContainer(
        duration: const Duration(milliseconds: 500), // Smooth transition for AppBar background color
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[800] : const Color(0xffF0FFFF), // AppBar background color based on theme
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(55, 30, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/icons/logo.svg', // Ensure the file path is correct for the logo
                width: 60,
                height: 60,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 45,
                width: 90,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff7981FC), Color(0xff8BE5DC)],
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'Menu',
                    style: CustomTheme.getTextStyle(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0, // Remove shadow under AppBar
    );
  }

  Widget _buildThemeToggle(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleTheme(); // Toggle the theme on tap
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent, // Transparent background for the toggle
          borderRadius: BorderRadius.circular(20), // Oval shape
          border: Border.all(color: isDarkMode ? Colors.black : Colors.white, width: 2), // Border color based on theme
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Icon(
                        Icons.wb_sunny,
                        color: isDarkMode ? Colors.black : Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Icon(
                        Icons.nightlight_round,
                        color: isDarkMode ? Colors.black : Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: isDarkMode ? 60 : 0,
              right: isDarkMode ?  0: 60,
              child: Container(
                width: 90, // Adjust width to fit the icons
                height: 36, // Adjust height to fit the icons
                decoration: BoxDecoration(
                  color: Colors.transparent, // Transparent background for the oval indicator
                  borderRadius: BorderRadius.circular(30), // Circular shape for the indicator
                  border: Border.all(
                    color: isDarkMode ? Colors.black : Colors.white, // Border color based on theme
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}