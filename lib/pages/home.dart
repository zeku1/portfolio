import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Components/assistanceButton.dart';
import 'package:portfolio/Components/banner.dart';

class HomePage extends StatelessWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const HomePage({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: [
          HeroBanner(),
          AssistanceButton(),
          const SizedBox(height: 20), // Add some spacing
          ElevatedButton(
            onPressed: () {
              toggleTheme();
            },
            child: Text(isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode'),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 150.0,
      titleSpacing: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[800] : Color(0xffF0FFFF),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
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
                'assets/icons/logo.svg',
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
                child: const Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff7981FC), Color(0xff8BE5DC)],
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent, // Make AppBar background transparent
      elevation: 0, // Remove default shadow
    );
  }
}
