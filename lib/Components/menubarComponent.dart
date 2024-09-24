import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/Components/theme_provider.dart';
import 'package:provider/provider.dart';


class MenuBarComponent extends StatefulWidget implements PreferredSizeWidget {
  const MenuBarComponent({super.key});

  @override
  State<MenuBarComponent> createState() => _MenuBarComponentState();

  @override
  Size get preferredSize => const Size.fromHeight(120.0); // Adjust height as needed
}

class _MenuBarComponentState extends State<MenuBarComponent> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // Access the current theme

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 120.0,
      titleSpacing: 50,
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: themeProvider.currentTheme.scaffoldBackgroundColor, // Updated to use currentTheme
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 15,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/icons/logo.svg',
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            GestureDetector(
              onTap: _openMenuModal,
              child: Container(
               margin: const EdgeInsets.only(top: 5.0),
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
                      style: TextStyle(
                      color: themeProvider.isDarkMode ? Color(0xff1C0E1C) : Color(0xffF0FFFF), // Adjusted color // Use dynamic color
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: themeProvider.currentTheme.scaffoldBackgroundColor, // Updated to use currentTheme
      elevation: 0,
    );
  }

  void _openMenuModal() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return _buildModalContent();
      },
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1), 
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );
      },
    );
  }

  Widget _buildModalContent() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Material(
    color: themeProvider.currentTheme.scaffoldBackgroundColor, // Updated to use currentTheme
    child: Stack(
      children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildMenuBarContainer(themeProvider),
          ),
          Positioned(
            top: 0.0,
            left: MediaQuery.of(context).size.width * 0.25,
            right: MediaQuery.of(context).size.width * 0.25,
            child: _buildCenteredContainer(themeProvider),
          ),
          Positioned(
            bottom: 110,
            left: 40,
            child: SvgPicture.asset(
              'assets/icons/logo.svg',
              width: 60,
              height: 60,
            ),
          ),
          Positioned(
          bottom: 105,
           right: 40,
         child: GestureDetector(
          onTap: () {
         Navigator.of(context).pop();
          },
        child: Container(
          height: 45,
           width: 90,
            decoration: BoxDecoration(
            gradient: const LinearGradient(
            colors: [Color(0xffFA847E), Color(0xffE8CD8A)],
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          'Close',
          style: TextStyle(
            color: themeProvider.isDarkMode ? Color(0xff1C0E1C) : Color(0xffF0FFFF), // Adjusted color
            fontSize: 21,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            left: 0,
            right: 140,
            child: Center(
              child: Text(
                'Need Assistance?',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color(0xff8091F7),
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuBarContainer(ThemeProvider themeProvider) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      color: themeProvider.currentTheme.scaffoldBackgroundColor, // Updated to use currentTheme
      child: Center(
        child: Text(
          '',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: themeProvider.currentTheme.textTheme.headlineMedium?.color ?? Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCenteredContainer(ThemeProvider themeProvider) {
    return Container(
     width: MediaQuery.of(context).size.width * 0.9, // Set a specific width (80% of screen width)
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20), // Adjust padding as needed
      decoration: BoxDecoration(
        gradient: themeProvider.isDarkMode
            ? const LinearGradient(
                colors: [
                  Color(0xFFBF82FF),
                  Color(0xFF8372FC),
                  Color(0xFF6A75FB),
                  Color(0xFFB9B3D2),
                  Color(0xFF8BE2D7),
                ],
              )
            : const LinearGradient(
                colors: [
                  Color(0xFFBF82FF),
                  Color(0xFF8372FC),
                  Color(0xFF6A75FB),
                  Color(0xFFB9B3D2),
                  Color(0xFF8BE2D7),
                ],
              ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
     child: Column(
  crossAxisAlignment: CrossAxisAlignment.center, // Center-aligns content horizontally
  children: [
    Text(
      "Our team's portfolio",
      textAlign: TextAlign.center, // Center-aligns the text within the Text widget
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 18,
          color: themeProvider.isDarkMode ? Color(0xff1C0E1C) : Color(0xffF0FFFF),
        ),
      ),
    ),

          const SizedBox(height: 40),
          const SizedBox(width: 40),
          _buildTeamMember('Nathaniel Abadies', 'Marketing Expert', themeProvider),
          _buildTeamMember('Loyce Nantes', 'Program Manager', themeProvider),
          _buildTeamMember('Ezekiel Lucena', 'Fullstack Developer', themeProvider),
          _buildTeamMember('Zedrick Zafra', 'Fullstack Developer', themeProvider),
          const SizedBox(height: 10),
          _buildDarkLightModeButton(themeProvider),
        ],
      ),
    );
  }

Widget _buildTeamMember(String name, String title, ThemeProvider themeProvider) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0),
    child: Column(
      children: [
        Text(
          name,
          textAlign: TextAlign.center,  // Correct placement of textAlign
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: themeProvider.isDarkMode ? Color(0xff1C0E1C) : Color(0xffF0FFFF), // Adjusted color// Adjusted color
              ),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 15,
                 color: themeProvider.isDarkMode ? Color(0xff1C0E1C) : Color(0xffF0FFFF), // Adjusted color
              ),
            ),
          ),
           Divider(
            color: themeProvider.isDarkMode ? Color(0xff1C0E1C) : Color(0xffF0FFFF),
            thickness: 1,
            height: 20,
          ),
        ],
      ),
    );
  }

Widget _buildDarkLightModeButton(ThemeProvider themeProvider) {
  return GestureDetector(
    onTap: () {
      themeProvider.updateTheme(!themeProvider.isDarkMode);
    },
    child: Container(
      height: 40,  // Reduced height for a thinner appearance
      width: 120,  // Reduced width to make it slimmer
      decoration: BoxDecoration(
        color: Colors.transparent,  // Transparent background
        borderRadius: BorderRadius.circular(50),  // Round edges for the entire button
        border: Border.all(
         color: themeProvider.isDarkMode ? Color(0xff1C0E1C) : Color(0xffF0FFFF),  // Border color based on theme
          width: 2.0,
        ),
      ),
      child: Stack(
        children: [
          // The oval-shaped slider that moves based on the theme
          AnimatedPositioned(
  duration: const Duration(milliseconds: 70),
  curve: Curves.easeInOutCubic,
  left: themeProvider.isDarkMode ? 60 : 5,  // Maintain a gap on both sides
  top: 4,  // Center vertically
  bottom: 4,  // Center vertically
  child: Container(
    height: 30,
    width: 50,  // Slightly reduced size for thinner oval slider
    decoration: BoxDecoration(
      color: Colors.transparent,  // Transparent oval slider
      borderRadius: BorderRadius.circular(25),  // Oval shape for the slider
      border: Border.all(
        color: themeProvider.isDarkMode ? Color(0xff1C0E1C) : Color(0xffF0FFFF),
        width: 2.0,
      ),
    ),
  ),
),
          // The sun and crescent moon icons inside the toggle
          Center(  // Wrap the Row in a Center widget to vertically align icons
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),  // Adjusted padding for thinner button
                  child: Icon(
                    Icons.wb_sunny,  // Sun icon for light mode
                   color: themeProvider.isDarkMode ? Color(0xff1C0E1C) : Color(0xffF0FFFF),  // Color based on theme
                    size: 20,  // Adjusted size for thinner button
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),  // Adjusted padding for thinner button
                  child: Icon(
                    Icons.brightness_3,  // Crescent moon icon for dark mode
                    color: themeProvider.isDarkMode ? Color(0xff1C0E1C) : Color(0xffF0FFFF), // Color based on theme
                    size: 20,  // Adjusted size for thinner button
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}
