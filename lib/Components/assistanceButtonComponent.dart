import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AssistanceButton extends StatefulWidget {
  final double topMargin;

  AssistanceButton({Key? key, required this.topMargin}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AssistanceButtonState();

}

class AssistanceButtonState extends State<AssistanceButton> {

  @override
  Widget build(BuildContext context) {
    return _assistanceText(widget.topMargin);
  }

  Widget _assistanceText(double topMargin) {
    return Container(
      margin: EdgeInsets.only(right: 95.0, top: topMargin),
      // Margin from the left and top edges
      child: GestureDetector(
        onTap: () {
          print('Need Assistance text clicked');
        },
        child: Text(
          'Need Assistance?',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
            color: Color(0xff8091F7), // Text color
            fontSize: 21,
          ),
          ),
        ),
      ),
    );
  }

}