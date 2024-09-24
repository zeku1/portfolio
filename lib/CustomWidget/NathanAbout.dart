import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/CustomWidget/GradientTextWidget.dart';
import 'package:portfolio/CustomWidget/GradientTextSpan.dart';

class NathanAbout extends StatelessWidget {
  final String name;

  NathanAbout({Key? key, required this.name}) : super(key: key);

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
                        'A Digital Business student at the PWC-Lithan Program in Davao City and currently a Marketing Associate at eduCLaaS. Nathaniel\'s primary responsibilityas a marketing associate is to work with teams from various Asian countries to plan and create graphics that are tailored to specific ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20
                            )
                        )
                    ),
                    GradientTextSpan(
                      text: 'tailored to specific cultural preferences and marketing needs. ',
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
                        text: 'Nathaniel also works for companies such as EdFolio and SkoolTek, where he serves as an SEO optimizer for website visibility and a marketing specialist.',
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
