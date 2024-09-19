import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/home.dart'; 
import 'package:portfolio/Components/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/pages/home.dart';

class MenuBarComponent extends StatefulWidget implements PreferredSizeWidget {
  const MenuBarComponent({super.key});

  @override
  State<MenuBarComponent> createState() => _MenuBarComponentState();

  @override
  Size get preferredSize => const Size.fromHeight(120.0); // Adjust height as needed
}

class _MenuBarComponentState extends State<MenuBarComponent> {
  bool _isDarkMode = false; // Toggle state for dark/light mode

  // Function to toggle theme
  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode; // Toggle the mode
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      themeProvider.updateTheme(_isDarkMode); // Update the theme using ThemeProvider
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 120.0,
      titleSpacing: 50,
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: const Color(0xFFF0FFFF), // Use the new background color
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 15,
              offset: const Offset(0, 3), // Changes position of shadow
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
                  MaterialPageRoute(builder: (context) => const HomePage()), // Removed onThemeChanged param
                );
              },
              child: Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/icons/logo.svg', // Ensure this path is correct
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            GestureDetector(
              onTap: _openMenuModal, // Open the sliding modal
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
                child: const Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF0FFFF), // Set the background color to #F0FFFF
      elevation: 0,
    );
  }

  void _openMenuModal() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // Close when tapping outside
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5), // Background color
      transitionDuration: const Duration(milliseconds: 300), // Animation duration
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return _buildModalContent(); // Modal content
      },
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1), // Slide down from the top
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
    return Material(
      color: const Color(0xFFF0FFFF), // Use #F0FFFF for the modal background color
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildMenuBarContainer(),
          ),
          Positioned(
            top: 0.0,
            left: MediaQuery.of(context).size.width * 0.25, 
            right: MediaQuery.of(context).size.width * 0.25,
            child: _buildCenteredContainer(),
          ),
          Positioned(
            bottom: 110,
            left: 40,
            child: SvgPicture.asset(
              'assets/icons/logo.svg', // Ensure this path is correct
              width: 60,
              height: 60,
            ),
          ),
          Positioned(
            bottom: 105,
            right: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Close the modal
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
                child: const Center(
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.white,
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
                    color: Color(0xff8091F7), // Text color
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

  Widget _buildMenuBarContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      color: const Color(0xFFF0FFFF),
      child: Center(
        child: Text(
          '',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCenteredContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 130, horizontal: 30),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFBF82FF),
            Color(0xFF8372FC),
            Color(0xFF6A75FB),
            Color(0xFFB9B3D2),
            Color(0xFF8BE2D7),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30.0), // Curved bottom edges
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Our team's portfolio",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 18,
                color: Color(0xFFF0FFFF),
              ),
            ),
          ),
          const SizedBox(height: 5),
          _buildTeamMember('Nathaniel Abadies', 'Marketing Expert'),
          _buildTeamMember('Loyce Nantes', 'Program Manager'),
          _buildTeamMember('Zedrick Zafra', 'Fullstack Developer'),
           _buildTeamMember('Zedrick Zafra', 'Fullstack Developer'),
          const SizedBox(height: 40),
          _buildDarkLightModeButton(),
        ],
      ),
    );
  }

  Widget _buildTeamMember(String name, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 18,
                color: Color(0xFFF0FFFF), // Set appropriate text color
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildDarkLightModeButton() {
    return GestureDetector(
      onTap: _toggleTheme,
      child: Container(
        width: 100,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.white), // Border color
        ),
        child: Icon(
          _isDarkMode ? Icons.nights_stay : Icons.wb_sunny, // Dynamic icon
          color: _isDarkMode ? Colors.yellow : Colors.blue, // Dynamic icon color
        ),
      ),
    );
  }
}
