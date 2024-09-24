import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/CustomWidget/GradientTextWidget.dart';
import 'package:portfolio/CustomWidget/GradientTextSpan.dart';

class ZedAbout extends StatelessWidget {
  final String name;

  ZedAbout({Key? key, required this.name}) : super(key: key);

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
                        'I am an Information Technology undergraduate at Philippine Women\'s College and a Software Engineering student at Lithan Educlaas. I am committed to ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20
                            )
                        )
                    ),
                    GradientTextSpan(
                      text: 'continuous learning and have a strong passion for gaining hands-on experience ',
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
                        text: 'hrough collaboration on real-world projects. Ever since I began my journey in web development, JavaScript has been my preferred programming language, serving as the foundation for my work with React, Vue, and Next.js.',
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
