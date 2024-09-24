import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/CustomWidget/GradientTextWidget.dart';
import 'package:portfolio/CustomWidget/GradientTextSpan.dart';

class LoyceAbout extends StatelessWidget {
  final String name;

  LoyceAbout({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _about();
  }

  Container _about() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding for better layout
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
        children: [
          SizedBox(height: 40,),
          Wrap( // Wrap instead of Row to handle text overflow properly
            children: [

              Text(
                '    Hey there! I\'m ',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ),
              GradientText(
                name,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff877AF9),
                    Color(0xff90DFA8),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ],
          ),
          SizedBox(height: 50), // Add some spacing between the elements
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text.rich(
            TextSpan(
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 21,
                ),
              ),
              children: [
                TextSpan(
                  text:
                  'A software engineering student under PWC-Lithan in Davao City and currently a UX/UI and a Project Manager asset at HipDigital and Hiplife Asia. I focus on website designing and ',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20
                    )
                  )
                ),
                GradientTextSpan(
                  text: 'targets a user-friendly, flexible, and on the trend websites.',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff877AF9),
                      Color(0xff90DFA8),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                TextSpan(
                  text: 'It is my greatest honor to showcase my skills and talents, not limiting to programming. I am always happy to apply the experience and skills I\'ve obtained',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                      fontSize: 20
                    )
          )
                )
              ],
            ),
            textAlign: TextAlign.justify,
          )),
        ],
      ),
    );
  }
}
