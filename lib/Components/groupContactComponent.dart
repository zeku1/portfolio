import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CustomWidget/GradientTextWidget.dart';

class GroupContactComponent extends StatelessWidget{
  const GroupContactComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return _groupContact();
  }

  Container _groupContact(){
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: GradientText(
              'WE ARE JUST GETTING STARTED',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w900
                ),
              ),
              gradient: LinearGradient(
                  colors: [
                    Color(0xff877AF9),
                    Color(0xff90DFA8),
                  ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 50),
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/icons/epicSegment.svg',
                  width: 370,
                ),
                Positioned(
                    right: 0.0,
                    bottom: 5.0,
                    child: GestureDetector(
                      onTap: (){},
                      child: SvgPicture.asset('assets/icons/epicSegmentButton.svg'),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}