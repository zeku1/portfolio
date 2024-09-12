import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoyceAbout extends StatefulWidget {
  final String name;

  LoyceAbout({Key? key, required this.name }) : super(key: key);

  @override
  State<LoyceAbout> createState() => AboutState();

}

class AboutState extends State<LoyceAbout>{

  @override
  Widget build(BuildContext context) {
    return _about();
  }

  Container _about(){
    return Container(
      child: Column(
        children: [
          Text('',style: GoogleFonts.poppins(textStyle: TextStyle()),)
        ],
      ),
    );
  }
}