import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        children: [],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 150.0,
      titleSpacing: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Color(0xffF0FFFF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0), // Adjust the radius as needed
            bottomRight: Radius.circular(15.0), // Adjust the radius as needed
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(55, 30, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // margin: const EdgeInsets.all(15),
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
                margin: EdgeInsets.only(top: 10.0),
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
                      colors: [Color(0xff7981FC), Color(0xff8BE5DC)]),
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
