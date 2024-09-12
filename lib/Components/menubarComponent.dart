import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/home.dart'; // Ensure this import is correct

class MenuBarComponent extends StatefulWidget implements PreferredSizeWidget {
  const MenuBarComponent({super.key});

  @override
  State<MenuBarComponent> createState() => _MenuBarComponentState();

  @override
  Size get preferredSize => const Size.fromHeight(120.0); // Adjust the height
}

class _MenuBarComponentState extends State<MenuBarComponent> {
  bool isDarkMode = false; // Toggle state for dark/light mode

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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 120.0,
      titleSpacing: 50,
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: Colors.white, // Set the background color to white
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
                  MaterialPageRoute(builder: (context) => const HomePage()), // Ensure HomePage is defined and imported
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

  // Modal content sliding from top
  Widget _buildModalContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        color: Colors.white, // Ensure background is transparent
        child: Stack(
          children: [
            // Centered Container with team information
            Positioned(
              top: 150,
              left: MediaQuery.of(context).size.width * 0.25, // Smaller width
              right: MediaQuery.of(context).size.width * 0.25, // Smaller width
              child: _buildCenteredContainer(),
            ),
            // SVG logo in the bottom-left corner
            Positioned(
              bottom: 110,
              left: 40,
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
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
              bottom: 45, // Adjust as needed for spacing
              left: 0,
              right: 90,
              child: Center(
                child: Text(
                  'Need Assistance?',
                  style: GoogleFonts.poppins( // Apply AssistanceButtonComponent style
                    textStyle: const TextStyle(
                      color: Color(0xff8091F7), // Text color
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenteredContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFBF82FF),
            Color(0xFF8372FC),
            Color(0xFF6A75FB),
            Color(0xFFB9B3D2),
            Color(0xFF8BE2D7),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.44, // Line height
              ),
            ),
          ),
          const SizedBox(height: 10), // Less spacing for compact look
          _buildTeamMember('Nathaniel Abadies', 'Marketing Specialist'),
          _buildTeamMember('Loyce Nantes', 'Program Manager'),
          _buildTeamMember('Ezekiel Lucena', 'Fullstack Dev'),
          _buildTeamMember('Zedrick Zafra', 'Fullstack Dev'),
          const SizedBox(height: 10),
          _buildDarkLightToggle(), // Dark/Light mode toggle button
        ],
      ),
    );
  }

  Widget _buildTeamMember(String name, String title) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print('$name tapped');
          },
          child: Text(
            name,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.bold,
                height: 1.15, // Line height
              ),
            ),
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 20,
              height: 1.44, // Line height
            ),
          ),
        ),
        const Divider(), // Separate team members with a line
      ],
    );
  }

  Widget _buildDarkLightToggle() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDarkMode = !isDarkMode; // Toggle between dark and light mode
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 10),
            Text(
              isDarkMode ? 'Dark Mode' : 'Light Mode',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
