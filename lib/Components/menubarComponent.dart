// menubarComponent.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Theme/theme.dart';

class MenuBarComponent extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const MenuBarComponent({
    Key? key,
    required this.isDarkMode,
    required this.toggleTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: AnimatedContainer(
        margin: EdgeInsets.only(top: 25),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[800] : const Color(0xffF0FFFF),
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
        padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
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
              onTap: toggleTheme,
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
                    style: CustomTheme.getTextStyle(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
