import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/CustomWidget/GradientTextWidget.dart';
import 'package:portfolio/CustomWidget/GradientTextSpan.dart';

class ZekAbout extends StatelessWidget {
  final String name;

  ZekAbout({Key? key, required this.name}) : super(key: key);

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
                        'I am a dedicated Software Engineering student under PWC-Lithan specializing in full-stack development, with a strong focus on transforming creative designs into functional, high-performance web solutions. With a passion for both front-end and back-end development, I thrive on building ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20
                            )
                        )
                    ),
                    GradientTextSpan(
                      text: 'seamless digital experiences that combine innovation, efficiency, and reliability. ',
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
                        text: ' As I continue to deepen my knowledge and skills, I look forward to contributing to projects that push the boundaries of what\'s possible in web development.',
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
