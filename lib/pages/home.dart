import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 150.0,
      titleSpacing:
          0, // Removes default spacing for title if you want full control
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0, vertical: 30.0), // Adjust padding as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
                width: 60, // Adjust the width as needed
                height: 60, // Adjust the height as needed
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 45,
                width: 87,
                child: const Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 21),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xff7981FC), Color(0xff8BE5DC)]),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
  }
}
