import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/pages/home.dart';

class MenuBarComponent extends StatefulWidget implements PreferredSizeWidget {
  const MenuBarComponent({super.key});

  @override
  State<MenuBarComponent> createState() => MenuBarComponentState();

  @override
  Size get preferredSize => Size.fromHeight(120.0); // Default height for AppBar
}

class MenuBarComponentState extends State<MenuBarComponent> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 500 ,
      titleSpacing: 50,
      flexibleSpace: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: const Color(0xffF0FFFF),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 15,
              offset: const Offset(0, 3), // changes position of shadow
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
                  MaterialPageRoute(builder: (context) => HomePage()),
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
              onTap: () {
                setState(() {
                  isActive = !isActive; // Toggle menu visibility
                }
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 5.0),
                height: 45,
                width: 90,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xff7981FC), Color(0xff8BE5DC)]),
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
      backgroundColor: Colors.transparent, // Make AppBar background transparent
      elevation: 0, // Remove default shadow
    );
  }
  // Default height for AppBar
}
