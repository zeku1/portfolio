import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/home.dart'; // Adjust the import based on your file structure
import 'package:portfolio/Components/theme_provider.dart'; // Adjust the import based on your file structure
import 'package:portfolio/Components/assistanceButtonComponent.dart'; // Adjust the import based on your file structure
import 'package:provider/provider.dart';

class MenuBarComponent extends StatefulWidget implements PreferredSizeWidget {
  const MenuBarComponent({super.key});

  @override
  State<MenuBarComponent> createState() => _MenuBarComponentState();

  @override
  Size get preferredSize => const Size.fromHeight(120.0); // Adjust the height
}

class _MenuBarComponentState extends State<MenuBarComponent> {
  bool _isDarkMode = false; // Toggle state for dark/light mode

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

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      themeProvider.updateTheme(_isDarkMode);
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
          color: themeProvider.scaffoldBackgroundColor, // Use the theme background color
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
                  MaterialPageRoute(builder: (context) => HomePage(onThemeChanged: (bool isDarkMode) {})), // Navigate to the HomePage
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
      backgroundColor: Colors.white, // Set the background color to white
      elevation: 0,
    );
  }

  // Modal content with a smaller menu bar at the top
  Widget _buildModalContent() {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Material(
      color: themeProvider.scaffoldBackgroundColor, // Use scaffoldBackgroundColor from your theme provider
      child: Stack(
        children: [
          // Container for menu bar, positioned at the top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildMenuBarContainer(), // Sticks to the top
          ),
          // Centered Container with team information, adjusted to avoid overlap
          Positioned(
            top: 0.0, // Position it below the top menu bar
            left: MediaQuery.of(context).size.width * 0.25, // Adjusted width for smaller modal
            right: MediaQuery.of(context).size.width * 0.25,
            child: _buildCenteredContainer(),
          ),
          // SVG logo in the bottom-left corner
          Positioned(
            bottom: 110,
            left: 40,
            child: SvgPicture.asset(
              'assets/icons/logo.svg', // Ensure this path is correct
              width: 60,
              height: 60,
            ),
          ),
          // Close button in the bottom-right corner
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
          // "Need assistance?" text with AssistanceButtonComponent style
          Positioned(
            bottom: 35, // Adjust as needed for spacing
            left: 0,
            right: 140,
            child: Center(
              child: Text(
                'Need Assistance?',
                style: GoogleFonts.poppins( // Apply AssistanceButtonComponent style
                  textStyle: const TextStyle(
                    color: Color(0xff8091F7), // Text color
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ),
          // Dark/Light mode toggle button
          Positioned(
            bottom: 0,
            right: 0,
            child: _buildDarkLightModeButton(),
          ),
        ],
      ),
    );
  }

  // Menu Bar container content
  Widget _buildMenuBarContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      color: Colors.white, // Background color for the menu bar at the top
      child: Center(
        child: Text(
          '', // Removed "Menu" text
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
      padding: const EdgeInsets.symmetric(vertical: 110, horizontal: 15),
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
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
          bottomLeft: Radius.circular(30.0), // Curved bottom edges
          bottomRight: Radius.circular(30.0), // Curved bottom edges
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
                height: 1.44, // Line height
              ),
            ),
          ),
          const SizedBox(height: 5),
          _buildTeamMember('Nathaniel Abadies', 'Marketing Expert'),
          _buildTeamMember('Loyce Nantes', 'Program Manager'),
          _buildTeamMember('Zedrick Zafra', 'Full Stack Developer'),
          _buildTeamMember('Ezekiel Lucena', 'Full Stack Developer'),
          const SizedBox(height: 10),
          _buildDarkLightModeButton(),
        ],
      ),
    );
  }

  Widget _buildTeamMember(String name, String role) {
    return Column(
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          role,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 1, color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDarkLightModeButton() {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: _toggleTheme, // Toggle theme on tap
      child: Container(
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
            themeProvider.isDarkMode ? 'Light Mode' : 'Dark Mode',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
