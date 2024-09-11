import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const MenuBarComponent({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //automaticalluInplyLeading: false,
      toolbarHeight: 120.0,
      titleSpacing: 50,
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 30),
        decoration: const BoxDecoration(
          color: Color(0xffF0FFFF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
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
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              height: 45,
              width: 120,
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
                    color: Colors.white,
                    fontSize: 22,
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
